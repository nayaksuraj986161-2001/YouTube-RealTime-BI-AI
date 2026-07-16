from src.etl.extract import extract_trending_videos
from src.etl.transform import transform_trending_videos
from src.etl.validate import validate_dataframe

from src.warehouse.dimension_loader import (
    load_channels,
    load_categories,
    load_regions,
    load_dates
)

from src.warehouse.fact_loader import (
    load_fact_videos,
    load_fact_video_statistics
)


def main():

    response = extract_trending_videos()

    df = transform_trending_videos(response)

    df = validate_dataframe(df)

    # Load dimensions first
    load_channels(df)
    load_categories()
    load_regions()
    load_dates(df)

    # Load fact table
    load_fact_videos(df)
    load_fact_video_statistics(df)


if __name__ == "__main__":
    main()