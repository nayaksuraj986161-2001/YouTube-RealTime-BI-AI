USE youtube_realtime_dw;

WITH RankedChannels AS (

SELECT

    dc.category_name,

    ch.channel_name,

    SUM(fvs.view_count) AS total_views,

    ROW_NUMBER() OVER(

        PARTITION BY dc.category_name

        ORDER BY SUM(fvs.view_count) DESC

    ) AS rn

FROM fact_video_statistics fvs

JOIN fact_videos fv
ON fv.video_key=fvs.video_key

JOIN dim_categories dc
ON fv.category_key=dc.category_key

JOIN dim_channels ch
ON fv.channel_key=ch.channel_key

GROUP BY
dc.category_name,
ch.channel_name

)

SELECT *

FROM RankedChannels

WHERE rn=1;