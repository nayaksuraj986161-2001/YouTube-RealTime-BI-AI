/*
==================================================
Category Performance
==================================================
*/

USE youtube_realtime_dw;

SELECT

    dc.category_name,

    COUNT(*) AS total_videos,

    FORMAT(SUM(fvs.view_count),0) AS total_views,

    FORMAT(SUM(fvs.like_count),0) AS total_likes

FROM fact_videos fv

JOIN dim_categories dc
ON fv.category_key = dc.category_key

JOIN fact_video_statistics fvs
ON fv.video_key = fvs.video_key

GROUP BY dc.category_name

ORDER BY SUM(fvs.view_count) DESC;