from .BaseModel import BaseModel

class AuthorModel(BaseModel):
    def GetAuthors(self):
        cursor = self.connection.connection.cursor()
        sql = "SELECT * FROM author"
        cursor.execute(sql)
        return cursor.fetchall()

    def CreateAuthor(self, authorData):
        name = authorData['name']
        cursor = self.connection.connection.cursor()
        result = True

        sql = "INSERT INTO author (name) VALUES (%s)"
        args = (name,)

        try:
            cursor.execute(sql, args)
            self.connection.connection.commit()
        except:
            result = False

        return result
    
    def GetAuthorByName(self, name):
        cursor = self.connection.connection.cursor()

        sql = "SELECT * FROM author WHERE name = %s"
        args = (name,)

        try:
            cursor.execute(sql, args)
            result = cursor.fetchone()
        except:
            result = None
        
        return result
    
    def GetAuthorById(self, id):
        cursor = self.connection.connection.cursor()

        sql = "SELECT * FROM author WHERE id = %s"
        args = (id,)

        try:
            cursor.execute(sql, args)
            result = cursor.fetchone()
        except:
            result = None
        
        return result
    
    def UpdateAuthor(self, authorId, authorData):
        newName = authorData['name']
        cursor = self.connection.connection.cursor()
        result = True

        sql = "UPDATE author SET name = %s WHERE id = %s"
        args = (newName, authorId,)

        try:
            cursor.execute(sql, args)
            self.connection.connection.commit()
        except:
            result = False
        
        return result
    
    def DeleteAuthor(self, authorId):
        cursor = self.connection.connection.cursor()
        result = True

        sql = "DELETE FROM author WHERE id = %s"
        args = (authorId,)

        try:
            cursor.execute(sql, args)
            self.connection.connection.commit()
        except:
            result = False
        
        return result