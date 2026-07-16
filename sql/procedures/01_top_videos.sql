USE youtube_realtime_dw;

DROP PROCEDURE IF EXISTS sp_top_videos;

DELIMITER $$

CREATE PROCEDURE sp_top_videos()

BEGIN

SELECT

    fv.title,

    fvs.view_count,

    fvs.like_count,

    fvs.comment_count

FROM fact_videos fv

JOIN fact_video_statistics fvs
ON fv.video_key=fvs.video_key

ORDER BY fvs.view_count DESC

LIMIT 10;

END$$

DELIMITER ;