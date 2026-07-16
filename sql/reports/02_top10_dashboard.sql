USE youtube_realtime_dw;

SELECT

    fv.title,

    dc.channel_name,

    cat.category_name,

    fvs.view_count,

    fvs.like_count,

    fvs.comment_count

FROM fact_video_statistics fvs

JOIN fact_videos fv
ON fv.video_key=fvs.video_key

JOIN dim_channels dc
ON fv.channel_key=dc.channel_key

JOIN dim_categories cat
ON fv.category_key=cat.category_key

ORDER BY fvs.view_count DESC

LIMIT 10;