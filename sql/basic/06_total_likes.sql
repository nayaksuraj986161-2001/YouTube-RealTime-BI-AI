/*
=========================================
Query 06
Total Likes
=========================================
*/

USE youtube_realtime_dw;

SELECT
    FORMAT(SUM(like_count), 0) AS total_likes
FROM fact_video_statistics;