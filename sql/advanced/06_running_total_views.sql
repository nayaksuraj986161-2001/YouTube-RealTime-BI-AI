/*
==================================================
Query 06
Running Total of Views
==================================================
Purpose:
Shows cumulative views as videos are ordered by
published date.
==================================================
*/

USE youtube_realtime_dw;

SELECT

    fv.title,

    fv.published_at,

    fvs.view_count,

    SUM(fvs.view_count) OVER(
        ORDER BY fv.published_at
    ) AS running_total_views

FROM fact_videos fv

JOIN fact_video_statistics fvs
ON fv.video_key = fvs.video_key

ORDER BY fv.published_at;