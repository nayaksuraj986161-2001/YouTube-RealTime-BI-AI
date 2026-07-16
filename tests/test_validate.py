from src.etl.extract import extract_trending_videos
from src.etl.transform import transform_trending_videos
from src.etl.validate import validate_dataframe


def test_validation():

    response = extract_trending_videos()

    df = transform_trending_videos(response)

    df = validate_dataframe(df)

    print(df.head())

    print(f"\nRows : {len(df)}")
    print(f"Columns : {len(df.columns)}")


if __name__ == "__main__":
    test_validation()