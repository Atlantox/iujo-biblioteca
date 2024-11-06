from .BaseModel import BaseModel

class EditorialModel(BaseModel):
    def GetEditorials(self):
        cursor = self.connection.connection.cursor()
        sql = "SELECT * FROM editorial"
        cursor.execute(sql)
        return cursor.fetchall()

    def CreateEditorial(self, EditorialData):
        name = EditorialData['name']
        cursor = self.connection.connection.cursor()
        result = True

        sql = "INSERT INTO editorial (name) VALUES (%s)"
        args = (name,)

        try:
            cursor.execute(sql, args)
            self.connection.connection.commit()
        except:
            result = False

        return result
    
    def GetEditorialByName(self, name):
        cursor = self.connection.connection.cursor()

        sql = "SELECT * FROM editorial WHERE name = %s"
        args = (name,)

        try:
            cursor.execute(sql, args)
            result = cursor.fetchone()
        except:
            result = None
        
        return result
    
    def GetEditorialById(self, id):
        cursor = self.connection.connection.cursor()

        sql = "SELECT * FROM editorial WHERE id = %s"
        args = (id,)

        try:
            cursor.execute(sql, args)
            result = cursor.fetchone()
        except:
            result = None
        
        return result
    
    def UpdateEditorial(self, editorialId, editorialData):
        newName = editorialData['name']
        cursor = self.connection.connection.cursor()
        result = True

        sql = "UPDATE editorial SET name = %s WHERE id = %s"
        args = (newName, editorialId,)

        try:
            cursor.execute(sql, args)
            self.connection.connection.commit()
        except:
            result = False
        
        return result
    
    def DeleteEditorial(self, editorialId):
        cursor = self.connection.connection.cursor()
        result = True

        sql = "DELETE FROM editorial WHERE id = %s"
        args = (editorialId,)

        try:
            cursor.execute(sql, args)
            self.connection.connection.commit()
        except:
            result = False
        
        return result