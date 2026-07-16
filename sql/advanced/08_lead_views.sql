/*
==================================================
Query 08
Next Video Views
==================================================
*/

USE youtube_realtime_dw;

SELECT

    fv.title,

    fvs.view_count,

    LEAD(fvs.view_count) OVER(
        ORDER BY fvs.view_count DESC
    ) AS next_video_views

FROM fact_video_statistics fvs

JOIN fact_videos fv
ON fv.video_key = fvs.video_key;