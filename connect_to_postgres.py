DB_HOST = "localhost"
DB_NAME = "DATABASE_NAME"
DB_USER = "PASSWORD"
DB_PASS = "PASSWORD"

import psycopg2
import psycopg2.extras


conn = psycopg2.connect(dbname=DB_NAME, user=DB_USER, password=DB_PASS, host=DB_HOST)

with conn:
    cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
    with cur:
        a = cur.execute("SELECT * FROM configuration")
        b = cur.fetchone()
        print(b)
