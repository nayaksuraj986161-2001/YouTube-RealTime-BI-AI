/*
=========================================
Query 01
Total Trending Videos
=========================================
*/

USE youtube_realtime_dw;

SELECT
    COUNT(*) AS total_trending_videos
FROM fact_videos;


