CREATE TABLE lecture_detail(
lecture_id varchar2(60),
lecture_category_id varchar2(50),
lecture_prepared varchar2(600),
lecture_caution varchar2(900),
lecture_fileName varchar2(200),
lecture_reject_reason varchar2(600),
lecture_cancel_reject varchar2(600),
lecture_location varchar2(300),
CONSTRAINT lecture_detail_pk PRIMARY KEY(lecture_id, lecture_category_id),
CONSTRAINT lecture_detail_fk FOREIGN KEY(lecture_id, lecture_category_id) REFERENCES lecture(lecture_id)
);

CREATE TABLE lec_category(
category_id VARCHAR2(20),
category_name VARCHAR2(50)
);