from .BaseModel import BaseModel

class BookModel(BaseModel):
    def CreateBook(self, bookData):
        result = True
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
                    `{0}`,
                    `{1}`,
                    `{2}`,
                    {3},
                    `{4}`,
                    `{5}`,
                    {6}
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
            result = False

        return result

    def GetAvailableBooks(self):
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
            state.name = 'En biblioteca'
            ORDER BY
            book.title
            '''
        
        cursor.execute(sql)
        books = cursor.fetchall()
        return books
    
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
    
    def UpdateBook(self, bookId, bookData):
        pass