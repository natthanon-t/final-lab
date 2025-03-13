from flask import Flask
import pyodbc

app = Flask(__name__)

# DB Configuration
DB_HOST = "mssql-server"
DB_USER = "sa"
DB_PASSWORD = "YourStrong!Password"

@app.route('/api/hello')
def hello_world():
    conn = pyodbc.connect(f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={DB_HOST};DATABASE=master;UID={DB_USER};PWD={DB_PASSWORD}')
    cursor = conn.cursor()
    cursor.execute("SELECT 'Hello, World!'")
    row = cursor.fetchone()
    conn.close()
    return row[0]

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
