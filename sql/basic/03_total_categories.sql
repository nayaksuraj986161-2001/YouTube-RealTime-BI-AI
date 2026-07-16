/*
=========================================
Query 03
Total Categories
=========================================
*/

USE youtube_realtime_dw;

SELECT
    COUNT(*) AS total_categories
FROM dim_categories;