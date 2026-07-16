"""
SQL Loader Module
-----------------
Load validated YouTube data into MySQL.
"""

from src.database.db_connection import get_connection


def insert_channels(df):

    connection = get_connection()
    cursor = connection.cursor()

    query = """
    INSERT IGNORE INTO channels
    (channel_id, channel_name)
    VALUES (%s, %s)
    """

    channels = (
        df[["channel_id", "channel_title"]]
        .drop_duplicates()
        .values
        .tolist()
    )

    cursor.executemany(query, channels)

    connection.commit()

    cursor.close()
    connection.close()

    print(f"Inserted {len(channels)} channels.")