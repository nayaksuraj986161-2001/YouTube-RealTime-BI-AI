"""
Fact Loader
-----------
Loads fact tables into the Data Warehouse.
"""

from src.database.db_connection import get_connection
from datetime import datetime


def load_fact_videos(df):
    """
    Load videos into fact_videos.
    """

    connection = get_connection()
    cursor = connection.cursor()

    query = """
    INSERT IGNORE INTO fact_videos
    (
        video_id,
        channel_key,
        category_key,
        region_key,
        date_key,
        title,
        duration,
        published_at
    )
    VALUES
    (
        %s,
        (SELECT channel_key FROM dim_channels WHERE channel_id=%s),
        (SELECT category_key FROM dim_categories WHERE category_id=%s),
        (SELECT region_key FROM dim_regions WHERE region_code=%s),
        (SELECT date_key FROM dim_dates WHERE full_date=%s),
        %s,
        %s,
        %s
    )
    """

    rows = []

    for _, row in df.iterrows():

        rows.append((
            row["video_id"],

            row["channel_id"],

            int(row["category_id"]),

            "IN",

            row["published_at"].date(),

            row["title"],

            row["duration"],

            row["published_at"]
        ))

    cursor.executemany(query, rows)

    inserted = cursor.rowcount

    connection.commit()

    cursor.close()
    connection.close()

    print(f"✓ Fact Videos Loaded : {inserted}")
    
def load_fact_video_statistics(df):
    """
    Load video statistics into fact_video_statistics.
    """

    connection = get_connection()
    cursor = connection.cursor()

    query = """
    INSERT INTO fact_video_statistics
    (
        video_key,
        view_count,
        like_count,
        comment_count,
        snapshot_date
    )
    VALUES
    (
        (SELECT video_key
         FROM fact_videos
         WHERE video_id=%s),

        %s,
        %s,
        %s,
        %s
    )
    """

    rows = []

    snapshot = datetime.now()

    for _, row in df.iterrows():

        rows.append((
            row["video_id"],
            int(row["view_count"]),
            int(row["like_count"]),
            int(row["comment_count"]),
            snapshot
        ))

    cursor.executemany(query, rows)

    inserted = cursor.rowcount

    connection.commit()

    cursor.close()
    connection.close()

    print(f"✓ Video Statistics Loaded : {inserted}")