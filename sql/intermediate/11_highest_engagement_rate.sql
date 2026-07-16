/*
==================================================
Query 11
Highest Engagement Rate
==================================================
*/

USE youtube_realtime_dw;

SELECT

    fv.title,

    ROUND(
        ((fvs.like_count + fvs.comment_count) / fvs.view_count) * 100,
        2
    ) AS engagement_rate

FROM fact_videos fv

JOIN fact_video_statistics fvs
ON fv.video_key = fvs.video_key

WHERE fvs.view_count > 0

ORDER BY engagement_rate DESC

LIMIT 20;