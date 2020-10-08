---시퀀스------------------------------------

-- 스터디게시판 번호
CREATE SEQUENCE STUDYBOARD_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
NOMAXVALUE
NOCYCLE
NOCACHE;

-- 스터디게시판 댓글
CREATE SEQUENCE STUDYREPLY_SEQ
MINVALUE 1
MAXVALUE 999999
INCREMENT BY 1
START WITH 1
NOCACHE
NOORDER
NOCYCLE;

-- 자유게시판 번호
create sequence freeboard_seq
increment by 1
start with 1
minvalue 1
maxvalue 999999
nocycle
nocache;

-- 자유게시판 댓글
CREATE SEQUENCE  FREEREPLY_SEQ
MINVALUE 1
MAXVALUE 999999
INCREMENT BY 1
START WITH 1
NOCACHE
NOORDER
NOCYCLE ;

-- 강의 번호
CREATE SEQUENCE lecture_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 100000
MINVALUE 1
NOCACHE
NOCYCLE;

--FAQ
create sequence faq_seq
increment by 1
start with 1
minvalue 1
maxvalue 10
nocycle
nocache;

-------------------------------------
--lec_category 
-------------------------------------
CREATE TABLE lecture_category(
category_id VARCHAR2(10) NOT NULL,
category_name VARCHAR2(50),
CONSTRAINT lecture_category_pk PRIMARY KEY (category_id)
);
--drop TABLE lecture_category CASCADE CONSTRAINTS;


---------------------------------------------
--FAQ
---------------------------------------------
CREATE TABLE FAQ(
    FAQ_ID NUMBER(3),
    FAQ_QUESTION VARCHAR2(300),
    FAQ_ANSWER VARCHAR2(3000),
    CONSTRAINT FAQ_pk PRIMARY KEY (FAQ_ID)
    );
--drop TABLE FAQ CASCADE CONSTRAINTS;


---------------------------------------------
--member
---------------------------------------------
  CREATE TABLE member
   (
   member_id VARCHAR2(15 BYTE), 
   member_favorite1 VARCHAR2(20 BYTE),
   member_favorite2 VARCHAR2(20 BYTE),
   member_favorite3 VARCHAR2(20 BYTE),
   tutor_YN VARCHAR2(1 BYTE) NOT NULL,
   member_pwd VARCHAR2(20 BYTE) NOT NULL,
   member_name VARCHAR2(20 BYTE) NOT NULL,
   member_email VARCHAR2(50 BYTE) NOT NULL, 
   member_phone VARCHAR2(14 BYTE) NOT NULL,
   member_sex VARCHAR2(6 BYTE),
   enabled number(1),
   CONSTRAINT member_pk PRIMARY KEY(member_id),
   CONSTRAINT member1_fk FOREIGN KEY (member_favorite1) REFERENCES lecture_category(category_id),
   CONSTRAINT member2_fk FOREIGN KEY (member_favorite2) REFERENCES lecture_category(category_id),
    CONSTRAINT member3_fk FOREIGN KEY (member_favorite3) REFERENCES lecture_category(category_id)
   );
   
   --drop TABLE member CASCADE CONSTRAINTS;
   

   
---------------------------------------------
--Tutor
---------------------------------------------
CREATE TABLE Tutor (
    tutor_id varchar2(15),
    tutor_category_id varchar2(10),
    tutor_nickname varchar2(50) NOT NULL,
    tutor_img varchar2(1000) NOT NULL,
    tutor_career_file varchar2(1000) NOT NULL,
    tutor_introduce varchar2(3000) NOT NULL,
    tutor_link varchar2(100),
    tutor_score number(5),
    approval_dt date,
    constraint tutor_pk primary key(tutor_id, tutor_category_id),
    constraint lecture_fk foreign key(tutor_category_id) references lecture_category(category_id),
    constraint member_fk1 foreign key(tutor_id) references member(member_id)
    );

    --DROP TABLE Tutor CASCADE CONSTRAINTS ;

    
---------------------------------------------
--freeBoard
---------------------------------------------
create table freeBoard(
    freeBoard_id number(15) not null,
    freeBoard_member_id varchar2(20) not null,
    freeBoard_title varchar2(1000) not null,
    freeBoard_content varchar2(3999) not null,
    freeBoard_fileName varchar2(1000),
    freeBoard_write_dt Date default sysdate not null,
    freeBoard_view_count number(5),
    freeBoard_deleteYN varchar2(1),
    CONSTRAINT freeBoard_pk Primary Key(freeBoard_id),
    CONSTRAINT freeBoard_fk Foreign Key(freeBoard_member_id) References member (member_id)
                ON DELETE CASCADE);
    --DROP TABLE freeBoard CASCADE CONSTRAINTS ;
    


---------------------------------------------
--FreeReply  
---------------------------------------------
  CREATE TABLE FreeReply
   (
   freeReply_id NUMBER, 
   freeReply_parent_board NUMBER NOT NULL,
   freeReply_member_id VARCHAR2(15 BYTE) NOT NULL,
   freeReply_content VARCHAR2(2000 BYTE) NOT NULL,
   freeReply_dt DATE NOT NULL,
   CONSTRAINT FreeReply_pk PRIMARY KEY (freeReply_id),
   CONSTRAINT freereply_parent_board_fk FOREIGN KEY (freeReply_parent_board) REFERENCES FreeBoard(freeBoard_id), 
   CONSTRAINT freereply_member_id_fk FOREIGN KEY (freeReply_member_id) REFERENCES member(member_id)
   );
   --DROP TABLE FreeReply CASCADE CONSTRAINTS ;
   

   
---------------------------------------------
--STUDY_BOARD 
---------------------------------------------
CREATE TABLE STUDYBOARD (
       STUDYBOARD_ID NUMBER,
       STUDYBOARD_MEMBER_ID VARCHAR2(15) NOT NULL,
       STUDYBOARD_TITLE VARCHAR2(1000) NOT NULL,
       STUDYBOARD_CONTENT VARCHAR2(3999) NOT NULL,
       STUDYBOARD_FILENAME VARCHAR2(1000),
       STUDYBOARD_WRITE_DT DATE,
       STUDYBOARD_VIEWCOUNT NUMBER(5),
       STUDYBOARD_DELETEYN VARCHAR2(1),

      CONSTRAINT STUDY_BOARD_PK PRIMARY KEY (STUDYBOARD_ID),
      CONSTRAINT MEMBER_FK FOREIGN KEY (STUDYBOARD_MEMBER_ID) REFERENCES MEMBER(MEMBER_ID)
);
   --DROP TABLE STUDY_BOARD CASCADE CONSTRAINTS ;


---------------------------------------------
CREATE TABLE studyReply (
	studyReply_id NUMBER
	, studyReply_parent_board NUMBER NOT NULL
	, studyReply_member_id  VARCHAR2(15) NOT NULL
    , studyReply_content VARCHAR2(2000)
    , studyReply_dt DATE

   ,CONSTRAINT studyReply_id_pk PRIMARY KEY(studyReply_id) 
   ,CONSTRAINT studyReply_to_studyBoard_FK FOREIGN KEY (studyReply_parent_board)REFERENCES studyBoard ( studyBoard_id )  
   ,CONSTRAINT studyReply_to_member_fk FOREIGN KEY ( studyReply_member_id )REFERENCES member ( member_id )
);
   --DROP TABLE studyReply CASCADE CONSTRAINTS ;
   
----------------------------------------------
-- 반려 사유
----------------------------------------------
CREATE TABLE reject_category(
    reject_category_id VARCHAR2(15),
    reject_category_value VARCHAR2(500) not null,
    CONSTRAINT reject_cateogry_pk PRIMARY KEY(reject_category_id)
);

---------------------------------------------
--lecture
---------------------------------------------
CREATE TABLE lecture (
    lecture_id number,
    lecture_category_id varchar2(10) NOT NULL,
    lecture_tutor_id varchar2(15) NOT NULL,
    lecture_img varchar2(1000) NOT NULL,
    lecture_title varchar2(2000) NOT NULL,
    lecture_price NUMBER(7) NOT NULL,
    lecture_state varchar2(20) NOT NULL,
    lecture_start_dt DATE NOT NULL,
    lecture_end_dt DATE NOT NULL,
    lecture_max NUMBER(3) NOT NULL,
    lecture_min NUMBER(3) NOT NULL,
    lecture_current NUMBER(3),
    CONSTRAINT lecture_id_pk primary key(lecture_id, lecture_category_id),
    CONSTRAINT lecture_category_id_FK FOREIGN KEY(lecture_category_id,lecture_tutor_id)
    REFERENCES tutor(TUTOR_CATEGORY_ID,TUTOR_ID) ON DELETE CASCADE    
    );
   --DROP TABLE lecture CASCADE CONSTRAINTS ;    

---------------------------------------------
--lecture_detail
---------------------------------------------

CREATE TABLE lecture_detail(
lecture_id number,
lecture_category_id varchar2(10),
lecture_introduce varchar2(3000),
lecture_curriculum varchar2(3000),
lecture_prepared varchar2(1500),
lecture_caution varchar2(150),
lecture_filename varchar2(1000),
lecture_reject_category varchar2(15),
lecture_reject_reason varchar2(2000),
lecture_cancel_reason varchar2(2000),
lecture_location varchar2(300),
lecture_approval_dt date,
lecture_reject_dt date,
CONSTRAINT lecture_detail_pk PRIMARY KEY(lecture_id, lecture_category_id),
CONSTRAINT lecture_detail_FK FOREIGN KEY(lecture_id, lecture_category_id)REFERENCES lecture (lecture_id, lecture_category_id),
CONSTRAINT lecture_detail_FK2 FOREIGN KEY(lecture_reject_category) REFERENCES reject_category(reject_category_id)
);

   --DROP TABLE lecture_detail CASCADE CONSTRAINTS ;
---------------------------------------------
--wishlist
---------------------------------------------
CREATE TABLE wishlist (
    lecture_id number,
    member_id varchar2(15),
    lecture_category_id varchar2(10),
    CONSTRAINT wishlist_pk PRIMARY KEY(lecture_id,member_id,lecture_category_id) ,
    CONSTRAINT lecture_fk1 FOREIGN KEY(lecture_id, lecture_category_id) REFERENCES lecture(lecture_id,lecture_category_id),
    CONSTRAINT member_id_fk1 FOREIGN KEY(member_id) REFERENCES member(member_id)
    );
    --drop table wishlist CASCADE CONSTRAINTS;

--------------------------------------------
-- 반려된 강사들 목록이다 2말이야
--------------------------------------------

CREATE TABLE tutor_reject(
    tutor_id varchar2(15),
    tutor_category_id varchar2(10),
    reject_category_id varchar2(8),
    reject_reason varchar2(3000) not null,
    reject_dt date not null,
    
    constraint tutor_reject_pk PRIMARY KEY(tutor_id, tutor_category_id, reject_category_id),
    constraint tutor_reject_fk1 FOREIGN KEY(tutor_id, tutor_category_id) REFERENCES tutor(tutor_id, tutor_category_id),
    constraint tutor_reject_fk2 FOREIGN KEY(reject_category_id) REFERENCES reject_category(reject_category_id)
);

---------------------------------------------
--MEMBER_LECTURE_HISTORY
---------------------------------------------
CREATE TABLE MEMBER_LECTURE_HISTORY (
        MEMBER_ID VARCHAR2(15),
        LECTURE_ID number,
        LECTURE_CATEGORY_ID VARCHAR2(10),
        PAYMENT_DT DATE NOT NULL,
        CANCEL_DT DATE,
        CONSTRAINT MEMBER_LECTURE_HISTORY_PK PRIMARY KEY (MEMBER_ID,LECTURE_ID,LECTURE_CATEGORY_ID),
        CONSTRAINT MEMBER_id_FK FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER(MEMBER_ID),
        CONSTRAINT LECTURE_FK2 FOREIGN KEY (LECTURE_ID,LECTURE_CATEGORY_ID) REFERENCES LECTURE(LECTURE_ID,LECTURE_CATEGORY_ID));
    --drop table MEMBER_LECTURE_HISTORY CASCADE CONSTRAINTS;
 

---------------------------------------------
--REVIEW
---------------------------------------------
CREATE TABLE REVIEW (
	lecture_category_id VARCHAR2(10)
	, member_id VARCHAR2(15)
    , lecture_id number
    , review_score NUMBER(3) not null
    , review_content VARCHAR2(3000) not null
    , review_dt DATE not null

    , CONSTRAINT lecture_category_id_pk PRIMARY KEY(lecture_category_id, member_id, lecture_id)
    , CONSTRAINT review_fk
    FOREIGN KEY (lecture_category_id, member_id, lecture_id)
    REFERENCES member_lecture_history (lecture_category_id , member_id, lecture_id)
    ON DELETE CASCADE
);
    --drop table REVIEW CASCADE CONSTRAINTS;

----------------------------------------------
-- 권한
----------------------------------------------
 CREATE TABLE MEMBER_AUTH 
(	member_id VARCHAR2(50 BYTE), 
    authority VARCHAR2(20 BYTE) not null,
    CONSTRAINT member_auth_pk PRIMARY KEY(member_id)
);

commit;


--DML 

commit;


-- 테이블, data 확인
select * from FAQ;
select * from FREEBOARD;
select * from FREEREPLY;
select * from Lecture;
select * from Lecture_category;
select * from member;
select * from studyboard;
select * from STUDYREPLY;
select * from tutor;
select * from wishlist;
select * from review;
select * from MEMBER_LECTURE_HISTORY;
select * from lecture_detail;
