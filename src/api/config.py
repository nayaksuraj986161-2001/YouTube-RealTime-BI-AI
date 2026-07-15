from pathlib import Path
from dotenv import load_dotenv
import os

# Project Root Directory
BASE_DIR = Path(__file__).resolve().parents[2]

# Load .env file
load_dotenv(BASE_DIR / ".env")

# YouTube API Key
YOUTUBE_API_KEY = os.getenv("YOUTUBE_API_KEY")

if not YOUTUBE_API_KEY:
    raise ValueError(
        "YOUTUBE_API_KEY not found. Please add it to the .env file."
    )