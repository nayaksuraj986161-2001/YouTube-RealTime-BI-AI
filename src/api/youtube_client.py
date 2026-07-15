from googleapiclient.discovery import build
from src.api.config import YOUTUBE_API_KEY


def get_youtube_client():
    """
    Create and return an authenticated YouTube API client.
    """

    youtube = build(
        serviceName="youtube",
        version="v3",
        developerKey=YOUTUBE_API_KEY
    )

    return youtube