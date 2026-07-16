from src.api.youtube_categories import get_video_categories


def main():

    categories = get_video_categories()

    print("\nYouTube Categories\n")

    for category in categories:

        print(category)


if __name__ == "__main__":
    main()