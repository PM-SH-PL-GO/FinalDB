CREATE TABLE lecture_detail(
lecture_id number,
lecture_category_id varchar2(10),
lecture_prepared varchar2(600),
lecture_caution varchar2(900),
lecture_fileName varchar2(100),
lecture_reject_reason varchar2(600),
lecture_cancel_reason varchar2(600),
lecture_location varchar2(300),
CONSTRAINT lecture_detail_pk PRIMARY KEY(lecture_id, lecture_category_id),
CONSTRAINT lecture_detail_fk FOREIGN KEY(lecture_id, lecture_category_id) REFERENCES lecture(lecture_id)
);

CREATE TABLE lec_category(
category_id VARCHAR2(10),
category_name VARCHAR2(50)
);