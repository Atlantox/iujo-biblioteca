
from flask import Blueprint, request, jsonify

from models.BinnacleModel import BinnacleModel
from models.UserModel import UserModel
from helpers import *

binnacleController = Blueprint('binnacle', __name__)

def GetConnection():
    connection = getattr(binnacleController, 'connection', None)
    if connection is None:
        raise Exception('No se pudo obtener la conexión desde el Blueprint Binnacle')
    
    return connection


@binnacleController.route('/binnacle', methods=['GET'])
def GetBinnacle():
    connection = GetConnection()
    response = {}
    statusCode = 200
    error = ''
    token = GetTokenOfRequest(request)

    if token is None:
        error = 'Acceso denegado. Autenticación requerida'
        statusCode = 401
    
    if error == '':
        userModel = UserModel(connection)
        targetUser = userModel.GetUserByToken(token)
        if type(targetUser) is str:
            error = targetUser
            statusCode = 400
    
    if error == '':
        if targetUser['level'] in ['Admin', 'Super']:
            binacleModel = BinnacleModel(connection)
            binnacles = binacleModel.GetBinnacle()
        else:
            error = 'Usted no tiene los permisos'
            statusCode = 401
    
    response['success'] = error == ''
    if error == '':
        response['binnacle'] = binnacles
    else:
        response['message'] = error

    return jsonify(response), statusCode