/*
=========================================
Fact Table: fact_videos
=========================================
Stores YouTube video information.
=========================================
*/

CREATE TABLE IF NOT EXISTS fact_videos (

    video_key INT AUTO_INCREMENT PRIMARY KEY,

    video_id VARCHAR(100) NOT NULL UNIQUE,

    channel_key INT NOT NULL,

    category_key INT NOT NULL,

    region_key INT NOT NULL,

    date_key INT NOT NULL,

    title VARCHAR(500) NOT NULL,

    duration VARCHAR(50),

    published_at DATETIME,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (channel_key)
        REFERENCES dim_channels(channel_key),

    FOREIGN KEY (category_key)
        REFERENCES dim_categories(category_key),

    FOREIGN KEY (region_key)
        REFERENCES dim_regions(region_key),

    FOREIGN KEY (date_key)
        REFERENCES dim_dates(date_key)

);