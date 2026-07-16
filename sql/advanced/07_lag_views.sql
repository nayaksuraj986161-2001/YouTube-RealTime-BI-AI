/*
==================================================
Query 07
Previous Video Views
==================================================
*/

USE youtube_realtime_dw;

SELECT

    fv.title,

    fvs.view_count,

    LAG(fvs.view_count) OVER(
        ORDER BY fvs.view_count DESC
    ) AS previous_video_views

FROM fact_video_statistics fvs

JOIN fact_videos fv
ON fv.video_key = fvs.video_key;