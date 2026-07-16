/*
=========================================
Query 04
Total Regions
=========================================
*/

USE youtube_realtime_dw;

SELECT
    COUNT(*) AS total_regions
FROM dim_regions;