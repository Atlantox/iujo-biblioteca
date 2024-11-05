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
    
    def GetAuthorsOfBook(self, bookId):
        cursor = self.connection.connection.cursor()
        
        sql = '''
            SELECT
            author.id,
            author.name
            FROM
            author
            INNER JOIN book_author ON book_author.author = author.id
            WHERE
            book_author.book = %s
        '''
        args = (bookId,)

        try:
            cursor.execute(sql, args)
            authors = cursor.fetchall()
        except:
            authors = []

        return authors
    
    def AuthorsExists(self, ids):
        ''' Gets a list of Ids and check if all exists, if not return false'''
        cursor = self.connection.connection.cursor()
        arrayIds = []
        
        sql = "SELECT * FROM author WHERE id IN ("
        for id in ids:
            sql += "%s,"
            arrayIds.append(id)
        sql = sql[0:-1] + ')'

        try:
            cursor.execute(sql, tuple(arrayIds))
            authors = cursor.fetchall()
        except:
            authors = None

        if authors is None:
            result = False
        else:
            result = len(authors) == len(ids)

        return result

    
    def UpdateAuthor(self, authorId, authorData):
        cursor = self.connection.connection.cursor()
        result = True
        newName = authorData['name']

        sql = "UPDATE author SET name = %s WHERE id = %s"
        args = (newName, authorId,)

        try:
            cursor.execute(sql, args)
            self.connection.connection.commit()
        except:
            result = False
        
        return result
    
    def UpdateBookAuthors(self, bookId, authors):
        authorsDeleted = self.DeleteAuthorsOfBook(bookId)
        if authorsDeleted is False:
            return False

        cursor = self.connection.connection.cursor()
        result = True
        args = []

        sqlInsert = ''
        for author in authors:
            sqlInsert += '(%s, %s),'
            args += [bookId, author]

        sqlInsert = sqlInsert[:-1]

        sql = "INSERT INTO book_author (book, author) VALUES " + sqlInsert
        args = tuple(args)
        try:
            cursor.execute(sql, args)
            self.connection.connection.commit()
        except:
            result = False
        
        return result

    def DeleteAuthorsOfBook(self, bookId):
        cursor = self.connection.connection.cursor()
        result = True

        sql = "DELETE FROM book_author WHERE book = %s"
        args = (bookId,)

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