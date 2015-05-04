#!/usr/local/bin/python
# view_rows.py - Fetch and display the rows from a MySQL database query
# import the MySQLdb and sys modules
import MySQLdb
import sys
# open a database connection
# be sure to change the host IP address, username, password and database name to match your own
connection = MySQLdb.connect (host = "localhost", user = "root", passwd = "R00tw0rd!", db = "AIR")
# prepare a cursor object using cursor() method
cursor = connection.cursor ()
# execute the SQL query using execute() method.
cursor.execute (sys.argv[1])
# fetch all of the rows from the query
data = cursor.fetchall ()
# print the rows
for row in data :
	print row
# close the cursor object
cursor.close ()
# close the connection
connection.close ()
# exit the program
sys.exit()
