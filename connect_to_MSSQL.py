import pyodbc

server = "localhost"
database = "WideWorldImporters"
username = "USERNAME"
password = "PASSWORD"


def read(conn):
    print("Reading")
    cursor = conn.cursor()
    cursor.execute("select * from sales.invoices")
    for row in cursor:
        print(f"row = {row}")


# conn = pyodbc.connect(
#     "Driver={ODBC Driver 17 for SQL Server};"
#     "Server=localhost;"
#     "Database=WideWorldImporters;"
#     "Trusted_Connection=yes;"
# )

cnxn = pyodbc.connect(
    "DRIVER={ODBC Driver 17 for SQL Server};SERVER="
    + server
    + ";DATABASE="
    + database
    + ";UID="
    + username
    + ";PWD="
    + password
)
read(cnxn)

cnxn.close()
