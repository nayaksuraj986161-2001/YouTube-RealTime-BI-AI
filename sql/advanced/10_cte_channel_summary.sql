/*
==================================================
Query 10
Channel Summary Using CTE
==================================================
*/

USE youtube_realtime_dw;

WITH ChannelSummary AS (

    SELECT

        dc.channel_name,

        COUNT(*) AS total_videos,

        SUM(fvs.view_count) AS total_views,

        SUM(fvs.like_count) AS total_likes

    FROM dim_channels dc

    JOIN fact_videos fv
    ON dc.channel_key = fv.channel_key

    JOIN fact_video_statistics fvs
    ON fv.video_key = fvs.video_key

    GROUP BY dc.channel_name

)

SELECT *

FROM ChannelSummary

ORDER BY total_views DESC;