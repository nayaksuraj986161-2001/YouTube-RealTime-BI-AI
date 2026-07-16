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

FROM fact_video_statistics fvs

JOIN fact_videos fv
ON fv.video_key=fvs.video_key

JOIN dim_categories dc
ON fv.category_key=dc.category_key

)

SELECT *

FROM RankedVideos

WHERE rn=1;