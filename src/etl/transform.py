"""
Transform Module
----------------
Convert raw YouTube API JSON into a clean DataFrame.
"""

import pandas as pd

from src.utils.file_handler import save_csv


def transform_trending_videos(response):
    """
    Convert raw API response into a cleaned DataFrame.
    """

    videos = []

    for item in response["items"]:

        snippet = item["snippet"]
        statistics = item.get("statistics", {})
        content = item.get("contentDetails", {})

        videos.append({

            # Video Information
            "video_id": item["id"],
            "title": snippet["title"],

            # Channel Information
            "channel_id": snippet["channelId"],
            "channel_title": snippet["channelTitle"],

            # Metadata
            "published_at": snippet["publishedAt"],
            "category_id": snippet["categoryId"],
            "duration": content.get("duration"),

            # Statistics
            "view_count": int(statistics.get("viewCount", 0)),
            "like_count": int(statistics.get("likeCount", 0)),
            "comment_count": int(statistics.get("commentCount", 0))

        })

    df = pd.DataFrame(videos)

    # Remove duplicate videos
    df.drop_duplicates(subset="video_id", inplace=True)

    # Convert published date
    df["published_at"] = pd.to_datetime(df["published_at"])

    # Save processed CSV
    save_csv(df, "trending_videos_processed.csv")

    return df