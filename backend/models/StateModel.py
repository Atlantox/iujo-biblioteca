from .BaseModel import BaseModel

class StateModel(BaseModel):
    def GetStates(self):
        cursor = self.connection.connection.cursor()
        sql = "SELECT * FROM state"
        cursor.execute(sql)
        return cursor.fetchall()

    def CreateState(self, stateData):
        name = stateData['name']
        cursor = self.connection.connection.cursor()
        result = True

        sql = "INSERT INTO state (name) VALUES (%s)"
        args = (name,)

        try:
            cursor.execute(sql, args)
            self.connection.connection.commit()
        except:
            result = False

        return result
    
    def GetBooksOfState(self, name):
        cursor = self.connection.connection.cursor()
        sql = "SELECT book.id FROM book INNER JOIN state ON state.name = book.state WHERE state.name = %s"
        args = (name,)

        try:
            cursor.execute(sql, args)
            result = cursor.fetchone()
        except:
            result = None
        
        return result
    
    def GetStateByName(self, name):
        cursor = self.connection.connection.cursor()

        sql = "SELECT * FROM state WHERE name = %s"
        args = (name,)

        try:
            cursor.execute(sql, args)
            result = cursor.fetchone()
        except:
            result = None
        
        return result
    
    def UpdateState(self, oldName, stateData):
        newName = stateData['name']
        cursor = self.connection.connection.cursor()
        result = True

        sql = "UPDATE state SET name = %s WHERE name = %s"
        args = (newName, oldName,)

        try:
            cursor.execute(sql, args)
            self.connection.connection.commit()
        except:
            result = False
        
        return result
    
    def DeleteState(self, stateName):
        cursor = self.connection.connection.cursor()
        result = True

        sql = "DELETE FROM state WHERE name = %s"
        args = (stateName,)

        try:
            cursor.execute(sql, args)
            self.connection.connection.commit()
        except:
            result = False
        
        return result