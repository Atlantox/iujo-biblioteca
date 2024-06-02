from flask import Blueprint, request, jsonify
from flask_cors import cross_origin

from models.BookModel import BookModel
from models.UserModel import UserModel
from models.CategoryModel import CategoryModel
from models.LoanModel import LoanModel

from helpers import *

BOOK_LENGTH_CONFIG = {
    'call_number': {'min': 1, 'max':8},
    'title': {'min': 1, 'max':150},
    'author': {'min': 1, 'max':100},
    'editorial': {'min': 1, 'max':100},
    'shelf': {'min': 1, 'max':10},
    'description': {'min': 0, 'max':1000, 'optional': True}
}

REQUIRED_FIELDS = [
    'title',
    'author',
    'editorial',
    'call_number',
    'shelf',
    'pages',
    'description',
    'state',
    'categories'
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
        if userModel.UserHasPermisson(targetUser['id'], 'Libros') is False:
            error = 'Acción denegada'
            statusCode = 401  # Unauthorized

    if error == '':
        bookModel = BookModel(connection)
        if bookModel.GetBookByCallNumber(cleanData['call_number']) is not None:
            error = 'La cota ya está registrada'
            statusCode = 400

    if error == '':
        if cleanData['categories'] == []:
            error = 'Seleccione al menos una categoría'
            statusCode = 400

    if error == '':
        categoryModel = CategoryModel(connection)
        categoriesExists = categoryModel.CategoriesExists(cleanData['categories'])
        if categoriesExists is False:
            error = 'Alguna de las categorías no encaja con las registradas'
            statusCode = 400

    if error == '':
        stateExists = bookModel.GetStateByName(cleanData['state'])
        if stateExists is None:
            error = 'El estado seleccionado no existe'
            statusCode = 400
    
    if error == '':
        created = bookModel.CreateBook(cleanData)
        if type(created) is str:
            error = created
            statusCode = 500
        else:
            action = 'Creó el Libro "{0}"'.format(cleanData['title'])
            bookModel.CreateBinnacle(targetUser['id'], action)
            message = 'Libro creado correctamente'

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

    books = bookModel.GetAllBooks()

    if books is None:
        error = 'No hay libros disponibles'

    response['success'] = error == ''
    if error == '':
        response['books'] = books
    else:
        response['message'] = error    

    return jsonify(response), statusCode


@bookController.route('/books/by_category/<int:categoryId>', methods=['GET'])
def GetBooksByCategory(categoryId):
    connection = GetConnection()
    bookModel = BookModel(connection)
    categoryModel = CategoryModel(connection)
    response = {}
    statusCode = 200
    error = ''

    targetCategory = categoryModel.GetCategoryById(categoryId)
    if targetCategory is None:
        error = 'Categoría no encontrada'

    if error == '':
        books = bookModel.GetBooksByCategory(categoryId)

    if books is None:
        error = 'No hay libros disponibles'

    response['success'] = error == ''
    if error == '':
        response['books'] = books
    else:
        response['message'] = error    

    return jsonify(response), statusCode


@bookController.route('/books/<int:id>', methods=['GET'])
def GetBookById(id):
    connection = GetConnection()
    bookModel = BookModel(connection)
    response = {}
    statusCode = 200
    error = ''
    targetBook = bookModel.GetBookById(id)

    if targetBook is None:
        error = "Libro no encontrado"
        statusCode = 404
    
    success = error == ''
    response['success'] = success

    if error != '':
        response['message'] = error
    else:
        response['book'] = targetBook

    return jsonify(response), statusCode


@bookController.route('/books/<int:updateId>', methods=['PUT'])
def UpdateBook(updateId):
    connection = GetConnection()
    userModel = UserModel(connection)
    bookModel = BookModel(connection)
    response = {}
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
        cleanData = ValidateBookData(recievedData, False)
        if type(cleanData) is str:
            error = cleanData
            statusCode = 400

    if error == '':
        if userModel.UserHasPermisson(targetUser['id'], 'Libros') is False:
            error = 'Acción denegada'
            statusCode = 401  # Unauthorized

    if error == '':
        targetBook = bookModel.GetBookById(updateId)
        if targetBook is None:
            error = 'Libro no encontrado'
            statusCode = 404

    if error == '' and 'categories' in cleanData:
        if cleanData['categories'] == []:
            error = 'Seleccione al menos una categoría'
            statusCode = 400

    if error == '':
        if 'call_number' in cleanData:
            if bookModel.GetBookByCallNumber(cleanData['call_number']) is not None:
                error = 'La cota ya está registrada'
                statusCode = 400

    if error == '' and 'categories' in cleanData:
        categoryModel = CategoryModel(connection)
        categoriesExists = categoryModel.CategoriesExists(cleanData['categories'])
        if categoriesExists is False:
            error = 'Alguna de las categorías no encaja con las registradas'
            statusCode = 400

    if error == '':
        if 'state' in cleanData:
            stateExists = bookModel.GetStateById(cleanData['state'])
            if stateExists is None:
                error = 'El estado seleccionado no existe'
                statusCode = 400

    if error == '':
        if cleanData == {}:
            error = 'Información recibida vacía'
            statusCode = 400
    
    if error == '':
        updated = bookModel.UpdateBook(updateId, cleanData)
        if updated is False:
            error = "Hubo un error al intentar actualizar el libro"
            statusCode = 500
        else:
            alteredColumns = ''
            for key in cleanData.keys():
                alteredColumns += '{0}, '.format(key)
            alteredColumns = alteredColumns[0:-2]

            action = 'Editó los campos: {0} del Libro de id {1}'.format(alteredColumns, updateId)
            bookModel.CreateBinnacle(targetUser['id'], action)
            message = 'Libro actualizado correctamente'

    if error != '':
        message = error
        
    success = error == ''
    response['success'] = success
    response['message'] = message

    return jsonify(response), statusCode


@bookController.route('/books/<int:deleteId>', methods=['DELETE'])
def DeleteBook(deleteId):
    connection = GetConnection()
    userModel = UserModel(connection)
    bookModel = BookModel(connection)
    response = {}
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
        if userModel.UserHasPermisson(targetUser['id'], 'Libros') is False:
            error = 'Acción denegada'
            statusCode = 401  # Unauthorized

    if error == '':
        targetBook = bookModel.GetBookById(deleteId)
        if targetBook is None:
            error = 'Libro no encontrado'
            statusCode = 404

    if error == '':
        loanModel = LoanModel(connection)
        if loanModel.GetLoansOfBook(deleteId) is not tuple():
            # The book has loans, then, the book can't be deleted
            error = 'El libro tiene préstamos registrados, por lo tanto, no puede ser borrado'
            statusCode = 400

    if error == '':
        deleted = bookModel.DeleteBook(deleteId)
        if deleted is False:
            error = 'Hubo un error al intentar borrar el libro'
            statusCode = 500
        else:
            message = 'Libro borrado correctamente'
            action = 'Borró el libro "{0}" de id {1}'.format(targetBook['title'], targetBook['id'])
            bookModel.CreateBinnacle(targetUser['id'], action)
    
    if error != '':
        message = error
        
    success = error == ''
    response['success'] = success
    response['message'] = message

    return jsonify(response), statusCode


def ValidateBookData(recievedData, exactData = True):
    '''
    If exacData is False and a required field not exists, it will be ignored
    '''
    error = ''

    cleanData = HasEmptyFields(REQUIRED_FIELDS, recievedData, exactData)
    if type(cleanData) is str:
        error = cleanData

    if error == '':
        lengthOK = ValidateLength(BOOK_LENGTH_CONFIG, cleanData)
        if lengthOK is not True:
            error = lengthOK

    return cleanData if error == '' else error