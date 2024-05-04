from flask import Blueprint, request, jsonify
from flask_cors import cross_origin

from models.UserModel import UserModel
from models.CategoryModel import CategoryModel

from helpers import *

CATEGORY_LENGTH_CONFIG = {
    'name': {'min': 1, 'max':50}
}

REQUIRED_FIELDS = ['name']

categoryController = Blueprint('category', __name__)

def GetConnection():
    connection = getattr(categoryController, 'connection', None)
    if connection is None:
        raise Exception('No se pudo obtener la conexión desde el Blueprint Category')
    
    return connection

@categoryController.route('/categories', methods=['POST'])
def CreateCategory():
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
        cleanData = ValidateCategoryData(recievedData)
        if type(cleanData) is str:
            error = cleanData
            statusCode = 400

    if error == '':
        if userModel.UserHasPermisson(targetUser['id'], 'Categorías') is False:
            error = 'Acción denegada'
            statusCode = 401  # Unauthorized

    if error == '':
        categoryModel = CategoryModel(connection)
        if categoryModel.GetCategoryByName(cleanData['name']) is not None:
            error = 'La categoría ya está registrada'
            statusCode = 400
    
    if error == '':
        created = categoryModel.CreateCategory(cleanData)
        if type(created) is str:
            error = created
            statusCode = 500
        else:
            action = 'Creó la categoría {0}'.format(cleanData['name'])
            categoryModel.CreateBinnacle(targetUser['id'], action)
            message = 'Categoría creada correctamente'

    if error != '':
        message = error
        
    success = error == ''
    return jsonify({'success': success, 'message': message}), statusCode



@categoryController.route('/categories', methods=['GET'])
def GetBooks():
    connection = GetConnection()
    categoryModel = CategoryModel(connection)
    response = {}
    statusCode = 200

    categories = categoryModel.GetCategories()
    categoriesAsArray = []
    if categories is None:
        categoriesAsArray = []
    else:
        for category in categories:
            categoriesAsArray.append(category['name'])

    response = {
        'status': True,
        'categories': categoriesAsArray
    }

    return jsonify(response), statusCode


def ValidateCategoryData(recievedData):
    error = ''

    cleanData = HasEmptyFields(REQUIRED_FIELDS, recievedData)
    if type(cleanData) is str:
        error = cleanData

    if error == '':
        lengthOK = ValidateLength(CATEGORY_LENGTH_CONFIG, cleanData)
        if lengthOK is not True:
            error = lengthOK
    
    return cleanData if error == '' else error