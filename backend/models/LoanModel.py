from .BaseModel import BaseModel

class LoanModel(BaseModel):
    def GetLoansOfBook(self, bookId):
        cursor = self.connection.connection.cursor()
        sql = '''
            SELECT
            loan.id as loan,
            book.title,
            book.id as book_id,
            reader.id as reader_id,
            reader.names,
            reader.surnames,
            reader.cedula,
            loan.deliver_date,
            loan.return_date
            FROM
            loan
            INNER JOIN book ON book.id = loan.book
            INNER JOIN reader ON reader.id = loan.reader
            WHERE
            loan.book = {0}
            ORDER BY
            loan.deliver_date
            '''.format(bookId)
        
        cursor.execute(sql)
        return cursor.fetchall()
        