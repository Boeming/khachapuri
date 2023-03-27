import logging
import pymysql.cursors


class Database:
	connection = None

	def __init__(self, host, user, password, db):
		""" Создание переменных для подключения к бд, настройка логов """
		logging.basicConfig(
			filename="DataBase.log", 
			level=logging.INFO, 
			format='%(asctime)s %(levelname)s:%(message)s'
		)
		self.host = host
		self.user = user
		self.password = password
		self.db = db
		logging.info(f"Database created with {host=}, {user=}, {password=}, {db=}")

	def connect(self):
		""" Подключение к существующей бд """
		try:
			self.connection = pymysql.connect(
				host=self.host,
				user=self.user,
				password=self.password,                             
				db=self.db
			)
			logging.info("Connection created")
		except Exception as e:
			logging.error(f"Connection is not created with {e}")

	def execute_query(self, query):
		""" Выполнение sql запроса (query) """
		cursor = self.connection.cursor()
		try:
			cursor.execute(query)
			self.connection.commit()
			return cursor.fetchall()
		except Exception as e:
			logging.error(f"The error '{e}' occurred")