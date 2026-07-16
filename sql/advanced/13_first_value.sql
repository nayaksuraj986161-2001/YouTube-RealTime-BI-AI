/*
==================================================
Query 13
Most Viewed Video
==================================================
*/

USE youtube_realtime_dw;

SELECT

    fv.title,

    fvs.view_count,

    FIRST_VALUE(fv.title) OVER(
        ORDER BY fvs.view_count DESC
    ) AS most_viewed_video

FROM fact_video_statistics fvs

JOIN fact_videos fv
ON fv.video_key = fvs.video_key;