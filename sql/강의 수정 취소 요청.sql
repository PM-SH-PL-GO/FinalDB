UPDATE lecture
SET LECTURE_IMG = '수정', LECTURE_TITLE = '수정', LECTURE_PRICE = 100
, LECTURE_START_DT = '20/11/11', LECTURE_END_DT = '20/11/12', LECTURE_MAX = 16, LECTURE_MIN = 3
WHERE LECTURE_ID = 4;

UPDATE lecture_detail
SET LECTURE_INTRODUCE = '수정', LECTURE_CURRICULUM = '수정', LECTURE_PREPARED = '수정', LECTURE_CAUTION = '수정', LECTURE_FILENAME = '수정', LECTURE_LOCATION = '수정'
WHERE LECTURE_ID = 4;
commit;
UPDATE lecture
SET LECTURE_STATE = '취소대기'
WHERE LECTURE_ID = 5;

UPDATE member_lecture_history
SET CANCEL_DT = SYSDATE
WHERE member_id = 'member1' AND lecture_id = 1;
commit;