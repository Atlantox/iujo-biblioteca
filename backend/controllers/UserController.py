from flask import Blueprint, request, jsonify
from flask_cors import cross_origin
from models.UserModel import UserModel
from helpers import *

NICKNAME_MIN, NICKNAME_MAX = 4, 50
USERNAME_MIN, USERNAME_MAX = 8, 50
PASSWORD_MIN, PASSWORD_MAX = 8, 50


userController = Blueprint('users', __name__)

def initModels():
    connection = getattr(userController, 'connection', None)
    if connection is None:
        raise Exception('No se pudo obtener la conexión desde el Blueprint Notes')
    
    return UserModel(connection)

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