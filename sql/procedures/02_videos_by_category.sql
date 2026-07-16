USE youtube_realtime_dw;

DROP PROCEDURE IF EXISTS sp_videos_by_category;

DELIMITER $$

CREATE PROCEDURE sp_videos_by_category
(
    IN category VARCHAR(100)
)

BEGIN

SELECT

    fv.title,

    cat.category_name,

    fvs.view_count

FROM fact_videos fv

JOIN dim_categories cat
ON fv.category_key=cat.category_key

JOIN fact_video_statistics fvs
ON fv.video_key=fvs.video_key

WHERE cat.category_name = category

ORDER BY fvs.view_count DESC;

END$$

DELIMITER ;