/*
=========================================
Query 09
Top 10 Videos by Views
=========================================
*/

USE youtube_realtime_dw;

SELECT

    fv.title,

    fvs.view_count

FROM fact_videos fv

JOIN fact_video_statistics fvs

ON fv.video_key = fvs.video_key

ORDER BY fvs.view_count DESC

LIMIT 10;
