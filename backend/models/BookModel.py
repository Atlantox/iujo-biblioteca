from .BaseModel import BaseModel
from .CategoryModel import CategoryModel
from .AuthorModel import AuthorModel

class BookModel(BaseModel):
    BOOK_SELECT_TEMPLATE = '''
            SELECT DISTINCT
            book.id,
            book.call_number,
            book.title,
            editorial.id as editorial_id,
            editorial.name as editorial,
            book.pages,
            book.description,
            book.shelf,
            book.state
            FROM
            book
            LEFT JOIN editorial ON editorial.id = book.editorial
            '''
    
    def CreateBook(self, bookData):
        cursor = self.connection.connection.cursor()
        error = ''
        sql = '''
            INSERT INTO
            book
            (
                title,
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
                %s
            )
            '''
        args = (
            bookData['title'],
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
            authorModel = AuthorModel(self.connection)
            authorsUpdated = authorModel.UpdateBookAuthors(createdBook['id'], bookData['authors'])
            if authorsUpdated is False:
                error = 'El libro fue creado, sin embargo, hubo un error al asignar los autores a este'

            
        if error == '':
            result = True
        else:
            result = error

        return result
    
    def GetAllBooks(self, groupBooks:bool):
        cursor = self.connection.connection.cursor()
        sql = self.BOOK_SELECT_TEMPLATE 
        
        if groupBooks:
            sql += ' GROUP BY book.title, book.editorial, book.state'

        sql += ' ORDER BY book.title '
        cursor.execute(sql)
        books = cursor.fetchall()
        result = []
        
        if type(books) is tuple:
            for i in range(len(books)):
                book = self.GetBookWithAuthorsAndCategories(books[i])
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
                book = self.GetBookWithAuthorsAndCategories(books[i])
                result.append(book)

        return result
    
    def GetBooksByCategories(self, categoryIds, exceptId):
        cursor = self.connection.connection.cursor()
        sql = self.BOOK_SELECT_TEMPLATE + '''
            INNER JOIN book_category ON book_category.book = book.id
            WHERE
            book_category.category IN (
            '''
        
        sql += ('%s,' * len(categoryIds))[:-1] + ')'

        if exceptId is not None:
            sql += ' AND book.id != %s'

        sql += ' ORDER BY book.title LIMIT 12 '
        
        if exceptId is not None:
            categoryCopy = categoryIds.copy()
            categoryCopy.append(exceptId)
            args = tuple(categoryCopy)
        else:
            args = tuple(categoryIds)

        cursor.execute(sql, args,)
        books = cursor.fetchall()
        result = []
        
        if type(books) is tuple:
            for i in range(len(books)):
                book = self.GetBookWithAuthorsAndCategories(books[i])
                result.append(book)

        return result
    
    def GetBooksByAuthor(self, authorId, exceptId):
        cursor = self.connection.connection.cursor()
        sql = self.BOOK_SELECT_TEMPLATE + '''
            LEFT JOIN book_authors ON book_authors.book = book.id
            WHERE
            book_authors.author = %s
            
            '''
        if exceptId is not None:
            sql += ' AND book.id != %s '

        sql += ' ORDER BY  book.title LIMIT 12 '
        
        if exceptId is None:
            args = (authorId,)
        else:
            args = (authorId, exceptId,)
            
        cursor.execute(sql, args)
        books = cursor.fetchall()
        result = []
        
        if type(books) is tuple:
            for i in range(len(books)):
                book = self.GetBookWithAuthorsAndCategories(books[i])
                result.append(book)

        return result
    
    def GetBooksOfSameAuthors(self, bookId, exceptId):
        cursor = self.connection.connection.cursor()
        sql = self.BOOK_SELECT_TEMPLATE + '''
            INNER JOIN book_author ON book_author.book = book.id
            WHERE
            book_author.author IN(
                SELECT 
                book_author.author
                FROM
                book_author
                WHERE
                book_author.book = %s
            )
            
            '''
        if exceptId is not None:
            sql += ' AND book.id != %s '

        sql += ' ORDER BY  book.title LIMIT 12 '
        
        if exceptId is None:
            args = (bookId,)
        else:
            args = (bookId, exceptId,)
            
        cursor.execute(sql, args)
        books = cursor.fetchall()
        result = []
        
        if type(books) is tuple:
            for i in range(len(books)):
                book = self.GetBookWithAuthorsAndCategories(books[i])
                result.append(book)

        return result

    def GetBookById(self, id):
        cursor = self.connection.connection.cursor()
        sql = self.BOOK_SELECT_TEMPLATE + 'WHERE book.id = %s ORDER BY title'
        
        args = (id,)
        cursor.execute(sql, args)
        book = cursor.fetchone()

        if book is None:
            result = None
        else:
            result = self.GetBookWithAuthorsAndCategories(book)
        
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
            result = self.GetBookWithAuthorsAndCategories(book)
        
        return result
    
    def GetBookWithAuthorsAndCategories(self, book):
        categoryModel = CategoryModel(self.connection)
        categories = categoryModel.GetCategoriesOfBook(book['id'])
        book['category_names'] = [ c['name'] for c in categories ]
        book['category_ids'] = [ c['id'] for c in categories ]

        book['author_names'] = []
        book['author_ids'] = []
        authorModel = AuthorModel(self.connection)
        authors = authorModel.GetAuthorsOfBook(book['id'])
        if len(authors) > 0:
            book['author_names'] = [ a['name'] for a in authors]
            book['author_ids'] = [ a['id'] for a in authors]

        return book
    
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
    
    def FilterBooks(self, filters:dict, groupBooks:bool):
        cursor = self.connection.connection.cursor()
        result = []

        sql = self.BOOK_SELECT_TEMPLATE + '''
            INNER JOIN book_category ON book_category.book = book.id 
            LEFT JOIN book_author ON book_author.book = book.id 
            '''
        args = []

        if filters != {}:
            sql += 'WHERE '
        
        if 'category' in filters:
            sql += ' book_category.category IN (%s) AND '
            args.append(filters['category'])

        if 'author' in filters:
            sql += ' book_author.author IN (%s) AND '
            args.append(filters['author'])

        if 'state' in filters:
            sql += ' book.state IN (%s) AND '
            args.append(filters['state'])

        if 'editorial' in filters:
            sql += ' book.editorial IN (%s) AND '
            args.append(filters['editorial'])

        sql = sql[0:-4]  # Removing the last 'AND'

        if groupBooks:
            sql += ' GROUP BY book.title, book.editorial, book.state'

        try:
            if args == []:
                cursor.execute(sql)
            else:
                cursor.execute(sql, tuple(args))
            books = cursor.fetchall()
            if books is tuple():
                result = []
            else:
                for i in range(len(books)):
                    book = self.GetBookWithAuthorsAndCategories(books[i])
                    result.append(book)

        except:
            result = 'Ocurrió un error al intentar filtrar los libros'

        return result      
    
    def GetBookStates(self):
        cursor = self.connection.connection.cursor()
        sql = 'SELECT * FROM state ORDER BY name'

        try:
            cursor.execute(sql)
            states = cursor.fetchall()
        except:
            states = False
        
        return states
    
    def BookAreRepeated(self, bookData):
        ''' Recibe un title, author y editorial, si se encontró un libro con esas coincidencias, entonces está repetido y retorna True '''
        cursor = self.connection.connection.cursor()
        bookTitle = bookData['title']
        bookAuthor = bookData['author']
        bookEditorial = bookData['editorial']

        sql = '''SELECT
            book.id
            FROM
            book
            LEFT JOIN author ON author.id = book.author 
            LEFT JOIN editorial ON editorial.id = book.editorial
            WHERE
            book.title = %s AND
            author.name = %s AND
            editorial.name = %s'''
        
        args = (bookTitle, bookAuthor, bookEditorial,)
        try:
            cursor.execute(sql, args)
            booksFound = cursor.fetchall()
            found = booksFound is not tuple()
        except:
            found = False
        
        return found

    
    def UpdateBook(self, bookId, bookData):
        result = True
        if 'categories' in bookData:
            recievedCategories = bookData['categories']
            del bookData['categories']
            categoryModel = CategoryModel(self.connection)            
            categoriesAssigned = categoryModel.UpdateCategoriesOfBook(bookId, recievedCategories)
            if categoriesAssigned is False:
                result = 'Ocurrió un problema durante el proceso de actualización de las categorías del libro'

        if 'authors' in bookData:
            recievedAuthors = bookData['authors']
            del bookData['authors']
            authorModel = AuthorModel(self.connection)
            authorsUpdated = authorModel.UpdateBookAuthors(bookId, recievedAuthors)
            if authorsUpdated is False:
                result = 'Ocurrió un problema durante el proceso de actualización de los autores del libro'

        if bookData != {}:
            cursor = self.connection.connection.cursor()
            arrayValues = []
            newBookData =  { key: None if value == '' else value for key, value in bookData.items() }
            sql = "UPDATE book SET "
            for column, value in newBookData.items():
                sql += "{0} = %s,".format(column)
                arrayValues.append(value)
            
            sql = sql[0:-1] + " WHERE id = %s"
            
            arrayValues.append(bookId)
            args = tuple(arrayValues)

            try:
                cursor.execute(sql, args)
                self.connection.connection.commit()
            except:
                errorMessage = 'Ocurrió un error durante el proceso de actualización del libro'
                if type(result) is str:
                    result += '<br>' + errorMessage
                else:
                    result = errorMessage
        
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