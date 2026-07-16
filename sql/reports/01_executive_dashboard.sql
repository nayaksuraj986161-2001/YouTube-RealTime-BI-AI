USE youtube_realtime_dw;

SELECT

(
SELECT COUNT(*) FROM fact_videos
) AS total_videos,

(
SELECT COUNT(*) FROM dim_channels
) AS total_channels,

(
SELECT COUNT(*) FROM dim_categories
) AS total_categories,

(
SELECT SUM(view_count)
FROM fact_video_statistics
) AS total_views,

(
SELECT SUM(like_count)
FROM fact_video_statistics
) AS total_likes,

(
SELECT SUM(comment_count)
FROM fact_video_statistics
) AS total_comments;