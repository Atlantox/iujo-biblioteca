from flask import Flask, jsonify
from flask_mysqldb import MySQL
from flask_cors import CORS

from config import config

# Controllers / Blueprints
from controllers.BinnacleController import binnacleController
from controllers.UserController import userController
from controllers.BookController import bookController
from controllers.CategoryController import categoryController


app = Flask(__name__)
CORS(app)
connection = MySQL(app)

# Le pasamos la conexión de la base de datos a los blueprints / controladores
binnacleController.connection = connection
userController.connection = connection
bookController.connection = connection
categoryController.connection = connection

def NotFound(error):
    return jsonify({'success': False, 'message': 'Ruta no encontrada'}), 404


if __name__ == '__main__':
    app.config.from_object(config['development'])
    app.register_error_handler(404, NotFound)

    #Registrar los controladores / blueprints
    app.register_blueprint(binnacleController)
    app.register_blueprint(userController)
    app.register_blueprint(bookController)
    app.register_blueprint(categoryController)
    app.run()
