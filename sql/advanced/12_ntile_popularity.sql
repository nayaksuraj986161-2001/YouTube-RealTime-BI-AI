/*
==================================================
Query 12
Popularity Quartiles using NTILE
==================================================
*/

USE youtube_realtime_dw;

SELECT

    fv.title,

    fvs.view_count,

    NTILE(4) OVER(
        ORDER BY fvs.view_count DESC
    ) AS popularity_quartile

FROM fact_video_statistics fvs

JOIN fact_videos fv
ON fv.video_key = fvs.video_key;