/*
==================================================
Query 10
Top Channels by Video Count
==================================================
*/

USE youtube_realtime_dw;

SELECT

    dc.channel_name,

    COUNT(*) AS total_videos

FROM fact_videos fv

JOIN dim_channels dc
ON fv.channel_key = dc.channel_key

GROUP BY dc.channel_name

ORDER BY total_videos DESC;