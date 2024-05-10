from flask import Blueprint, request, jsonify
from flask_cors import cross_origin

from models.UserModel import UserModel
from models.BookModel import BookModel
from models.ReaderModel import ReaderModel
from models.LoanModel import LoanModel

from helpers import *

LOAN_LENGTH_CONFIG = {
    'observation': {'min': 0, 'max':1000, 'optional': True},
    'deliver_date': {'min': 10, 'max':10}
}

REQUIRED_FIELDS = [
    'book',
    'reader',
    'deliver_date'
]

loanController = Blueprint('loan', __name__)

def GetConnection():
    connection = getattr(loanController, 'connection', None)
    if connection is None:
        raise Exception('No se pudo obtener la conexión desde el Blueprint Loan')
    
    return connection

@loanController.route('/loans', methods=['POST'])
def CreateLoan():
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
        cleanData = ValidateLoanData(recievedData)
        if type(cleanData) is str:
            error = cleanData
            statusCode = 400

    if error == '':
        if userModel.UserHasPermisson(targetUser['id'], 'Préstamos') is False:
            error = 'Acción denegada'
            statusCode = 401  # Unauthorized

    if error == '':
        readerModel = ReaderModel(connection)
        if readerModel.GetReaderById(cleanData['reader']) is not None:
            error = 'Lector no encontrado'
            statusCode = 404

    if error == '':
        bookModel = BookModel(connection)
        if bookModel.GetBookById(cleanData['book']) is not None:
            error = 'Libro no encontrado'
            statusCode = 404
    
    if error == '':
        # Verificar que la fecha no pase del día actual
        pass
    
    if error == '':
        created = readerModel.CreateLoan(cleanData)
        if created is False:
            error = created
            statusCode = 500
        else:
            action = 'Creó al lector {0} de cédula {1}'.format(cleanData['names'], cleanData['cedula'])
            readerModel.CreateBinnacle(targetUser['id'], action)
            message = 'Lector creado correctamente'

    if error != '':
        message = error
        
    success = error == ''
    return jsonify({'success': success, 'message': message}), statusCode


@loanController.route('/readers', methods=['GET'])
def GetReaders():
    connection = GetConnection()
    userModel = UserModel(connection)
    error = ''
    response = {}
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
        if userModel.UserHasPermisson(targetUser['id'], 'Lectores') is False:
            error = 'Acción denegada'
            statusCode = 401  # Unauthorized

    if error == '':
        readerModel = ReaderModel(connection)
        readers = readerModel.GetReaders()
    else:
        readers = []

    response['success'] = error == ''

    if error == '':
        response['readers'] = readers
    else:
        response['message'] = error

    return jsonify(response), statusCode


@loanController.route('/readers/<int:categoryId>', methods=['GET'])
def GetReaderById(categoryId):
    connection = GetConnection()
    userModel = UserModel(connection)
    error = ''
    response = {}
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
        if userModel.UserHasPermisson(targetUser['id'], 'Lectores') is False:
            error = 'Acción denegada'
            statusCode = 401  # Unauthorized

    if error == '':
        readerModel = ReaderModel(connection)
        targetReader = readerModel.GetReaderById(categoryId)
        if targetReader is None:
            error = 'Lector no encontrado'
            statusCode = 404
    
    response['success'] = error == ''
    if error == '':
        response['reader'] = targetReader
    else:
        response['message'] = error

    return jsonify(response), statusCode


@loanController.route('/readers/<int:readerId>', methods=['PUT'])
def UpdateReader(readerId):
    connection = GetConnection()
    userModel = UserModel(connection)
    readerModel = ReaderModel(connection)
    
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
        cleanData = ValidateReaderData(recievedData, False)
        if type(cleanData) is str:
            error = cleanData
            statusCode = 400
    
    if error == '':
        if userModel.UserHasPermisson(targetUser['id'], 'Lectores') is False:
            error = 'Acción denegada'
            statusCode = 401  # Unauthorized

    if error == '':
        targetReader = readerModel.GetReaderById(readerId)
        if targetReader is None:
            error = 'Lector no encontrado'
            statusCode = 404

    if error == '' and 'cedula' in cleanData:
        if readerModel.GetReaderByCedula(cleanData['cedula']) is not None:
            error = 'La cédula a actualizar está repetida en el sistema'
            statusCode = 400

    if error == '' and 'gender' in cleanData:
        if cleanData['gender'] not in ['M', 'F']:
            error = 'Género inválido'
            statusCode = 400

    if error == '' and 'is_teacher' in cleanData:
        if cleanData['is_teacher'] not in ['1', '0']:
            error = 'Campo es profesor inválido'
            statusCode = 400

    if error == '':
        if cleanData == {}:
            error = 'Información recibida vacía'
            statusCode = 400
    
    if error == '':
        updated = readerModel.UpdateReader(readerId, cleanData)
        if updated is False:
            error = 'Hubo un error al intentar actualizar al lector'
            statusCode = 500
        else:
            alteredColumns = ''
            for key in cleanData.keys():
                alteredColumns += '{0}, '.format(key)
            alteredColumns = alteredColumns[0:-2]

            action = 'Editó los campos {0} del lector de id {1}'.format(alteredColumns, readerId)
            readerModel.CreateBinnacle(targetUser['id'], action)
            message = 'Lector actualizado correctamente'

    if error != '':
        message = error
        
    success = error == ''
    return jsonify({'success': success, 'message': message}), statusCode


@loanController.route('/readers/<int:readerId>', methods=['DELETE'])
def DeleteReader(readerId):
    connection = GetConnection()
    userModel = UserModel(connection)
    readerModel = ReaderModel(connection)
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
        if userModel.UserHasPermisson(targetUser['id'], 'Lectores') is False:
            error = 'Acción denegada'
            statusCode = 401  # Unauthorized

    if error == '':
        targetReader = readerModel.GetReaderById(readerId)
        if targetReader is None:
            error = 'Lector no encontrado'
            statusCode = 404

    if error == '':
        loanModel = LoanModel(connection)
        loansOfReader = loanModel.GetLoansOfReader(readerId)
        if loansOfReader != []:
            error = 'No se puede borrar el lector porque este tiene préstamos registrados.'
            statusCode = 400
    
    if error == '':
        deleted = readerModel.DeleteReader(readerId)
        if deleted is False:
            error = 'Hubo un error al intentar eliminar al lector'
            statusCode = 500
        else:
            action = 'Borró al lector {0} de cédula {1} y id {2}'.format(targetReader['names'], targetReader['cedula'], targetReader['id'])
            readerModel.CreateBinnacle(targetUser['id'], action)
            message = 'Lector eliminado correctamente'

    if error != '':
        message = error
        
    success = error == ''
    return jsonify({'success': success, 'message': message}), statusCode


def ValidateLoanData(recievedData, exactData = True):
    error = ''

    cleanData = HasEmptyFields(REQUIRED_FIELDS, recievedData, exactData)
    if type(cleanData) is str:
        error = cleanData

    if error == '':
        lengthOK = ValidateLength(LOAN_LENGTH_CONFIG, cleanData)
        if lengthOK is not True:
            error = lengthOK
    
    return cleanData if error == '' else error
