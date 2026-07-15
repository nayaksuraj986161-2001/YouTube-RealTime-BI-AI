CREATE TABLE video_statistics (

    id INT AUTO_INCREMENT PRIMARY KEY,

    video_id VARCHAR(50),

    views BIGINT,

    likes BIGINT,

    comments BIGINT,

    collected_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(video_id)

        REFERENCES videos(video_id)

);