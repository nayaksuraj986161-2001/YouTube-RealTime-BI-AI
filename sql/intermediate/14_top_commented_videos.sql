/*
==================================================
Query 14
Top Commented Videos
==================================================
*/

USE youtube_realtime_dw;

SELECT

    fv.title,

    fvs.comment_count

FROM fact_videos fv

JOIN fact_video_statistics fvs
ON fv.video_key = fvs.video_key

ORDER BY fvs.comment_count DESC

LIMIT 20;