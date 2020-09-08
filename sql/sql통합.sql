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
    FAQ_ANSWER VARCHAR2(300),
    CONSTRAINT FAQ_pk PRIMARY KEY (FAQ_ID)
    );
--drop TABLE FAQ CASCADE CONSTRAINTS;
---------------------------------------------
--member
---------------------------------------------
  CREATE TABLE member
   (
   member_id VARCHAR2(15 BYTE) PRIMARY KEY, 
   member_favorite1 VARCHAR2(20 BYTE),
   member_favorite2 VARCHAR2(20 BYTE),
   member_favorite3 VARCHAR2(20 BYTE),
   tutor_YN VARCHAR2(1 BYTE) NOT NULL,
   member_pwd VARCHAR2(20 BYTE) NOT NULL,
   member_name VARCHAR2(20 BYTE) NOT NULL,
   member_email VARCHAR2(30 BYTE) NOT NULL, 
   member_phone VARCHAR2(14 BYTE) NOT NULL,
   member_sex VARCHAR2(6 BYTE),
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
    tutor_img varchar2(100) NOT NULL,
    tutor_career_file varchar2(100) NOT NULL,
    tutor_introduce varchar2(3000) NOT NULL,
    tutor_link varchar2(100),
    tutor_score number(5),
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
    freeBoard_title varchar2(50) not null,
    freeBoard_content varchar2(1500) not null,
    freeBoard_fileName varchar2(100),
    freeBoard_write_dt Date default sysdate not null,
    freeBoard_view_count number(5),
    freeBoard_deleteYN varchar2(1),
    CONSTRAINT pk_freeBoard_id Primary Key(freeBoard_id),
    CONSTRAINT fk_freeBoard_member_id Foreign Key(freeBoard_member_id) References member (member_id)
                ON DELETE CASCADE);
    --DROP TABLE freeBoard CASCADE CONSTRAINTS ;
---------------------------------------------
--FreeReply  
---------------------------------------------
  CREATE TABLE FreeReply
   (
   freeReply_id NUMBER NOT NULL, 
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
CREATE TABLE STUDY_BOARD (
       STUDYBOARD_ID NUMBER NOT NULL,
       STUDYBOARD_MEMBER_ID VARCHAR2(15) NOT NULL,
       STUDYBOARD_TITLE VARCHAR2(300) NOT NULL,
       STUDYBOARD_CONTENT VARCHAR2(3000) NOT NULL,
       STUDYBOARD_FILENAME VARCHAR2(100),
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
   ,CONSTRAINT studyReply_to_studyBoard_FK FOREIGN KEY (studyReply_parent_board)REFERENCES study_Board ( studyBoard_id )  
   ,CONSTRAINT studyReply_to_member_fk FOREIGN KEY ( studyReply_member_id )REFERENCES member ( member_id )
);
   --DROP TABLE studyReply CASCADE CONSTRAINTS ;
---------------------------------------------
--lecture_detail
---------------------------------------------
CREATE TABLE lecture_detail(
lecture_id number,
lecture_category_id varchar2(10),
lecture_prepared varchar2(600),
lecture_caution varchar2(900),
lecture_fileName varchar2(100),
lecture_reject_reason varchar2(600),
lecture_cancel_reason varchar2(600),
lecture_location varchar2(300),
CONSTRAINT lecture_detail_pk PRIMARY KEY(lecture_id, lecture_category_id)
);

   --DROP TABLE lecture_detail CASCADE CONSTRAINTS ;
---------------------------------------------
--lecture
---------------------------------------------
CREATE TABLE lecture (
    lecture_id number,
    lecture_category_id varchar2(10) NOT NULL,
    lecture_tutor_id varchar2(15) NOT NULL,
    lecture_img varchar2(100) NOT NULL,
    lecture_title varchar2(100) NOT NULL,
    lecture_content varchar2(3000) NOT NULL,
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
   
    ALTER table lecture_detail ADD CONSTRAINT lecture2_fk FOREIGN KEY (lecture_id, lecture_category_id)REFERENCES lecture (lecture_id, lecture_category_id);

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
---------------------------------------------
--MEMBER_LECTURE_HISTORY
---------------------------------------------
CREATE TABLE MEMBER_LECTURE_HISTORY (
        MEMBER_ID VARCHAR2(15),
        LECTURE_ID number,
        LECTURE_CATEGORY_ID VARCHAR2(10),
        PAYMENT_DT DATE NOT NULL,
        CANCEL_DT DATE,
        CONSTRAINT MEMBER_LECTURE_HISTORY_PK3 PRIMARY KEY (MEMBER_ID,LECTURE_ID,LECTURE_CATEGORY_ID),
        CONSTRAINT MEMBER_id3_FK FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER(MEMBER_ID),
        CONSTRAINT LECTURE_FK3 FOREIGN KEY (LECTURE_ID,LECTURE_CATEGORY_ID) REFERENCES LECTURE(LECTURE_ID,LECTURE_CATEGORY_ID));
    --drop table MEMBER_LECTURE_HISTORY CASCADE CONSTRAINTS;
---------------------------------------------
--REVIEW
---------------------------------------------
CREATE TABLE REVIEW (
	lecture_category_id VARCHAR2(10)
	, member_id VARCHAR2(15)
    , lecture_id number
    , review_score NUMBER(3) not null
    , review_content VARCHAR2(300) not null
    , review_dt DATE not null

    , CONSTRAINT PK_lecture_category_id PRIMARY KEY(lecture_category_id, member_id, lecture_id)
    , CONSTRAINT FK_review_TO_u_l_h
    FOREIGN KEY (lecture_category_id, member_id, lecture_id)
    REFERENCES member_lecture_history (lecture_category_id , member_id, lecture_id)
    ON DELETE CASCADE
);
    drop table REVIEW CASCADE CONSTRAINTS;
---------------------------------------------
commit;