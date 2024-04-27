from flask import Flask, jsonify
from flask_mysqldb import MySQL
from flask_cors import CORS

from config import config

# Controllers / Blueprints
from controllers.UserController import userController


app = Flask(__name__)
CORS(app)
connection = MySQL(app)

# Le pasamos la conexión de la base de datos a los blueprints / controladores
userController.connection = connection

def NotFound(error):
    return jsonify({'success': False, 'message': 'Ruta no encontrada'}), 404


if __name__ == '__main__':
    app.config.from_object(config['development'])
    app.register_error_handler(404, NotFound)

    #Registrar los controladores / blueprints
    app.register_blueprint(userController)
    app.run()
