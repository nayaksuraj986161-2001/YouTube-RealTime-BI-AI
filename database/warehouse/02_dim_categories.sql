/*
=========================================
Dimension Table: dim_categories
=========================================
Stores YouTube video categories.
=========================================
*/

CREATE TABLE IF NOT EXISTS dim_categories (

    category_key INT AUTO_INCREMENT PRIMARY KEY,

    category_id INT NOT NULL UNIQUE,

    category_name VARCHAR(100) NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);