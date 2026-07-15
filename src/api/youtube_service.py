import pandas as pd

from src.api.youtube_client import get_youtube_client


def fetch_trending_videos(
    region_code="IN",
    max_results=50
):
    """
    Fetch trending YouTube videos.
    """

    youtube = get_youtube_client()

    request = youtube.videos().list(
        part="snippet,statistics,contentDetails",
        chart="mostPopular",
        regionCode=region_code,
        maxResults=max_results,
    )

    response = request.execute()

    videos = []

    for item in response["items"]:

        videos.append({
            "video_id": item["id"],
            "title": item["snippet"]["title"],
            "channel": item["snippet"]["channelTitle"],
            "published_at": item["snippet"]["publishedAt"],
            "category_id": item["snippet"]["categoryId"],
            "views": item["statistics"].get("viewCount", 0),
            "likes": item["statistics"].get("likeCount", 0),
            "comments": item["statistics"].get("commentCount", 0),
        })

    df = pd.DataFrame(videos)

    return df