from .BaseModel import BaseModel
from .CategoryModel import CategoryModel

class BookModel(BaseModel):
    BOOK_SELECT_TEMPLATE = '''
            SELECT
            book.id,
            book.call_number,
            book.title,
            book.author,
            book.editorial,
            book.pages,
            book.description,
            book.shelf,
            book.state
            FROM
            book 
            '''
    
    def CreateBook(self, bookData):
        cursor = self.connection.connection.cursor()
        error = ''
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
        sql = self.BOOK_SELECT_TEMPLATE + 'ORDER BY book.title'
        
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
    
    def GetBooksByCategory(self, categoryId):
        cursor = self.connection.connection.cursor()
        sql = self.BOOK_SELECT_TEMPLATE + '''
            INNER JOIN book_category ON book_category.book = book.id
            WHERE
            book_category.category = %s
            '''
        args = (categoryId,)
        cursor.execute(sql, args)
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
        sql = self.BOOK_SELECT_TEMPLATE + 'WHERE id = %s ORDER BY title'
        
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
        sql = self.BOOK_SELECT_TEMPLATE + 'WHERE call_number = %s ORDER BY title '

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
    
    def FilterBooks(self, filters:dict):
        cursor = self.connection.connection.cursor()

        sql = self.BOOK_SELECT_TEMPLATE + 'INNER JOIN book_category ON book_category.book = book.id '
        args = []

        if filters != []:
            sql += 'WHERE '

        
        if 'category' in filters:
            sql += 'book_category.category IN (%s) AND '
            args.append(filters['category'])

        if 'author' in filters:
            sql += 'book.author IN (%s) AND '
            args.append(filters['author'])

        if 'editorial' in filters:
            sql += 'book.editorial IN (%s) AND '
            args.append(filters['editorial'])

        sql = sql[0:-4]  # Removing the last 'AND'

        try:
            if args == []:
                cursor.execute(sql)
            else:
                cursor.execute(sql, tuple(args))
            result = cursor.fetchall()
            if result is tuple():
                result = []
        except:
            result = 'Ocurrió un error al intetnar filtrar los libros'

        return result      
    
    def UpdateBook(self, bookId, bookData):
        result = True
        cursor = self.connection.connection.cursor()
        arrayValues = []
        sql = "UPDATE book SET "
        for column, value in bookData.items():
            sql += "{0} = %s,".format(column)
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