/*
==================================================
Query 09
Video Durations
==================================================
*/

USE youtube_realtime_dw;

SELECT

    title,

    duration

FROM fact_videos

ORDER BY published_at DESC;