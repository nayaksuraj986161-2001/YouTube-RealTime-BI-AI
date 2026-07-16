from src.etl.extract import extract_trending_videos
from src.etl.transform import transform_trending_videos
from src.etl.validate import validate_dataframe

from src.database.sql_loader import insert_channels


def test():

    response = extract_trending_videos()

    df = transform_trending_videos(response)

    df = validate_dataframe(df)

    insert_channels(df)


if __name__ == "__main__":
    test()