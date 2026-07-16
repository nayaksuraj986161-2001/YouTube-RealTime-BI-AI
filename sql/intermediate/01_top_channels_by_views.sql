/*
==================================================
Query 01
Top Channels by Total Views
==================================================
Purpose:
Find the channels with the highest total views.
==================================================
*/

USE youtube_realtime_dw;

SELECT

    dc.channel_name,

    FORMAT(SUM(fvs.view_count),0) AS total_views

FROM fact_video_statistics fvs

JOIN fact_videos fv
ON fv.video_key = fvs.video_key

JOIN dim_channels dc
ON dc.channel_key = fv.channel_key

GROUP BY dc.channel_name

ORDER BY SUM(fvs.view_count) DESC

LIMIT 10;