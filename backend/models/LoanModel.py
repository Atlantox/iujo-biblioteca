from .BaseModel import BaseModel

class LoanModel(BaseModel):
    LOAN_SELECT_TEMPLATE = '''
        SELECT
        book.id as book_id,
        book.title,
        reader.id as reader_id,
        CONCAT(reader.names, ' ', reader.surnames) as fullname,
        reader.cedula,
        loan.id as loan_id,
        loan.deliver_date,
        loan.observation,
        loan.return_date,
        loan.active
        FROM
        loan
        INNER JOIN book ON book.id = loan.book
        INNER JOIN reader ON reader.id = loan.reader 
        '''
    
    def CreateLoan(self, loanData):
        ''' Creates a loan an returns the created id '''
        cursor = self.connection.connection.cursor()
        result = True

        sql = '''
            INSERT INTO
            loan
            (
                book,
                reader,
                observation,
                deliver_date
            )
            VALUES
            (
                %s,
                %s,
                %s,
                %s
            )
            '''
        args = (
            loanData['book'],
            loanData['reader'],
            loanData['observation'],
            loanData['deliver_date']
        )
                
        try:
            cursor.execute(sql, args)
            self.connection.connection.commit()
            sql = "SELECT MAX(id) as id FROM loan"
            cursor.execute(sql)
            newLoan = cursor.fetchone()
            if newLoan is None:
                result = False
            else:
                result = newLoan['id']
        except:
            result = False

        return result
    
    def GetActiveLoans(self):
        cursor = self.connection.connection.cursor()
        sql = self.LOAN_SELECT_TEMPLATE + "WHERE loan.active = 1"

        try:
            cursor.execute(sql)
            loans = cursor.fetchall()
            if loans == tuple():
                loans = []
        except:
            loans = []
        
        return loans

    def GetLoanById(self, id):
        cursor = self.connection.connection.cursor()
        sql = self.LOAN_SELECT_TEMPLATE + "WHERE loan.id = %s"
        args = (id,)

        try:
            cursor.execute(sql, args)
            result = cursor.fetchone()
        except:
            result = None
        
        return result            

    def GetLoansOfBook(self, bookId):
        cursor = self.connection.connection.cursor()
        sql = self.LOAN_SELECT_TEMPLATE + 'WHERE loan.book = %s ANd loan.active = 1 ORDER BY loan.deliver_date'
        args = (bookId, )

        try:
            cursor.execute(sql, args)
            loans = cursor.fetchall()
            if loans == tuple():
                loans = []
        except:
            loans = []

        return loans
        
    def GetLoansOfReader(self, readerId):
        cursor = self.connection.connection.cursor()
        sql = self.LOAN_SELECT_TEMPLATE + 'WHERE loan.reader = %s AND loan.active = 1 ORDER BY loan.deliver_date'
        args = (readerId,)

        try:
            cursor.execute(sql, args)
            loans = cursor.fetchall()
            if loans is tuple():
                loans = []
        except:
            loans = []
        
        return loans

    def ReturnLoan(self, id):
        cursor = self.connection.connection.cursor()
        result = True

        sql = "UPDATE loan SET return_date = NOW() WHERE id = %s"
        args = (id,)

        try:
            cursor.execute(sql, args)
            self.connection.connection.commit()
        except:
            result = False

        return result
    
    def DeactivateLoan(self, id):
        cursor = self.connection.connection.cursor()
        result = True

        sql = "UPDATE loan SET active = 0 WHERE id = %s"
        args = (id,)

        try:
            cursor.execute(sql, args)
            self.connection.connection.commit()
        except:
            result = False
        
        return result