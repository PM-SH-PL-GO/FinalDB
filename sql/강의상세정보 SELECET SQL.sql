SELECT le.lecture_id, le.lecture_img, le.lecture_title, le.lecture_category_id, le.lecture_price, le.lecture_state
, le.lecture_start_dt, le.lecture_end_dt, le.lecture_max, le.lecture_min, le.lecture_current
, ld.lecture_introduce, ld.lecture_curriculum, ld.lecture_prepared, ld.lecture_caution, ld.lecture_filename, ld.lecture_location
, tu.tutor_id, tu.tutor_category_id, tu.tutor_nickname, tu.tutor_img, tu.tutor_score
FROM lecture le
JOIN lecture_detail ld ON (ld.lecture_id = le.lecture_id AND ld.LECTURE_CATEGORY_ID = le.LECTURE_CATEGORY_ID)
JOIN tutor tu ON (tu.tutor_id = le.lecture_tutor_id AND tu.TUTOR_CATEGORY_ID = le.LECTURE_CATEGORY_ID)
WHERE le.lecture_id = 2;