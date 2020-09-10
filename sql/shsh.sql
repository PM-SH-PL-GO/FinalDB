CREATE TABLE lecture (

       lecture_id NUMBER(10),
       lecture_category_id varchar2(100),
       lecture_tutor_id varchar2(100),
       lecture_img varchar2(100),
       lecture_title varchar2(100),
       lecture_content varchar2(3000),
       lecture_price NUMBER(7),
       lecture_state varchar2(100),
       lecture_start_dt DATE,
       lecture_end_dt DATE,
       lecture_max NUMBER(3),
       lecture_min NUMBER(3),
       lecture_current NUMBER(3),
       CONSTRAINT lecture_category_id_F FOREIGN KEY(lecture_category_id)
       REFERENCES tutor_info(lecture_category_id)
       ON DELETE CASCADE,
       CONSTRAINT lecture_id_P primary key(lecture_id,lecture_category_id),
       CONSTRAINT lecture_id_F FOREIGN KEY(lecture_id)
       REFERENCES tutor_info(lecture_id)
       ON DELETE CASCADE
       );
       
CREATE TABLE FAQ(
    FAQ_ID NUMBER(3),CONSTRAINT FAQ_ID PRIMARY KEY,
    FAQ_QUESTION VARCHAR2(300),
    FAQ_ANSWER VARCHAR2(300)
);

--시퀀스--
CREATE SEQUENCE FAQ_SEQ
INCREMENT BY 1 
START WITH 1
MINVALUE 1 
MAXVALUE 1000                          
CYCLE 
CACHE 10;





