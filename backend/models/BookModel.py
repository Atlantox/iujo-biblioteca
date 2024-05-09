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
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s,
                %s
            )
            '''
        args = (
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
            cursor.execute(sql, args)
            self.connection.connection.commit()
        except:
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
            book.id = %s
            ORDER BY
            book.title            
            '''
        
        args = (id,)
        cursor.execute(sql, args)
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
            book.call_number = %s
            ORDER BY
            book.title            
            '''

        args = (callNumber,)
        cursor.execute(sql, args)
        book = cursor.fetchone()

        if book is None:
            result = None
        else:
            categoryModel = CategoryModel(self.connection)
            book['categories'] = categoryModel.GetCategoriesOfBook(book['id'])
            result = book
        
        return result
    
    def GetStateById(self, stateId):
        cursor = self.connection.connection.cursor()
        sql = "SELECT * FROM state WHERE id = %s"
        args = (stateId,)

        try:
            cursor.execute(sql, args)
            result = cursor.fetchone()
        except:
            result = None

        return result
    
    def UpdateBook(self, bookId, bookData):
        result = True
        cursor = self.connection.connection.cursor()
        arrayValues = []
        sql = "UPDATE book SET "
        for column, value in bookData.items():
            sql += "%s = %s,"
            arrayValues.append(column)
            arrayValues.append(value)
        
        sql = sql[0:-1] + " WHERE id = %s"
        arrayValues.append(bookId)
        args = tuple(arrayValues)

        try:
            cursor.execute(sql, args)
            self.connection.connection.commit()
        except:
            result = False
        
        return result
    
    def DeleteBook(self, bookId):
        cursor = self.connection.connection.cursor()
        result = True
        
        sql = "DELETE FROM book WHERE id = %s"
        args = (bookId,)
        try:
            cursor.execute(sql, args)
            self.connection.connection.commit()
        except:
            result = False
        
        return result