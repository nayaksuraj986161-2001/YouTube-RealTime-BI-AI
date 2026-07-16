/*
==================================================
Query 11
Category Summary Using CTE
==================================================
Purpose:
Summarize total videos, views, likes, and comments
for each category.
==================================================
*/

USE youtube_realtime_dw;

WITH CategorySummary AS (

    SELECT

        dc.category_name,

        COUNT(*) AS total_videos,

        SUM(fvs.view_count) AS total_views,

        SUM(fvs.like_count) AS total_likes,

        SUM(fvs.comment_count) AS total_comments

    FROM dim_categories dc

    JOIN fact_videos fv
    ON dc.category_key = fv.category_key

    JOIN fact_video_statistics fvs
    ON fv.video_key = fvs.video_key

    GROUP BY dc.category_name

)

SELECT *

FROM CategorySummary

ORDER BY total_views DESC;