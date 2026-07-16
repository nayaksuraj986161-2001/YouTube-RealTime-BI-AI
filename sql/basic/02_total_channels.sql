/*
=========================================
Query 02
Total Channels
=========================================
*/

USE youtube_realtime_dw;

SELECT
    COUNT(*) AS total_channels
FROM dim_channels;