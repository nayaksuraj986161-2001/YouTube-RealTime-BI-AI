/*
==================================================
Query 09
Moving Average of Views
==================================================
*/

USE youtube_realtime_dw;

SELECT

    fv.title,

    fvs.view_count,

    ROUND(
        AVG(fvs.view_count) OVER(
            ORDER BY fvs.view_count
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS moving_average

FROM fact_video_statistics fvs

JOIN fact_videos fv
ON fv.video_key = fvs.video_key;