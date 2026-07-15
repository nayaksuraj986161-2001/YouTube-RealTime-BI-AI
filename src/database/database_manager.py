from pathlib import Path
from src.database.db_connection import get_connection


BASE_DIR = Path(__file__).resolve().parents[2]
SCHEMA_DIR = BASE_DIR / "database" / "schema"


def initialize_database():
    """
    Execute all SQL schema files in order.
    """

    connection = get_connection()
    cursor = connection.cursor()

    sql_files = sorted(SCHEMA_DIR.glob("*.sql"))

    for sql_file in sql_files:

        print(f"Executing: {sql_file.name}")

        with open(sql_file, "r", encoding="utf-8") as file:
            sql_script = file.read()

        cursor.execute(sql_script)

    connection.commit()

    cursor.close()
    connection.close()

    print("\n✅ Database initialized successfully!")