/*
==================================================
Query 06
Channel Engagement Analysis
==================================================
Purpose:
Shows total views, likes, comments, and engagement
for each channel.
==================================================
*/

USE youtube_realtime_dw;

SELECT

    dc.channel_name,

    FORMAT(SUM(fvs.view_count),0) AS total_views,

    FORMAT(SUM(fvs.like_count),0) AS total_likes,

    FORMAT(SUM(fvs.comment_count),0) AS total_comments,

    FORMAT(SUM(fvs.like_count + fvs.comment_count),0) AS total_engagement

FROM fact_video_statistics fvs

JOIN fact_videos fv
ON fv.video_key = fvs.video_key

JOIN dim_channels dc
ON dc.channel_key = fv.channel_key

GROUP BY dc.channel_name

ORDER BY SUM(fvs.like_count + fvs.comment_count) DESC;