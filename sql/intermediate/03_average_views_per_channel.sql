USE youtube_realtime_dw;

SELECT

    dc.channel_name,

    ROUND(AVG(fvs.view_count),2) AS average_views

FROM fact_video_statistics fvs

JOIN fact_videos fv
ON fv.video_key=fvs.video_key

JOIN dim_channels dc
ON dc.channel_key=fv.channel_key

GROUP BY dc.channel_name

ORDER BY average_views DESC;