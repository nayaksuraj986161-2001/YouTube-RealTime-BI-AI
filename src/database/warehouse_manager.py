"""
Warehouse Manager
-----------------
Creates the YouTube Data Warehouse automatically.
"""

from pathlib import Path
import mysql.connector
from dotenv import load_dotenv
import os

# Load environment variables
BASE_DIR = Path(__file__).resolve().parents[2]
load_dotenv(BASE_DIR / ".env")

WAREHOUSE_DIR = BASE_DIR / "database" / "warehouse"


def create_connection(database=None):
    """
    Create a MySQL connection.
    """

    connection = mysql.connector.connect(
        host=os.getenv("MYSQL_HOST"),
        port=int(os.getenv("MYSQL_PORT")),
        user=os.getenv("MYSQL_USER"),
        password=os.getenv("MYSQL_PASSWORD"),
        database=database
    )

    return connection


def initialize_data_warehouse():

    # Connect without selecting a database
    connection = create_connection()

    cursor = connection.cursor()

    print("Creating Data Warehouse...")

    cursor.execute("CREATE DATABASE IF NOT EXISTS youtube_realtime_dw;")

    cursor.close()
    connection.close()

    # Connect to the warehouse
    connection = create_connection("youtube_realtime_dw")

    cursor = connection.cursor()

    sql_files = sorted(WAREHOUSE_DIR.glob("*.sql"))

    for sql_file in sql_files:

        if sql_file.name == "00_create_data_warehouse.sql":
            continue

        print(f"Executing {sql_file.name}")

        with open(sql_file, "r", encoding="utf-8") as file:

            sql = file.read()

        cursor.execute(sql)

    connection.commit()

    cursor.close()
    connection.close()

    print("\n✅ Data Warehouse Created Successfully!")