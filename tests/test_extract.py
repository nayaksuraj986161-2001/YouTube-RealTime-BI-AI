from src.etl.extract import extract_trending_videos


def test_extract():

    response = extract_trending_videos()

    print("\nExtraction Successful!\n")

    print(f"Total Videos: {len(response['items'])}")


if __name__ == "__main__":
    test_extract()