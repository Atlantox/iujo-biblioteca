from argon2 import PasswordHasher
from uuid import uuid4

from .BaseModel import BaseModel

class UserModel(BaseModel):
    def __init__(self, connection):
        self.connection = connection

    def CreateUser(self, userData):
        result = True
        try:
            cursor = self.connection.connection.cursor()
            newToken = self.GetNewToken()
            hasher = PasswordHasher()
            sql = '''
                INSERT INTO
                usuario
                (
                    username,
                    password,
                    email,
                    token
                )
                VALUES
                (
                    '{0}',
                    '{1}',
                    '{2}',
                    '{3}'
                )
                '''.format(
                    hasher.hash(userData['username']),
                    hasher.hash(userData['password']),
                    userData['email'],
                    newToken
                )
            cursor.execute(sql)
            self.connection.connection.commit()
            result = True
        except Exception as err:
            result = False

        return result

    def GetUserByToken(self, request):
        '''
        Obtain the request, check if the token exists and if the user exists
        '''
        headers = request.headers
        bearer = headers.get('Authorization')
        token = None
        if bearer is not None:
            if len(bearer) > 0:
                token = bearer.split(' ')[1]

            cursor = self.connection.connection.cursor()
            sql = "SELECT * FROM usuario WHERE token = '{0}'".format(token)
            cursor.execute(sql)
            user = cursor.fetchone()
            result = user
        else:
            result = 'Authenticación requerida'
        
        return result

    
    def GetNewToken(self):
        tentativeToken = '{0}-{1}'.format(uuid4(), uuid4())
        cursor = self.connection.connection.cursor()
        sql = "SELECT token FROM usuario WHERE token = '{0}'"
        cursor.execute(sql.format(tentativeToken))
        tokenExists = cursor.fetchone()

        # Creamos tokens hasta que creemos uno único que no exista
        while tokenExists is not None:
            tentativeToken = '{0}-{1}'.format(uuid4(), uuid4())
            cursor.execute(sql.format(tentativeToken))
            tokenExists = cursor.fetchone()

        return tentativeToken
    
    def GetUserPublicData(self, token):
        cursor = self.connection.connection.cursor()
        sql = '''SELECT
            nickname,
            level,
            active        
            FROM
            usuario
            WHERE
            token = '{0}'
            '''.format(token)
        
        cursor.execute(sql)
        return cursor.fetchone()

    def UsernameExists(self, recievedUsername):
        cursor = self.connection.connection.cursor()
        hasher = PasswordHasher()

        sql = "SELECT username FROM user"
        cursor.execute(sql)
        usernames = cursor.fetchall()
        found = False

        if usernames is not None:
            for user in usernames:
                if found: break

                try:
                    hasher.verify(user['username'], recievedUsername)
                    found = True
                    break
                except Exception as err:
                    pass

        return found
    
    def TryLogin(self, username, password):
        cursor = self.connection.connection.cursor()
        hasher = PasswordHasher()
        sql = "SELECT username, password, token FROM usuario"
        cursor.execute(sql)
        users = cursor.fetchall()
        result = False

        if users is not None:
            for user in users:
                if result: break

                try:
                    hasher.verify(user['username'], username)
                    hasher.verify(user['password'], password)
                    result = user['token']
                    break
                except Exception as err:
                    pass

        return result
    
    def UserHasPermisson(self, userId, permisson):
        cursor = self.connection.connection.cursor()
        sql = '''
            SELECT
            permisson.name
            FROM
            permisson
            INNER JOIN user_level ON user_level.name = permisson.level
            INNER JOIN user ON user.level = user_level.name
            WHERE
            user.id = '{0}' AND
            permisson.name = '{1}'
            '''.format(userId, permisson)
        
        cursor.execute(sql)
        result = cursor.fetchone()
        return result is None