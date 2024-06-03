from flask import Blueprint, request, jsonify

from models.UserModel import UserModel
from models.EditorialModel import EditorialModel

from helpers import *

EDITORIAL_LENGTH_CONFIG = {
    'name': {'min': 1, 'max':100}
}

REQUIRED_FIELDS = ['name']

editorialController = Blueprint('editorial', __name__)

def GetConnection():
    connection = getattr(editorialController, 'connection', None)
    if connection is None:
        raise Exception('No se pudo obtener la conexión desde el Blueprint Editorial')
    
    return connection

@editorialController.route('/editorials', methods=['POST'])
def CreateEditorial():
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
        cleanData = ValidateEditorialData(recievedData)
        if type(cleanData) is str:
            error = cleanData
            statusCode = 400

    if error == '':
        if userModel.UserHasPermisson(targetUser['id'], 'Editoriales') is False:
            error = 'Acción denegada'
            statusCode = 401  # Unauthorized

    if error == '':
        editorialModel = EditorialModel(connection)
        if editorialModel.GetEditorialByName(cleanData['name']) is not None:
            error = 'La editorial ya está registrada'
            statusCode = 400
    
    if error == '':
        created = editorialModel.CreateEditorial(cleanData)
        if created is False:
            error = "Hubo un error al crear la editorial"
            statusCode = 500
        else:
            action = 'Creó la editorial {0}'.format(cleanData['name'])
            editorialModel.CreateBinnacle(targetUser['id'], action)
            message = 'Editorial creada correctamente'

    if error != '':
        message = error
        
    success = error == ''
    return jsonify({'success': success, 'message': message}), statusCode


@editorialController.route('/editorials', methods=['GET'])
def GetEditorials():
    connection = GetConnection()
    editorialModel = EditorialModel(connection)
    response = {}
    statusCode = 200

    editorials = editorialModel.GetEditorials()
    response = {
        'success': True,
        'editorials': editorials
    }

    return jsonify(response), statusCode


@editorialController.route('/editorials/<int:editorialId>', methods=['GET'])
def GetEditorialById(editorialId):
    connection = GetConnection()
    editorialModel = EditorialModel(connection)
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
        if userModel.UserHasPermisson(targetUser['id'], 'Editoriales') is False:
            error = 'Acción denegada'
            statusCode = 401  # Unauthorized

    if error == '':
        targetEditorial = editorialModel.GetEditorialById(editorialId)
        if targetEditorial is None:
            error = 'Editorial no encontrada'
            statusCode = 404  # Not found
    
    success = error == ''
    response = {'success': success}

    if error == '':
        response['editorial'] = targetEditorial
    else:
        response['message'] = error

    return jsonify(response), statusCode


@editorialController.route('/editorials/<int:editorialId>', methods=['PUT'])
def UpdateEditorial(editorialId):
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
        cleanData = ValidateEditorialData(recievedData)
        if type(cleanData) is str:
            error = cleanData
            statusCode = 400

    if error == '':
        if userModel.UserHasPermisson(targetUser['id'], 'Editoriales') is False:
            error = 'Acción denegada'
            statusCode = 401  # Unauthorized

    if error == '':
        editorialModel = EditorialModel(connection)
        targetEditorial = editorialModel.GetEditorialById(editorialId)
        if targetEditorial is None:
            error = 'Editorial no encontrado'
            statusCode = 404  # Not found

    if error == '':
        if targetEditorial.GetEditorialByName(cleanData['name']) is not None:
            error = 'Ya existe una editorial con ese nombre'
            statusCode = 400

    if error == '':
        updated = targetEditorial.UpdateEditorial(editorialId, cleanData)
        if updated is False:
            error = "Hubo un error al renombrar la editorial"
            statusCode = 500
        else:
            action = 'Renombró la editorial "{0}" por "{1}" '.format(targetEditorial['name'], cleanData['name'])
            targetEditorial.CreateBinnacle(targetUser['id'], action)
            message = 'Editorial renombrada correctamente'

    if error != '':
        message = error
        
    success = error == ''
    return jsonify({'success': success, 'message': message}), statusCode


@editorialController.route('/editorials/<int:editorialId>', methods=['DELETE'])
def DeleteEditorial(editorialId):
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
        if userModel.UserHasPermisson(targetUser['id'], 'Editoriales') is False:
            error = 'Acción denegada'
            statusCode = 401  # Unauthorized

    if error == '':
        editorialModel = EditorialModel(connection)
        targetEditorial = editorialModel.GetEditorialById(editorialId)
        if targetEditorial is None:
            error = 'Editorial no encontrada'
            statusCode = 404  # Not found

    if error == '':
        deleted = editorialModel.DeleteEditorial(editorialId)
        if deleted is False:
            error = "Hubo un error al eliminar la editorial"
            statusCode = 500
        else:
            action = 'Eliminó la editorial "{0}"'.format(targetEditorial['name'])
            editorialModel.CreateBinnacle(targetUser['id'], action)
            message = 'Editorial eliminada correctamente'

    if error != '':
        message = error
        
    success = error == ''
    return jsonify({'success': success, 'message': message}), statusCode


def ValidateEditorialData(recievedData, exactData = True):
    error = ''

    cleanData = HasEmptyFields(REQUIRED_FIELDS, recievedData, exactData)
    if type(cleanData) is str:
        error = cleanData

    if error == '':
        lengthOK = ValidateLength(EDITORIAL_LENGTH_CONFIG, cleanData)
        if lengthOK is not True:
            error = lengthOK
    
    return cleanData if error == '' else error