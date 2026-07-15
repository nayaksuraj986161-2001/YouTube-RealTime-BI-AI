from src.database.db_connection import get_connection

def test_connection():
    try:
        connection = get_connection()

        if connection.is_connected():
            print("✅ Successfully connected to MySQL!")

        connection.close()

    except Exception as e:
        print("❌ Connection Failed")
        print(e)

if __name__ == "__main__":
    test_connection()