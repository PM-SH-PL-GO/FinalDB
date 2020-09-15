SELECT le.lecture_id, le.lecture_img, le.lecture_title, le.lecture_price, le.lecture_state
, le.lecture_start_dt, le.lecture_end_dt, le.lecture_max, le.lecture_current
, tu.tutor_nickname
FROM lecture le
JOIN tutor tu ON (tu.tutor_id = le.lecture_tutor_id AND tu.TUTOR_CATEGORY_ID = le.LECTURE_CATEGORY_ID)
WHERE le.lecture_id = 2;

SELECT le.lecture_id, le.lecture_img, le.lecture_title, le.lecture_price, le.lecture_state
, le.lecture_start_dt, le.lecture_end_dt, le.lecture_max, le.lecture_current
, tu.tutor_nickname
FROM lecture le
JOIN tutor tu ON (tu.tutor_id = le.lecture_tutor_id AND tu.TUTOR_CATEGORY_ID = le.LECTURE_CATEGORY_ID)
WHERE le.lecture_id = 2;