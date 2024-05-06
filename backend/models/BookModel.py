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
            state.name
            FROM
            book
            INNER JOIN state ON state.id = book.state
            ORDER BY
            book.title
            '''
        
        cursor.execute(sql)
        books = cursor.fetchall()
        return books
    
    def GetBookById(self, id):
        error = ''
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
            state.name
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
            error = 'Libro no encontrado'

        if error == '':
            categoryModel = CategoryModel(self.connection)
            book['categories'] = categoryModel.GetCategoriesOfBook(id)
        
        if error == '':
            result = book
        else:
            result = error
        
        return result
    
    def GetBookByCallNumber(self, callNumber):
        error = ''
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
            state.name
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
            error = 'Libro no encontrado'

        if error == '':
            categoryModel = CategoryModel(self.connection)
            book['categories'] = categoryModel.GetCategoriesOfBook(book['id'])
        
        if error == '':
            result = error
        else:
            result = book
        
        return result
    
    def StateExists(self, stateId):
        cursor = self.connection.connection.cursor()
        sql = "SELECT * FROM state WHERE id = '{0}'".format(stateId)
        cursor.execute(sql)
        return cursor.fetchone() is not None
    
    def UpdateBook(self, bookId, bookData):
        pass