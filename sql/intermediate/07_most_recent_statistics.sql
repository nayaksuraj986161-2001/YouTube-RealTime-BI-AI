/*
==================================================
Query 07
Latest Video Statistics
==================================================
*/

USE youtube_realtime_dw;

SELECT

    fv.title,

    fvs.view_count,

    fvs.like_count,

    fvs.comment_count,

    fvs.snapshot_date

FROM fact_video_statistics fvs

JOIN fact_videos fv
ON fv.video_key = fvs.video_key

ORDER BY fvs.snapshot_date DESC;