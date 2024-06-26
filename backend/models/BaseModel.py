class BaseModel():
    def __init__(self, connection):
        self.connection = connection

    def CreateBinnacle(self, userId, action):
        cursor = self.connection.connection.cursor()
        created = True
        sql = '''
            INSERT INTO
            binnacle
            (
                user,
                action
            )
            VALUES
            (
                %s,
                %s
            )
            '''
        args = (userId, action, )
        
        try:
            cursor.execute(sql, args)
            self.connection.connection.commit()
        except:
            created = False

        return created