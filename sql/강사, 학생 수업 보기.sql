SELECT le.lecture_id, le.lecture_img, le.lecture_title, le.lecture_price, le.lecture_state
, le.lecture_start_dt, le.lecture_end_dt, le.lecture_max, le.lecture_current
, tu.tutor_nickname
FROM lecture le
JOIN tutor tu ON (tu.tutor_id = le.lecture_tutor_id AND tu.TUTOR_CATEGORY_ID = le.LECTURE_CATEGORY_ID)
JOIN member m ON (m.member_id = tu.tutor_id)
WHERE le.LECTURE_TUTOR_ID = 'member3' AND m.tutor_yn = 'Y';

SELECT mlh.lecture_id, mlh.payment_dt, mlh.cancel_dt, le.lecture_img, le.lecture_title, le.lecture_price, le.lecture_state
, le.lecture_start_dt, le.lecture_end_dt, le.lecture_max, le.lecture_current
, tu.tutor_nickname
FROM member_lecture_history mlh
JOIN lecture le ON (mlh.lecture_id = le.lecture_id AND mlh.LECTURE_CATEGORY_ID = le.LECTURE_CATEGORY_ID)
JOIN tutor tu ON (le.LECTURE_CATEGORY_ID = tu.TUTOR_CATEGORY_ID)
WHERE mlh.MEMBER_ID = 'member1';