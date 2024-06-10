from flask import Blueprint, request, jsonify

from models.UserModel import UserModel
from models.StateModel import StateModel

from helpers import *

STATE_LENGTH_CONFIG = {
    'name': {'min': 5, 'max':30}
}

REQUIRED_FIELDS = ['name']

stateController = Blueprint('state', __name__)

def GetConnection():
    connection = getattr(stateController, 'connection', None)
    if connection is None:
        raise Exception('No se pudo obtener la conexión desde el Blueprint State')
    
    return connection

@stateController.route('/states', methods=['POST'])
def CreateState():
    connection = GetConnection()
    userModel = UserModel(connection)
    
    recievedData, error, statusCode = JsonExists(request)
    token = GetTokenOfRequest(request)
    if token is None:
        error = 'Acceso denegado. Autenticación requerida'
        statusCode = 401

    if error == '':
        targetUser = userModel.GetUserByToken(token)
        if type(targetUser) is str:
            error = targetUser
            statusCode = 400
    
    if error == '':
        cleanData = ValidateStateData(recievedData)
        if type(cleanData) is str:
            error = cleanData
            statusCode = 400

    if error == '':
        if userModel.UserHasPermisson(targetUser['id'], 'Estados de libros') is False:
            error = 'Acción denegada'
            statusCode = 401  # Unauthorized

    if error == '':
        stateModel = StateModel(connection)
        if stateModel.GetStateByName(cleanData['name']) is not None:
            error = 'El estado de libro ya está registrado'
            statusCode = 400
    
    if error == '':
        created = stateModel.CreateState(cleanData)
        if created is False:
            error = "Hubo un error al crear el estado del libro"
            statusCode = 500
        else:
            action = 'Creó el estado de libro {0}'.format(cleanData['name'])
            stateModel.CreateBinnacle(targetUser['id'], action)
            message = 'Estado de libro creado correctamente'

    if error != '':
        message = error
        
    success = error == ''
    return jsonify({'success': success, 'message': message}), statusCode


@stateController.route('/states', methods=['GET'])
def GetStates():
    connection = GetConnection()
    stateModel = StateModel(connection)
    response = {}
    statusCode = 200

    states = stateModel.GetStates()
    response = {
        'success': True,
        'states': states
    }

    return jsonify(response), statusCode


@stateController.route('/states/<string:stateName>', methods=['GET'])
def GetStateByName(stateName):
    connection = GetConnection()
    stateModel = StateModel(connection)
    userModel = UserModel(connection)
    error = ''
    statusCode = 200

    token = GetTokenOfRequest(request)
    if token is None:
        error = 'Acceso denegado. Autenticación requerida'
        statusCode = 401

    if error == '':
        targetUser = userModel.GetUserByToken(token)
        if type(targetUser) is str:
            error = targetUser
            statusCode = 400

    if error == '':
        if userModel.UserHasPermisson(targetUser['id'], 'Estados de libros') is False:
            error = 'Acción denegada'
            statusCode = 401  # Unauthorized

    if error == '':
        targetState = stateModel.GetStateByName(stateName)
        if targetState is None:
            error = 'Estado de libro no encontrado'
            statusCode = 404  # Not found
    
    success = error == ''
    response = {'success': success}

    if error == '':
        response['state'] = targetState
    else:
        response['message'] = error

    return jsonify(response), statusCode


@stateController.route('/states/<string:stateName>', methods=['PUT'])
def UpdateState(stateName):
    connection = GetConnection()
    userModel = UserModel(connection)
    
    recievedData, error, statusCode = JsonExists(request)
    token = GetTokenOfRequest(request)
    if token is None:
        error = 'Acceso denegado. Autenticación requerida'
        statusCode = 401

    if error == '':
        targetUser = userModel.GetUserByToken(token)
        if type(targetUser) is str:
            error = targetUser
            statusCode = 400
    
    if error == '':
        cleanData = ValidateStateData(recievedData)
        if type(cleanData) is str:
            error = cleanData
            statusCode = 400

    if error == '':
        if userModel.UserHasPermisson(targetUser['id'], 'Estados de libros') is False:
            error = 'Acción denegada'
            statusCode = 401  # Unauthorized

    if error == '':
        stateModel = StateModel(connection)
        targetState = stateModel.GetStateByName(stateName)
        if targetState is None:
            error = 'Estado de libro no encontrado'
            statusCode = 404  # Not found

    if error == '':
        if stateModel.GetStateByName(cleanData['name']) is not None:
            error = 'Ya existe un estado de libro con ese nombre'
            statusCode = 400

    if error == '':
        updated = stateModel.UpdateState(stateName, cleanData)
        if updated is False:
            error = "Hubo un error al renombrar el estado de libro"
            statusCode = 500
        else:
            action = 'Renombró el estado de libro "{0}" por "{1}" '.format(targetState['name'], cleanData['name'])
            stateModel.CreateBinnacle(targetUser['id'], action)
            message = 'Estado de libro renombrado correctamente'

    if error != '':
        message = error
        
    success = error == ''
    return jsonify({'success': success, 'message': message}), statusCode


@stateController.route('/states/<string:stateName>', methods=['DELETE'])
def DeleteState(stateName):
    connection = GetConnection()
    userModel = UserModel(connection)
    error = ''
    statusCode = 200
    
    token = GetTokenOfRequest(request)
    if token is None:
        error = 'Acceso denegado. Autenticación requerida'
        statusCode = 401

    if error == '':
        targetUser = userModel.GetUserByToken(token)
        if type(targetUser) is str:
            error = targetUser
            statusCode = 400

    if error == '':
        if userModel.UserHasPermisson(targetUser['id'], 'Estados de libros') is False:
            error = 'Acción denegada'
            statusCode = 401  # Unauthorized

    if error == '':
        stateModel = StateModel(connection)
        targetState = stateModel.GetStateByName(stateName)
        if targetState is None:
            error = 'Estado de libro no encontrado'
            statusCode = 404  # Not found

    if error == '':
        bookOfState = stateModel.GetBooksOfState(stateName)
        if bookOfState is not None:
            error = 'No se puede borrar el estado del libro porque existen libros que poseen este estado'
            error = 400

    if error == '':
        deleted = stateModel.DeleteState(stateName)
        if deleted is False:
            error = "Hubo un error al eliminar el estado de libro"
            statusCode = 500
        else:
            action = 'Eliminó el estado de libro "{0}"'.format(targetState['name'])
            stateModel.CreateBinnacle(targetUser['id'], action)
            message = 'Estado de libro eliminado correctamente'

    if error != '':
        message = error
        
    success = error == ''
    return jsonify({'success': success, 'message': message}), statusCode


def ValidateStateData(recievedData, exactData = True):
    error = ''

    cleanData = HasEmptyFields(REQUIRED_FIELDS, recievedData, exactData)
    if type(cleanData) is str:
        error = cleanData

    if error == '':
        lengthOK = ValidateLength(STATE_LENGTH_CONFIG, cleanData)
        if lengthOK is not True:
            error = lengthOK
    
    return cleanData if error == '' else error