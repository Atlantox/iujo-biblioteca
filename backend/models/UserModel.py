from argon2 import PasswordHasher
from uuid import uuid4

from .BaseModel import BaseModel

class UserModel(BaseModel):
    def CreateUser(self, userData):
        result = True
        cursor = self.connection.connection.cursor()
        newToken = self.GetNewToken()
        hasher = PasswordHasher()
        sql = '''
                INSERT INTO
                user
                (
                    nickname,
                    username,
                    password,
                    level,
                    token
                )
                VALUES
                (
                    `{0}`,
                    `{1}`,
                    `{2}`,
                    `{3}`,
                    `{4}`
                )
                '''.format(
                    userData['nickname'],
                    hasher.hash(userData['username']),
                    hasher.hash(userData['password']),
                    userData['level'],
                    newToken
                )
        try:
            cursor.execute(sql)
            self.connection.connection.commit()
        except Exception as err:
            result = False

        return result

    def GetUserByToken(self, token):
        '''
        Obtain the request, check if the token exists and if the user exists
        '''
        if token is not None:
            cursor = self.connection.connection.cursor()
            sql = "SELECT * FROM user WHERE token = '{0}'".format(token)
            cursor.execute(sql)
            user = cursor.fetchone()

            if user is None:
                result = 'Usuario no encontrado'
            else:
                result = user
        else:
            result = 'Authenticación requerida'
        
        return result

    
    def GetNewToken(self):
        tentativeToken = '{0}-{1}'.format(uuid4(), uuid4())
        cursor = self.connection.connection.cursor()
        sql = "SELECT token FROM user WHERE token = '{0}'"
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
        sql = 'SELECT id, nickname, level, active FROM user WHERE token = %s'
        
        cursor.execute(sql, (token,))
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
        sql = "SELECT username, password, token FROM user"
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
            user.id = `{0}` AND
            permisson.name = `{1}`
            '''.format(userId, permisson)

        cursor.execute(sql)
        result = cursor.fetchone()
        return result is not None