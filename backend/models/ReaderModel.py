from .BaseModel import BaseModel

class ReaderModel(BaseModel):
    def GetReaders(self):
        cursor = self.connection.connection.cursor()
        sql = "SELECT * FROM reader"
        cursor.execute(sql)
        return cursor.fetchall()

    def CreateReader(self, readerData):
        cursor = self.connection.connection.cursor()
        result = True

        sql = '''
            INSERT INTO
            reader
            (
                cedula,
                names,
                surnames,
                gender,
                phone,
                is_teacher
            )
            VALUES
            (
                %s,
                %s,
                %s,
                %s,
                %s,
                %s
            )
            '''
        args = (
            readerData['cedula'],
            readerData['names'],
            readerData['surnames'],
            readerData['gender'],
            readerData['phone'],
            readerData['is_teacher']
        )
                
        try:
            cursor.execute(sql, args)
            self.connection.connection.commit()
        except:
            result = False

        return result
    
    def GetReaderByCedula(self, cedula):
        cursor = self.connection.connection.cursor()

        sql = "SELECT * FROM reader WHERE cedula = %s"
        args = (cedula,)

        try:
            cursor.execute(sql, args)
            result = cursor.fetchone()
        except:
            result = None
        
        return result
    
    def GetReaderById(self, id):
        cursor = self.connection.connection.cursor()

        sql = "SELECT * FROM reader WHERE id = %s"
        args = (id,)

        try:
            cursor.execute(sql, args)
            result = cursor.fetchone()
        except:
            result = None
        
        return result
    
    def UpdateReader(self, readerId, readerData):
        result = True
        cursor = self.connection.connection.cursor()
        arrayValues = []
        sql = "UPDATE reader SET "
        for column, value in readerData.items():
            sql += "{0} = %s,".format(column)
            arrayValues.append(value)
        
        sql = sql[0:-1] + " WHERE id = %s"
        arrayValues.append(readerId)
        args = tuple(arrayValues)
        
        try:
            cursor.execute(sql, args)
            self.connection.connection.commit()
        except:
            result = False
        
        return result
    
    def DeleteReader(self, readerId):
        result = True
        cursor = self.connection.connection.cursor()
        result = True
        
        sql = "DELETE FROM reader WHERE id = %s"
        args = (readerId,)
        try:
            cursor.execute(sql, args)
            self.connection.connection.commit()
        except:
            result = False
        
        return result