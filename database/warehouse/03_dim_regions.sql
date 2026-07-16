/*
=========================================
Dimension Table: dim_regions
=========================================
Stores YouTube region information.
=========================================
*/

CREATE TABLE IF NOT EXISTS dim_regions (

    region_key INT AUTO_INCREMENT PRIMARY KEY,

    region_code VARCHAR(10) NOT NULL UNIQUE,

    country_name VARCHAR(100) NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);