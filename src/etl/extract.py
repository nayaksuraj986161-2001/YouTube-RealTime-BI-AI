"""
Extract Module
--------------
Responsible for fetching live data from the YouTube API
and saving the raw API response.
"""

from src.api.youtube_client import get_youtube_client
from src.utils.file_handler import save_json


def extract_trending_videos(region_code="IN", max_results=50):
    """
    Fetch trending YouTube videos from the API.

    Parameters
    ----------
    region_code : str
        Country code (IN, US, GB, etc.)

    max_results : int
        Maximum number of videos to fetch.

    Returns
    -------
    dict
        Raw JSON response from YouTube API.
    """

    youtube = get_youtube_client()

    request = youtube.videos().list(
        part="snippet,statistics,contentDetails",
        chart="mostPopular",
        regionCode=region_code,
        maxResults=max_results,
    )

    response = request.execute()

    # Backup raw API response
    save_json(response)

    return response