/*
==================================================
View 01
Video Analytics
==================================================
*/

USE youtube_realtime_dw;

CREATE OR REPLACE VIEW vw_video_analytics AS

SELECT

    fv.video_key,

    fv.video_id,

    fv.title,

    dc.channel_name,

    cat.category_name,

    dr.country_name,

    dd.full_date,

    fvs.view_count,

    fvs.like_count,

    fvs.comment_count

FROM fact_videos fv

JOIN dim_channels dc
ON fv.channel_key = dc.channel_key

JOIN dim_categories cat
ON fv.category_key = cat.category_key

JOIN dim_regions dr
ON fv.region_key = dr.region_key

JOIN dim_dates dd
ON fv.date_key = dd.date_key

JOIN fact_video_statistics fvs
ON fv.video_key = fvs.video_key;