/*
=========================================
Query 10
Top 10 Videos by Likes
=========================================
*/

USE youtube_realtime_dw;

SELECT

    fv.title,

    fvs.like_count

FROM fact_videos fv

JOIN fact_video_statistics fvs

ON fv.video_key = fvs.video_key

ORDER BY fvs.like_count DESC

LIMIT 10;