/*
==================================================
Channel Performance View
==================================================
*/

USE youtube_realtime_dw;

CREATE OR REPLACE VIEW vw_channel_performance AS

SELECT

    dc.channel_name,

    COUNT(*) AS total_videos,

    SUM(fvs.view_count) AS total_views,

    SUM(fvs.like_count) AS total_likes,

    SUM(fvs.comment_count) AS total_comments

FROM dim_channels dc

JOIN fact_videos fv
ON dc.channel_key = fv.channel_key

JOIN fact_video_statistics fvs
ON fv.video_key = fvs.video_key

GROUP BY dc.channel_name;