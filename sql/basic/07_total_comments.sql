/*
=========================================
Query 07
Total Comments
=========================================
*/

USE youtube_realtime_dw;

SELECT
    FORMAT(SUM(comment_count), 0) AS total_comments
FROM fact_video_statistics;