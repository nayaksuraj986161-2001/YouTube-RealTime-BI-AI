/*
==================================================
Query 08
Videos by Category
==================================================
*/

USE youtube_realtime_dw;

SELECT

    dc.category_name,

    COUNT(*) AS total_videos

FROM fact_videos fv

JOIN dim_categories dc
ON fv.category_key = dc.category_key

GROUP BY dc.category_name

ORDER BY total_videos DESC;