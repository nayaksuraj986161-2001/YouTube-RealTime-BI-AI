/*
==================================================
Query 01
Rank Videos by Views
==================================================
*/

USE youtube_realtime_dw;

SELECT

    fv.title,

    fvs.view_count,

    RANK() OVER(
        ORDER BY fvs.view_count DESC
    ) AS video_rank

FROM fact_video_statistics fvs

JOIN fact_videos fv
ON fv.video_key=fvs.video_key;