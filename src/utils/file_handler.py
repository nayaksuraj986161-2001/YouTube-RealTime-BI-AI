from pathlib import Path
from datetime import datetime
import json
import pandas as pd

# ==========================
# Project Directories
# ==========================

BASE_DIR = Path(__file__).resolve().parents[2]

CACHE_DIR = BASE_DIR / "cache" / "api_responses"
RAW_DIR = BASE_DIR / "database" / "raw"

# Create directories if they don't exist
CACHE_DIR.mkdir(parents=True, exist_ok=True)
RAW_DIR.mkdir(parents=True, exist_ok=True)


# ==========================
# Save Raw JSON Response
# ==========================

def save_json(data, prefix="trending"):
    """
    Save the raw YouTube API response as a timestamped JSON file.
    """

    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")

    filename = CACHE_DIR / f"{prefix}_{timestamp}.json"

    with open(filename, "w", encoding="utf-8") as file:
        json.dump(data, file, indent=4)

    return filename


# ==========================
# Save DataFrame as CSV
# ==========================

def save_csv(df, filename="trending_videos.csv"):
    """
    Save the extracted DataFrame as a CSV file.
    """

    file_path = RAW_DIR / filename

    df.to_csv(file_path, index=False)

    return file_path