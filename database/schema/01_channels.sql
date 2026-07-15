CREATE TABLE channels (

    channel_id VARCHAR(100) PRIMARY KEY,

    channel_name VARCHAR(255) NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);