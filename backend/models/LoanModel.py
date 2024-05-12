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
        sql = self.LOAN_SELECT_TEMPLATE + "WHERE loan.active = 1 ORDER BY loan.deliver_date"

        try:
            cursor.execute(sql)
            loans = cursor.fetchall()
            if loans == tuple():
                loans = []
        except:
            loans = []
        
        return loans

    def GetAllLoans(self):
        cursor = self.connection.connection.cursor()
        sql = self.LOAN_SELECT_TEMPLATE + "ORDER BY loan.deliver_date"

        try:
            cursor.execute(sql)
            loans = cursor.fetchall()
            if loans == tuple():
                loans = []
        except:
            loans = []
        
        return loans
    
    def GetPendingLoans(self):
        cursor = self.connection.connection.cursor()
        sql = self.LOAN_SELECT_TEMPLATE + "WHERE return_date IS NULL ORDER BY loan.deliver_date"

        try:
            cursor.execute(sql)
            loans = cursor.fetchall()
            if loans == tuple():
                loans = []
        except:
            loans = []
        
        return loans
    
    def GetFinishedLoans(self):
        cursor = self.connection.connection.cursor()
        sql = self.LOAN_SELECT_TEMPLATE + "WHERE return_date IS NOT NULL ORDER BY loan.deliver_date"

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
    
    def GetLoansQuantityByGenderBetweenDates(self, initialDate, finalDate):
        cursor = self.connection.connection.cursor()
        sql = '''
            SELECT 
            reader.gender,
            COUNT(loan.id) as quantity
            FROM
            loan
            INNER JOIN reader ON reader.id = loan.reader
            WHERE
            loan.active = 1 AND
            loan.deliver_date BETWEEN %s AND %s
            GROUP BY
            reader.gender
            '''
        args = (initialDate, finalDate,)
    
        try:
            cursor.execute(sql, args)
            loans = cursor.fetchall()
        except:
            loans = []
        return loans
    
    def GetLoansQuantityByTeacherBetweenDates(self, initialDate, finalDate):
        cursor = self.connection.connection.cursor()
        sql = '''
            SELECT 
            reader.is_teacher,
            COUNT(loan.id) as quantity
            FROM
            loan
            INNER JOIN reader ON reader.id = loan.reader
            WHERE
            loan.active = 1 AND
            loan.deliver_date BETWEEN %s AND %s
            GROUP BY
            reader.is_teacher
            '''
        
        args = (initialDate, finalDate,)
    
        try:
            cursor.execute(sql, args)
            loans = cursor.fetchall()
        except:
            loans = []
        return loans
    
    def GetLoansQuantityByCategoriesBetweenDates(self, initialDate, finalDate):
        cursor = self.connection.connection.cursor()
        sql = '''
            SELECT 
            category.name as category,
            COUNT(loan.id) as quantity
            FROM
            loan
            INNER JOIN book_category ON book_category.book = loan.book
            INNER JOIN category ON category.id = book_category.category
            WHERE
            loan.active = 1 AND
            loan.deliver_date BETWEEN %s AND %s
            GROUP BY
            category.name
            '''
        
        args = (initialDate, finalDate,)
    
        try:
            cursor.execute(sql, args)
            loans = cursor.fetchall()
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