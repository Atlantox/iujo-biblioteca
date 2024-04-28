from flask import Blueprint, request, jsonify
from flask_cors import cross_origin
from models.UserModel import UserModel
from helpers import *

REGISTER_USER_LENGTH_CONFIG = {
    'nickname': {'max': 50, 'min':4},
    'username': {'max': 50, 'min':8},
    'password': {'max': 50, 'min':8}
}

CREATE_USER_LENGTH_CONFIG = {
    'username': REGISTER_USER_LENGTH_CONFIG['username'],
    'password': REGISTER_USER_LENGTH_CONFIG['password'],
}

userController = Blueprint('users', __name__)

def GetConnection():
    connection = getattr(userController, 'connection', None)
    if connection is None:
        raise Exception('No se pudo obtener la conexión desde el Blueprint Notes')
    
    return connection


@userController.route('/users', methods=['GET'])
def GetUserData():
    connection = GetConnection()
    userModel = UserModel(connection)
    response = {}
    statusCode = 200
    error = ''
    token = GetTokenOfRequest(request)
    if token == None:
        error = 'Acceso denegado. Autenticación requerida'
        statusCode = 401
    
    if error == '':
        targetUser = userModel.GetUserByToken(token)
        if targetUser == None:
            error = 'Usuario no encontrado'
            statusCode = 401
    
    if error == '':
        publicData = userModel.GetUserPublicData(token)
        response = {'success': True, 'data': publicData}
    else:
        response = {'success': False, 'message': error}

    return jsonify(response), statusCode


@userController.route('/users', methods=['POST'])
def RegisterUser():
    connection = GetConnection()
    userModel = UserModel(connection)
    
    recievedData, error, statusCode = JsonExists(request)
    token = GetTokenOfRequest(request)
    if token == None:
        error = 'Acceso denegado. Autenticación requerida'
        statusCode = 401

    if error == '':
        targetUser = userModel.GetUserByToken(token)
        if type(targetUser) is str:
            error = targetUser
            statusCode = 400
    
    if error == '':
        cleanData = ValidateUserData(recievedData)
        if type(cleanData) is str:
            error = cleanData
            statusCode = 400

    if error == '':
        if userModel.UserHasPermisson(targetUser['id'], cleanData['level']) is False:
            error = 'Acción denegada'
            statusCode = 401  # Unauthorized

    if error == '':
        if userModel.UsernameExists(cleanData['username']) is True:
            error = 'Usuario ya registrado'
            statusCode = 400
    
    if error == '':
        created = userModel.CreateUser(cleanData)
        if created:
            message = 'Usuario creado correctamente'
        else:
            error = 'Hubo un error al crear al usuario'
            statusCode = 500

    if error != '':
        message = error
        
    success = error == ''
    return jsonify({'success': success, 'message': message}), statusCode


@userController.route('/login', methods=['POST'])
def TryLogin():
    connection = GetConnection()
    userModel = UserModel(connection)
    recievedData, error, statusCode = JsonExists(request)

    if error == '':
        token = GetTokenOfRequest(request)
        print(token)
        if token is not None:
            error = 'Usted ya está autenticado'
            statusCode = 401  # Unauthorized

    if error == '':
        requiredFields = [
            'username',
            'password'
        ]
        dataOK = HasEmptyFields(requiredFields, recievedData)
        if type(dataOK) is str:
            error = dataOK
            statusCode = 400  # Bad request

    if error == '':
        lengthOK = ValidateLength(CREATE_USER_LENGTH_CONFIG, recievedData)
        if lengthOK is not True:
            error = lengthOK
            statusCode = 400
    
    if error == '':
        loginResult = userModel.TryLogin(recievedData['username'], recievedData['password'])
        if loginResult is False:
            error = 'Credenciales inválidas'
        else:
            token = loginResult
            userData = userModel.GetUserPublicData(token)
            message = token
            
    if error != '':
        message = error
    
    success = error == ''
    response = {'success': success}

    if error == '':
        response['token'] = message
        response['userData'] = userData
    else:
        response['message'] = message
    
    return jsonify(response), statusCode


def ValidateUserData(recievedData):
    '''
    Recieves userData and validate them
    If the data has no issues, return the data cleaned
    '''
    error = ''
    requiredFields = [
        'nickname',
        'username',
        'password',
        'level'
    ]

    cleanData = HasEmptyFields(requiredFields, recievedData)
    if type(cleanData) is str:
        error = cleanData

    if error == '':
        lengthOK = ValidateLength(CREATE_USER_LENGTH_CONFIG, cleanData)
        if lengthOK is not True:
            error = lengthOK

    if error == '':
        suspicious = HasSuspiciousCharacters(['nickname'], cleanData)
        if suspicious is not False:
            error = suspicious
    
    return cleanData if error == '' else error