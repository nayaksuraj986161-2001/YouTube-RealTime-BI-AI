/*
=========================================
Query 05
Total Views
=========================================
*/

USE youtube_realtime_dw;

SELECT
    FORMAT(SUM(view_count), 0) AS total_views
FROM fact_video_statistics;
