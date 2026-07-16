/*
==================================================
Query 15
Top 3 Videos in Each Category
==================================================
*/

USE youtube_realtime_dw;

WITH RankedVideos AS (

    SELECT

        dc.category_name,

        fv.title,

        fvs.view_count,

        ROW_NUMBER() OVER(

            PARTITION BY dc.category_name

            ORDER BY fvs.view_count DESC

        ) AS rn

    FROM fact_videos fv

    JOIN dim_categories dc
    ON fv.category_key = dc.category_key

    JOIN fact_video_statistics fvs
    ON fv.video_key = fvs.video_key

)

SELECT

    category_name,

    title,

    view_count

FROM RankedVideos

WHERE rn <= 3

ORDER BY category_name, view_count DESC;