/*
=========================================
Query 08
Latest Trending Videos
=========================================
*/

USE youtube_realtime_dw;

SELECT

    title,

    published_at

FROM fact_videos

ORDER BY published_at DESC

LIMIT 10;