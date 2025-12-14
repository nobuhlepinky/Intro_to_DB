import mysql.connector
from mysql.connector import Error


DB_HOST = "localhost"
DB_USER = "root"        
DB_PASSWORD = "Nobuhle3@ump"    
DATABASE_NAME = "alx_book_store" 


def create_alx_book_store_db():
    """Connects to the MySQL server and creates the specified database."""
    
    
    mydb = None
    cursor = None

    try:
        
        mydb = mysql.connector.connect(
            host=DB_HOST,
            user=DB_USER,
            password=DB_PASSWORD
        )

        if mydb.is_connected():
            print("Connection to MySQL Server successful.")
            
           
            cursor = mydb.cursor()
            
          
            create_db_query = f"CREATE DATABASE IF NOT EXISTS {DATABASE_NAME}"
            
            cursor.execute(create_db_query)
            
           
            print(f"Database '{DATABASE_NAME}' created successfully or already exists!")
            
        else:
            print("FAILED: Could not establish a connection to the MySQL Server.")

    except Error as e:
        
        print(f"ERROR: Failed to connect to DB or execute query: {e}")
        
    finally:
        
        if cursor:
            cursor.close()
        if mydb and mydb.is_connected():
            mydb.close()
            print("MySQL connection closed.")


if __name__ == "__main__":
    create_alx_book_store_db()