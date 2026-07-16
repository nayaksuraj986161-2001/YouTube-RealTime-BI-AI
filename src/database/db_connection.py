import mysql.connector
from dotenv import load_dotenv
from pathlib import Path
import os

# Load .env
BASE_DIR = Path(__file__).resolve().parents[2]
load_dotenv(BASE_DIR / ".env")


def get_connection(database=None):
    """
    Returns a MySQL database connection.
    """

    connection = mysql.connector.connect(
    host=os.getenv("MYSQL_HOST"),
    port=int(os.getenv("MYSQL_PORT")),
    user=os.getenv("MYSQL_USER"),
    password=os.getenv("MYSQL_PASSWORD"),
    database=database or os.getenv("MYSQL_DATABASE")
)

    return connection