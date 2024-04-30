from .BaseModel import BaseModel

class BinnacleModel(BaseModel):    
    def GetBinnacle(self):
        cursor = self.connection.connection.cursor()
        sql = '''
            SELECT
            user.nickname,
            user.id as userid,
            binnacle.action,
            binnacle.date
            FROM
            binnacle
            INNER JOIN user ON user.id = binnacle.user
            ORDER By
            binnacle.date DESC
            '''
        
        cursor.execute(sql)
        return cursor.fetchall()