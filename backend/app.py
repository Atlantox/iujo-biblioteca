from flask import Flask, jsonify
from flask_mysqldb import MySQL
from flask_cors import CORS

from config import config

# Controllers / Blueprints
from controllers.BinnacleController import binnacleController
from controllers.UserController import userController
from controllers.BookController import bookController
from controllers.AuthorController import authorController
from controllers.EditorialController import editorialController
from controllers.CategoryController import categoryController
from controllers.ReaderController import readerController
from controllers.LoanController import loanController

app = Flask(__name__)
CORS(app)
connection = MySQL(app)

CONTROLLERS = [
    binnacleController,
    userController,
    bookController,
    authorController,
    editorialController,
    categoryController,
    readerController,
    loanController
]

# Le pasamos la conexión de la base de datos a los blueprints / controladores
for controller in CONTROLLERS:
    controller.connection = connection

def NotFound(error):
    return jsonify({'success': False, 'message': 'Ruta no encontrada'}), 404


if __name__ == '__main__':
    app.config.from_object(config['development'])
    app.register_error_handler(404, NotFound)

    #Registrar los controladores / blueprints
    for controller in CONTROLLERS:
        app.register_blueprint(controller)

    app.run()
    #app.run('172.31.2.248')
