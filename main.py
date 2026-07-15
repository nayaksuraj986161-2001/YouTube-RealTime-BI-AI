from src.api.youtube_service import fetch_trending_videos


def main():

    print("\nFetching Trending Videos...\n")

    df = fetch_trending_videos()

    print(df.head())

    print("\nTotal Videos:", len(df))


if __name__ == "__main__":
    main()