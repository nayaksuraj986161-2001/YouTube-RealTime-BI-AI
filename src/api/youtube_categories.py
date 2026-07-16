"""
YouTube Categories API
----------------------
Fetches official YouTube video categories.
"""

from src.api.youtube_client import get_youtube_client


def get_video_categories(region_code="IN"):
    """
    Fetch all YouTube categories for a region.

    Parameters
    ----------
    region_code : str
        Country code (IN, US, GB...)

    Returns
    -------
    list
        List of category dictionaries.
    """

    youtube = get_youtube_client()

    request = youtube.videoCategories().list(
        part="snippet",
        regionCode=region_code
    )

    response = request.execute()

    categories = []

    for item in response["items"]:

        categories.append({

            "category_id": int(item["id"]),

            "category_name": item["snippet"]["title"]

        })

    return categories