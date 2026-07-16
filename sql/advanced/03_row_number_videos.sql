USE youtube_realtime_dw;

SELECT

    fv.title,

    fvs.view_count,

    ROW_NUMBER() OVER(
        ORDER BY fvs.view_count DESC
    ) AS row_number

FROM fact_video_statistics fvs

JOIN fact_videos fv
ON fv.video_key=fvs.video_key;