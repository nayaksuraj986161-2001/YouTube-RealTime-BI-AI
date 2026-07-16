/*
==================================================
Query 12
Channel Growth Snapshot
==================================================
*/

USE youtube_realtime_dw;

SELECT

    dc.channel_name,

    FORMAT(SUM(fvs.view_count),0) AS total_views,

    FORMAT(SUM(fvs.like_count),0) AS total_likes,

    FORMAT(SUM(fvs.comment_count),0) AS total_comments

FROM dim_channels dc

JOIN fact_videos fv
ON dc.channel_key = fv.channel_key

JOIN fact_video_statistics fvs
ON fv.video_key = fvs.video_key

GROUP BY dc.channel_name

ORDER BY SUM(fvs.view_count) DESC;