USE youtube_realtime_dw;

SELECT

    dc.category_name,

    FORMAT(SUM(fvs.like_count+fvs.comment_count),0) AS engagement

FROM fact_video_statistics fvs

JOIN fact_videos fv
ON fv.video_key=fvs.video_key

JOIN dim_categories dc
ON dc.category_key=fv.category_key

GROUP BY dc.category_name

ORDER BY SUM(fvs.like_count+fvs.comment_count) DESC;