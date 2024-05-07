from .BaseModel import BaseModel

class CategoryModel(BaseModel):
    def GetCategories(self):
        cursor = self.connection.connection.cursor()
        sql = "SELECT name FROM category"
        cursor.execute(sql)
        return cursor.fetchall()

    def CreateCategory(self, categoryData):
        name = categoryData['name']
        cursor = self.connection.connection.cursor()
        sql = "INSERT INTO category (name) VALUES (`{0}`)".format(name)
        try:
            cursor.execute(sql)
            self.connection.connection.commit()
            result = True
        except Exception as e:
            result = 'Hubo un error al crear la categoría'

        return result
    
    def GetCategoryByName(self, name):
        cursor = self.connection.connection.cursor()
        sql = "SELECT * FROM category WHERE name = '{0}'".format(name)
        cursor.execute(sql)
        return cursor.fetchone()
    
    def GetCategoryById(self, id):
        cursor = self.connection.connection.cursor()
        sql = "SELECT * FROM category WHERE id = '{0}'".format(id)
        cursor.execute(sql)
        return cursor.fetchone()

    def AddCategoriesToBook(self, bookId, categories):
        cursor = self.connection.connection.cursor()
        result = True
        sql = "INSERT INTO book_category (book, category) VALUES "
        for category in categories:
            sql += "({0}, {1}),".format(bookId, category)
        
        sql = sql[0:-1]  # Skipping the last comma
        try:
            cursor.execute(sql)
            self.connection.connection.commit()
        except:
            result = False

        return result

    def GetCategoriesOfBook(self, id):
        cursor = self.connection.connection.cursor()
        sql = '''
            SELECT
            category.name
            FROM
            category
            INNER JOIN book_category ON book_category.category = category.id
            INNER JOIN book ON book.id = book_category.book
            WHERE
            book.id = {0}
            '''.format(id)

        cursor.execute(sql)
        categories = cursor.fetchall()

        if categories is None:
            categories = []
        
        ordered_categories = []
        for category in categories:
            ordered_categories.append(category['name'])
        
        return ordered_categories
    
    def CategoriesExists(self, ids):
        cursor = self.connection.connection.cursor()
        orderedIds = ''
        for id in ids:
            orderedIds += "'{0}',".format(id)
        
        orderedIds = orderedIds[0:-1]
        sql = "SELECT * FROM category WHERE id IN ({0})".format(orderedIds)
        cursor.execute(sql)
        categories = cursor.fetchall()
        if categories is None:
            result = False
        else:
            result = len(categories) == len(ids)

        return result