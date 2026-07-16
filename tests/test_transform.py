from src.etl.extract import extract_trending_videos
from src.etl.transform import transform_trending_videos


def test_transform():

    response = extract_trending_videos()

    df = transform_trending_videos(response)

    print("\nTransformation Successful!\n")

    print(df.head())

    print(f"\nRows : {len(df)}")
    print(f"Columns : {len(df.columns)}")


if __name__ == "__main__":
    test_transform()