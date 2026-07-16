/*
=========================================
Dimension Table: dim_dates
=========================================
Stores calendar information.
=========================================
*/

CREATE TABLE IF NOT EXISTS dim_dates (

    date_key INT AUTO_INCREMENT PRIMARY KEY,

    full_date DATE NOT NULL UNIQUE,

    day INT NOT NULL,

    month INT NOT NULL,

    year INT NOT NULL,

    weekday VARCHAR(20),

    quarter INT

);