from flask import Blueprint, request, jsonify
from flask_cors import cross_origin

from models.BookModel import BookModel
from models.UserModel import UserModel
from helpers import *

BOOK_LENGTH_CONFIG = {
    'call_number': {'max': 1, 'min':8},
    'title': {'max': 1, 'min':150},
    'author': {'max': 1, 'min':100},
    'editorial': {'max': 1, 'min':100},
    'shelf': {'max': 1, 'min':10},
    'description': {'max': 0, 'min':1000}
}

REQUIRED_FIELDS = [
    'title',
    'author',
    'editorial',
    'call_number',
    'shelf',
    'pages',
    'description',
    'state'
]

bookController = Blueprint('books', __name__)

def GetConnection():
    connection = getattr(bookController, 'connection', None)
    if connection is None:
        raise Exception('No se pudo obtener la conexión desde el Blueprint Book')
    
    return connection

@bookController.route('/books', methods=['POST'])
def CreateBook():
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
        cleanData = ValidateBookData(recievedData)
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



@bookController.route('/books', methods=['GET'])
def GetBooks():
    connection = GetConnection()
    bookModel = BookModel(connection)
    response = {}
    statusCode = 200
    error = ''
    token = GetTokenOfRequest(request)

    if token is None:
        books = bookModel.GetAvailableBooks()
    else:
        userModel = UserModel(connection)
        targetUser = userModel.GetUserByToken(token)
        if type(targetUser) is str:
            error = targetUser
            statusCode = 400
        else:
            books = bookModel.GetAllBooks()

    if books is None:
        error = 'No hay libros disponibles'

    response['success'] = error == ''
    if error == '':
        response['books'] = books
    else:
        response['message'] = error    

    return jsonify(response), statusCode


def ValidateBookData(recievedData):
    '''
    Recieves userData and validate them
    If the data has no issues, return the data cleaned
    '''
    error = ''

    cleanData = HasEmptyFields(REQUIRED_FIELDS, recievedData)
    if type(cleanData) is str:
        error = cleanData

    if error == '':
        lengthOK = ValidateLength(BOOK_LENGTH_CONFIG, cleanData)
        if lengthOK is not True:
            error = lengthOK

    '''
    if error == '':
        suspicious = HasSuspiciousCharacters(['nickname'], cleanData)
        if suspicious is not False:
            error = suspicious
    '''
    
    return cleanData if error == '' else error