USE youtube_realtime_dw;

SELECT

    fv.title,

    fvs.view_count,

    DENSE_RANK() OVER(
        ORDER BY fvs.view_count DESC
    ) AS dense_rank

FROM fact_video_statistics fvs

JOIN fact_videos fv
ON fv.video_key=fvs.video_key;