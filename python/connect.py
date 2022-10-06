import mysql.connector
from mysql.connector import Error
try:
    conn = mysql.connector.connect(
        host='localhost', database='company',  user='root', password='')
    if conn.is_connected():
        cursor = conn.cursor()
        cursor.execute("drop table if exists empdetails")
        cursor.execute(
            "create table empdetails(empno int,empname varchar(20))")
        print("**Table created**")
        cursor.execute("insert into empdetails values(1,'Reena')")
        cursor.execute("insert into empdetails values(2,'Reetta')")
        cursor.execute("insert into empdetails values(3,'Rekha')")
        print("**3 Records Inserted**")
        cursor.execute("select * from empdetails")
        print("***Records Retrieved**")
        while (1):
            row = cursor.fetchone()
            if row == None:
                break
            print(row[0], row[1])
        print("The number of rows returned %d" % cursor.rowcount)
except Error as e:
    print("Error while connecting to MySQL", e)
finally:
    if conn.is_connected():
        cursor.close()
        conn.commit()
        conn.close()
        print("MySQL connection is closed")
