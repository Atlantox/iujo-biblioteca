from .BaseModel import BaseModel
from .CategoryModel import CategoryModel

class BookModel(BaseModel):
    def CreateBook(self, bookData):
        error = ''
        cursor = self.connection.connection.cursor()
        sql = '''
                INSERT INTO
                book
                (
                    title,
                    author,
                    call_number,
                    editorial,
                    pages,
                    shelf,
                    description,
                    state
                )
                VALUES
                (
                    '{0}',
                    '{1}',
                    '{2}',
                    '{3}',
                    {4},
                    '{5}',
                    '{6}',
                    {7}
                )
                '''.format(
                    bookData['title'],
                    bookData['author'],
                    bookData['call_number'],
                    bookData['editorial'],
                    bookData['pages'],
                    bookData['shelf'],
                    bookData['description'],
                    bookData['state']
                )
        try:
            cursor.execute(sql)
            self.connection.connection.commit()
        except Exception as err:
            error = 'Hubo un error al crear el libro en la base de datos'

        if error == '':
            sql = "SELECT MAX(id) as id from book"
            cursor.execute(sql)
            createdBook = cursor.fetchone()
            categoryModel = CategoryModel(self.connection)            
            categoriesAssigned = categoryModel.AddCategoriesToBook(createdBook['id'], bookData['categories'])
            if categoriesAssigned is False:
                error = 'El libro fue creado, sin embargo, hubo un error al asignar las categorías de este'
            
        if error == '':
            result = True
        else:
            result = error

        return result

    
    def GetAllBooks(self):
        cursor = self.connection.connection.cursor()
        sql = '''
            SELECT
            book.id,
            book.call_number,
            book.title,
            book.author,
            book.editorial,
            book.pages,
            book.description,
            book.shelf,
            state.name as state
            FROM
            book
            INNER JOIN state ON state.id = book.state
            ORDER BY
            book.title
            '''
        
        cursor.execute(sql)
        books = cursor.fetchall()
        result = []
        
        if type(books) is tuple:
            for i in range(len(books)):
                book = books[i]
                categoryModel = CategoryModel(self.connection)
                book['categories'] = categoryModel.GetCategoriesOfBook(book['id'])
                result.append(book)

        return result
    
    def GetBookById(self, id):
        cursor = self.connection.connection.cursor()
        sql = '''
            SELECT
            book.id,
            book.call_number,
            book.title,
            book.author,
            book.editorial,
            book.pages,
            book.description,
            book.shelf,
            state.name as state
            FROM
            book
            INNER JOIN state ON state.id = book.state
            WHERE
            book.id = {0}
            ORDER BY
            book.title            
            '''.format(id)
        
        cursor.execute(sql)
        book = cursor.fetchone()

        if book is None:
            result = None
        else:
            categoryModel = CategoryModel(self.connection)
            book['categories'] = categoryModel.GetCategoriesOfBook(book['id'])
            result = book
        
        return result
    
    def GetBookByCallNumber(self, callNumber):
        cursor = self.connection.connection.cursor()
        sql = '''
            SELECT
            book.id,
            book.call_number,
            book.title,
            book.author,
            book.editorial,
            book.pages,
            book.description,
            book.shelf,
            state.name as state
            FROM
            book
            INNER JOIN state ON state.id = book.state
            WHERE
            book.call_number = '{0}'
            ORDER BY
            book.title            
            '''.format(callNumber)
        
        cursor.execute(sql)
        book = cursor.fetchone()

        if book is None:
            result = None
        else:
            categoryModel = CategoryModel(self.connection)
            book['categories'] = categoryModel.GetCategoriesOfBook(book['id'])
            result = book
        
        return result
    
    def StateExists(self, stateId):
        cursor = self.connection.connection.cursor()
        sql = "SELECT * FROM state WHERE id = '{0}'".format(stateId)
        cursor.execute(sql)
        return cursor.fetchone() is not None
    
    def UpdateBook(self, bookId, bookData):
        result = True
        cursor = self.connection.connection.cursor()
        sql = "UPDATE book SET "
        for column, value in bookData.items():
            sql += "{0} = '{1}',".format(column, value)
        
        sql = sql[0:-1]
        sql += " WHERE id = {0}".format(bookId)

        try:
            cursor.execute(sql)
            self.connection.connection.commit()
        except:
            result = False
        
        return result
    
    def DeleteBook(self, bookId):
        result = True
        cursor = self.connection.connection.cursor()
        sql = "DELETE FROM book WHERE id = {0}".format(bookId)
        try:
            cursor.execute(sql)
            self.connection.connection.commit()
        except:
            result = False
        
        return result