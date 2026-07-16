import pandas as pd 
"""
Dimension Loader
----------------
Loads all dimension tables into the Data Warehouse.
"""

from src.database.db_connection import get_connection
from src.api.youtube_categories import get_video_categories


def load_channels(df):
    """
    Load unique channels into dim_channels.
    """

    connection = get_connection()
    cursor = connection.cursor()

    query = """
    INSERT IGNORE INTO dim_channels
    (channel_id, channel_name)
    VALUES (%s, %s)
    """

    rows = (
        df[
            ["channel_id", "channel_title"]
        ]
        .drop_duplicates()
        .values
        .tolist()
    )

    cursor.executemany(query, rows)

    inserted = cursor.rowcount

    connection.commit()

    cursor.close()
    connection.close()

    print(f"✓ Channels Loaded : {inserted}")


def load_categories(region_code="IN"):
    """
    Load YouTube categories into dim_categories.
    """

    categories = get_video_categories(region_code)

    connection = get_connection()
    cursor = connection.cursor()

    query = """
    INSERT IGNORE INTO dim_categories
    (category_id, category_name)
    VALUES (%s, %s)
    """

    rows = [
        (
            category["category_id"],
            category["category_name"]
        )
        for category in categories
    ]

    cursor.executemany(query, rows)

    inserted = cursor.rowcount

    connection.commit()

    cursor.close()
    connection.close()

    print(f"✓ Categories Loaded : {inserted}")
    
def load_regions():
    """
    Load supported regions into dim_regions.
    """

    connection = get_connection()
    cursor = connection.cursor()

    query = """
    INSERT IGNORE INTO dim_regions
    (region_code, country_name)
    VALUES (%s, %s)
    """

    regions = [
        ("IN", "India")
    ]

    cursor.executemany(query, regions)

    inserted = cursor.rowcount

    connection.commit()

    cursor.close()
    connection.close()

    print(f"✓ Regions Loaded : {inserted}")
    
def load_dates(df):
    """
    Load unique dates into dim_dates.
    """

    connection = get_connection()
    cursor = connection.cursor()

    query = """
    INSERT IGNORE INTO dim_dates
    (full_date, day, month, year, weekday, quarter)
    VALUES (%s, %s, %s, %s, %s, %s)
    """

    dates = (
        pd.DataFrame({
            "full_date": df["published_at"].dt.date
        })
        .drop_duplicates()
    )

    rows = []

    for date in dates["full_date"]:

        dt = pd.Timestamp(date)

        rows.append((
            dt.date(),
            dt.day,
            dt.month,
            dt.year,
            dt.day_name(),
            ((dt.month - 1) // 3) + 1
        ))

    cursor.executemany(query, rows)

    inserted = cursor.rowcount

    connection.commit()

    cursor.close()
    connection.close()

    print(f"✓ Dates Loaded : {inserted}")   