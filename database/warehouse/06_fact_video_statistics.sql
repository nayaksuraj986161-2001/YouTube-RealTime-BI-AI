/*
=========================================
Fact Table: fact_video_statistics
=========================================
Stores historical video statistics.
=========================================
*/

CREATE TABLE IF NOT EXISTS fact_video_statistics (

    statistics_key INT AUTO_INCREMENT PRIMARY KEY,

    video_key INT NOT NULL,

    view_count BIGINT DEFAULT 0,

    like_count BIGINT DEFAULT 0,

    comment_count BIGINT DEFAULT 0,

    snapshot_date DATETIME NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (video_key)
        REFERENCES fact_videos(video_key)

);