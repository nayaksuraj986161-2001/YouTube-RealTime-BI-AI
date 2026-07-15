CREATE TABLE videos (

    video_id VARCHAR(50) PRIMARY KEY,

    title TEXT,

    published_at DATETIME,

    category_id INT,

    channel_id VARCHAR(100),

    duration VARCHAR(30),

    region_code VARCHAR(10),

    FOREIGN KEY (category_id)

        REFERENCES categories(category_id),

    FOREIGN KEY (channel_id)

        REFERENCES channels(channel_id)

);