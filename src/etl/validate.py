"""
Validation Module
-----------------
Validate transformed YouTube data before loading into MySQL.
"""

import pandas as pd


REQUIRED_COLUMNS = [
    "video_id",
    "title",
    "channel_id",
    "channel_title",
    "published_at",
    "category_id",
    "duration",
    "view_count",
    "like_count",
    "comment_count"
]


def validate_dataframe(df: pd.DataFrame) -> pd.DataFrame:
    """
    Validate transformed DataFrame.
    """

    print("\nRunning Data Validation...\n")

    # -------------------------
    # Check Required Columns
    # -------------------------

    missing_columns = [
        column
        for column in REQUIRED_COLUMNS
        if column not in df.columns
    ]

    if missing_columns:
        raise ValueError(
            f"Missing columns: {missing_columns}"
        )

    # -------------------------
    # Remove Duplicate Videos
    # -------------------------

    duplicates = df.duplicated(subset="video_id").sum()

    if duplicates > 0:
        print(f"Removed {duplicates} duplicate rows.")

        df = df.drop_duplicates(subset="video_id")

    # -------------------------
    # Fill Missing Numeric Values
    # -------------------------

    numeric_columns = [
        "view_count",
        "like_count",
        "comment_count"
    ]

    for column in numeric_columns:
        df[column] = df[column].fillna(0)

    # -------------------------
    # Remove Missing IDs
    # -------------------------

    df = df.dropna(subset=[
        "video_id",
        "channel_id"
    ])

    # -------------------------
    # Remove Negative Statistics
    # -------------------------

    df = df[
        (df["view_count"] >= 0)
        &
        (df["like_count"] >= 0)
        &
        (df["comment_count"] >= 0)
    ]

    print("Validation Completed Successfully!\n")

    return df