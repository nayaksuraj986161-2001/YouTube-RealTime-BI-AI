/*
==================================================
Query 13
Category View Distribution
==================================================
*/

USE youtube_realtime_dw;

SELECT

    dc.category_name,

    FORMAT(SUM(fvs.view_count),0) AS total_views

FROM dim_categories dc

JOIN fact_videos fv
ON dc.category_key = fv.category_key

JOIN fact_video_statistics fvs
ON fv.video_key = fvs.video_key

GROUP BY dc.category_name

ORDER BY SUM(fvs.view_count) DESC;