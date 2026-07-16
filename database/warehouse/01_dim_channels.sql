/*
=========================================
Dimension Table: dim_channels
=========================================
Stores unique YouTube channel information.
=========================================
*/

CREATE TABLE IF NOT EXISTS dim_channels (

    channel_key INT AUTO_INCREMENT PRIMARY KEY,

    channel_id VARCHAR(100) NOT NULL UNIQUE,

    channel_name VARCHAR(255) NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);