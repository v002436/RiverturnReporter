#!/usr/bin/python

import mysql.connector

cnx = mysql.connector.connect(user='root', database='AIR')
cursor = cnx.cursor()

add_server = ("INSERT INTO server "
               "(opsware_id, customer_id, hostname) "
               "VALUES (%s, %s, %s)")

data_employee = ('100001', '120001', 'testname')

# Insert new server
cursor.execute(add_server)
opsware_id = cursor.lastrowid

cursor.execute(add_server, data_server)

# Make sure data is committed to the database
cnx.commit()

cursor.close()
cnx.close()