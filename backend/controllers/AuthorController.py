from flask import Blueprint, request, jsonify

from models.UserModel import UserModel
from models.AuthorModel import AuthorModel

from helpers import *

AUTHOR_LENGTH_CONFIG = {
    'name': {'min': 1, 'max':100}
}

REQUIRED_FIELDS = ['name']

authorController = Blueprint('author', __name__)

def GetConnection():
    connection = getattr(authorController, 'connection', None)
    if connection is None:
        raise Exception('No se pudo obtener la conexión desde el Blueprint Author')
    
    return connection

@authorController.route('/authors', methods=['POST'])
def CreateAuthor():
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
        cleanData = ValidateAuthorData(recievedData)
        if type(cleanData) is str:
            error = cleanData
            statusCode = 400

    if error == '':
        if userModel.UserHasPermisson(targetUser['id'], 'Autores') is False:
            error = 'Acción denegada'
            statusCode = 401  # Unauthorized

    if error == '':
        authorModel = AuthorModel(connection)
        if authorModel.GetAuthorByName(cleanData['name']) is not None:
            error = 'El autor ya está registrado'
            statusCode = 400
    
    if error == '':
        created = authorModel.CreateAuthor(cleanData)
        if created is False:
            error = "Hubo un error al crear el autor"
            statusCode = 500
        else:
            action = 'Creó el autor {0}'.format(cleanData['name'])
            authorModel.CreateBinnacle(targetUser['id'], action)
            message = 'Autor creado correctamente'

    if error != '':
        message = error
        
    success = error == ''
    return jsonify({'success': success, 'message': message}), statusCode


@authorController.route('/authors', methods=['GET'])
def GetAuthors():
    connection = GetConnection()
    authorModel = AuthorModel(connection)
    response = {}
    statusCode = 200

    authors = authorModel.GetAuthors()
    response = {
        'success': True,
        'authors': authors
    }

    return jsonify(response), statusCode


@authorController.route('/authors/<int:authorId>', methods=['GET'])
def GetAuthorById(authorId):
    connection = GetConnection()
    authorModel = AuthorModel(connection)
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
        if userModel.UserHasPermisson(targetUser['id'], 'Autores') is False:
            error = 'Acción denegada'
            statusCode = 401  # Unauthorized

    if error == '':
        targetAuthor = authorModel.GetAuthorById(authorId)
        if targetAuthor is None:
            error = 'Autor no encontrado'
            statusCode = 404  # Not found
    
    success = error == ''
    response = {'success': success}

    if error == '':
        response['author'] = targetAuthor
    else:
        response['message'] = error

    return jsonify(response), statusCode


@authorController.route('/authors/<int:authorId>', methods=['PUT'])
def UpdateAuthor(authorId):
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
        cleanData = ValidateAuthorData(recievedData)
        if type(cleanData) is str:
            error = cleanData
            statusCode = 400

    if error == '':
        if userModel.UserHasPermisson(targetUser['id'], 'Autores') is False:
            error = 'Acción denegada'
            statusCode = 401  # Unauthorized

    if error == '':
        authorModel = AuthorModel(connection)
        targetAuthor = authorModel.GetAuthorById(authorId)
        if targetAuthor is None:
            error = 'Autor no encontrado'
            statusCode = 404  # Not found

    if error == '':
        if targetAuthor.GetAuthorByName(cleanData['name']) is not None:
            error = 'Ya existe un autor con ese nombre'
            statusCode = 400

    if error == '':
        updated = targetAuthor.UpdateAuthor(authorId, cleanData)
        if updated is False:
            error = "Hubo un error al renombrar el autor"
            statusCode = 500
        else:
            action = 'Renombró el autor "{0}" por "{1}" '.format(targetAuthor['name'], cleanData['name'])
            targetAuthor.CreateBinnacle(targetUser['id'], action)
            message = 'Autor renombrado correctamente'

    if error != '':
        message = error
        
    success = error == ''
    return jsonify({'success': success, 'message': message}), statusCode


@authorController.route('/authors/<int:authorId>', methods=['DELETE'])
def DeleteAuthor(authorId):
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
        if userModel.UserHasPermisson(targetUser['id'], 'Autores') is False:
            error = 'Acción denegada'
            statusCode = 401  # Unauthorized

    if error == '':
        authorModel = AuthorModel(connection)
        targetAuthor = authorModel.GetAuthorById(authorId)
        if targetAuthor is None:
            error = 'Autor no encontrado'
            statusCode = 404  # Not found

    if error == '':
        deleted = authorModel.DeleteAuthor(authorId)
        if deleted is False:
            error = "Hubo un error al eliminar el autor"
            statusCode = 500
        else:
            action = 'Eliminó el autor "{0}"'.format(targetAuthor['name'])
            authorModel.CreateBinnacle(targetUser['id'], action)
            message = 'Autor eliminado correctamente'

    if error != '':
        message = error
        
    success = error == ''
    return jsonify({'success': success, 'message': message}), statusCode


def ValidateAuthorData(recievedData, exactData = True):
    error = ''

    cleanData = HasEmptyFields(REQUIRED_FIELDS, recievedData, exactData)
    if type(cleanData) is str:
        error = cleanData

    if error == '':
        lengthOK = ValidateLength(AUTHOR_LENGTH_CONFIG, cleanData)
        if lengthOK is not True:
            error = lengthOK
    
    return cleanData if error == '' else error