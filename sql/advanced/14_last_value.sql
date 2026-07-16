/*
==================================================
Query 14
Least Viewed Video
==================================================
*/

USE youtube_realtime_dw;

SELECT

    fv.title,

    fvs.view_count,

    LAST_VALUE(fv.title) OVER(

        ORDER BY fvs.view_count DESC

        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING

    ) AS least_viewed_video

FROM fact_video_statistics fvs

JOIN fact_videos fv
ON fv.video_key = fvs.video_key;