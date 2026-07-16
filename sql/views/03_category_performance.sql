USE youtube_realtime_dw;

CREATE OR REPLACE VIEW vw_category_performance AS

SELECT

    cat.category_name,

    COUNT(*) AS total_videos,

    SUM(fvs.view_count) AS total_views,

    SUM(fvs.like_count) AS total_likes,

    SUM(fvs.comment_count) AS total_comments

FROM dim_categories cat

JOIN fact_videos fv
ON cat.category_key = fv.category_key

JOIN fact_video_statistics fvs
ON fv.video_key = fvs.video_key

GROUP BY cat.category_name;