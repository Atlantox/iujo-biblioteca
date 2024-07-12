from flask import Blueprint, request, jsonify

from models.BookModel import BookModel
from models.UserModel import UserModel
from models.CategoryModel import CategoryModel
from models.LoanModel import LoanModel
from models.AuthorModel import AuthorModel
from models.EditorialModel import EditorialModel

from helpers import *

LENGTH_CONFIG = {
    'call_number': {'min': 1, 'max':8},
    'title': {'min': 1, 'max':150},
    'state': {'min': 5, 'max':30},
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
        if cleanData['author'] == '':
            cleanData['author'] = None
        else:
            authorModel = AuthorModel(connection)
            targetAuthor = authorModel.GetAuthorById(cleanData['author'])
            if targetAuthor is None:
                error = 'Autor no encontrado'
                statusCode = 400

    if error == '':
        if cleanData['editorial'] == '':
            cleanData['editorial'] = None
        else:
            editorialModel = EditorialModel(connection)
            targetEditorial = editorialModel.GetEditorialById(cleanData['editorial'])
            if targetEditorial is None:
                error = 'Editorial no encontrada'
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

@bookController.route('/states', methods=['GET'])
def GetStates():
    connection = GetConnection()
    bookModel = BookModel(connection)
    response = {}
    statusCode = 200
    error = ''

    states = bookModel.GetBookStates()

    response['success'] = error == ''
    if error == '':
        response['states'] = states
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
            statusCode = 404

    response['success'] = error == ''
    if error == '':
        response['books'] = books
    else:
        response['message'] = error    

    return jsonify(response), statusCode


@bookController.route('/books/by_author/', defaults={'exceptId': None}, methods=['POST'])
@bookController.route('/books/by_categories/<int:exceptId>', methods=['POST'])
def GetBooksByCategories(exceptId):
    connection = GetConnection()
    bookModel = BookModel(connection)
    categoryModel = CategoryModel(connection)
    response = {}

    recievedData, error, statusCode = JsonExists(request)

    if recievedData is None:
        error = 'JSON no encontrado'
        statusCode = 400

    if error == '':
        if 'categories' not in recievedData:
            error = 'Se requieren las categorías'
            statusCode = 400

    if error == '':
        targetCategories = categoryModel.GetCategoriesByIdList(recievedData['categories'])
        if targetCategories is None:
            error = 'Categorías no encontradas'
            statusCode = 404

    if error == '':
        realCategories = [c['id'] for c in targetCategories]
        books = bookModel.GetBooksByCategories(realCategories, exceptId)

    if error == '':
        if books is None:
            error = 'No hay libros disponibles'
            statusCode = 404

    response['success'] = error == ''
    if error == '':
        response['books'] = books
    else:
        response['message'] = error    

    return jsonify(response), statusCode


@bookController.route('/books/by_author/<int:authorId>', defaults={'exceptId': None}, methods=['GET'])
@bookController.route('/books/by_author/<int:authorId>/<int:exceptId>', methods=['GET'])
def GetBooksByAuthor(authorId, exceptId):
    connection = GetConnection()
    bookModel = BookModel(connection)
    authorModel = AuthorModel(connection)
    response = {}
    statusCode = 200
    error = ''

    targetAuthor = authorModel.GetAuthorById(authorId)
    if targetAuthor is None:
        error = 'Autor no encontrado'
        statusCode = 404

    if error == '':
        books = bookModel.GetBooksByAuthor(targetAuthor['id'], exceptId)
        if books is None:
            error = 'No hay libros disponibles'
            statusCode = 404

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


@bookController.route('/books/filter', methods=['POST'])
def GetBooksByFilter():
    connection = GetConnection()
    response = {}
    recievedData, error, statusCode = JsonExists(request)
    filters = {}

    if 'category' in recievedData:
        categoryModel = CategoryModel(connection)
        targetCategory = categoryModel.GetCategoryById(recievedData['category'])
        if targetCategory is None:
            error ='Cateogría no encontrada'
            statusCode = 400
        else:
            filters['category'] = recievedData['category']

    if 'state' in recievedData:
        bookModel = BookModel(connection)
        targetState = bookModel.GetStateByName(recievedData['state'])
        if targetState is None:
            error ='Estado no encontrado'
            statusCode = 400
        else:
            filters['state'] = recievedData['state']

    if error == '':
        if 'author' in recievedData:
            authorModel = AuthorModel(connection)
            targetAuthor = authorModel.GetAuthorById(recievedData['author'])
            if targetAuthor is None:
                error ='Autor no encontrado'
                statusCode = 400
            else:
                filters['author'] = recievedData['author']
    
    if error == '':
        if 'editorial' in recievedData:
            editorialModel = EditorialModel(connection)
            targetEditorial = editorialModel.GetEditorialById(recievedData['editorial'])
            if targetEditorial is None:
                error ='Editorial no encontrada'
                statusCode = 400
            else:
                filters['editorial'] = recievedData['editorial']

    if error == '':
        booksFound = bookModel.FilterBooks(filters)
        if type(booksFound) is str:
            error = booksFound
    
    success = error == ''
    response['success'] = success

    
    if success:
        response['books'] = booksFound
    else:
        response['message'] = error
    
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

    if error == '':
        if 'author' in cleanData:
            if cleanData['author'] != '':
                targetAuthor = bookModel.GetAuthorById(cleanData['author'])
                if targetAuthor is None:
                    error = 'Autor no encontrado'
                    statusCode = 400

    if error == '':
        if 'editorial' in cleanData:
            if cleanData['editorial'] != '':
                targetEditorial = bookModel.GetEditorialById(cleanData['editorial'])
                if targetEditorial is None:
                    error = 'Editorial no encontrada'
                    statusCode = 400
            

    if error == '' and 'categories' in cleanData:
        categoryModel = CategoryModel(connection)
        categoriesExists = categoryModel.CategoriesExists(cleanData['categories'])
        if categoriesExists is False:
            error = 'Alguna de las categorías no encaja con las registradas'
            statusCode = 400

    if error == '':
        if 'state' in cleanData:
            stateExists = bookModel.GetStateByName(cleanData['state'])
            if stateExists is None:
                error = 'El estado seleccionado no existe'
                statusCode = 400

    if error == '':
        if cleanData == {} and 'categories' not in cleanData:
            error = 'Información recibida vacía'
            statusCode = 400
    
    if error == '':
        updated = bookModel.UpdateBook(updateId, cleanData)
        if updated is not True:
            error = updated
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
        lengthOK = ValidateLength(LENGTH_CONFIG, cleanData)
        if lengthOK is not True:
            error = lengthOK

    return cleanData if error == '' else error