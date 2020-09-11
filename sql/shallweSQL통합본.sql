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
    FAQ_ANSWER VARCHAR2(300),
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
   member_email VARCHAR2(30 BYTE) NOT NULL, 
   member_phone VARCHAR2(14 BYTE) NOT NULL,
   member_sex VARCHAR2(6 BYTE),
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
   ,CONSTRAINT studyReply_to_studyBoard_FK FOREIGN KEY (studyReply_parent_board)REFERENCES studyBoard ( studyBoard_id )  
   ,CONSTRAINT studyReply_to_member_fk FOREIGN KEY ( studyReply_member_id )REFERENCES member ( member_id )
);
   --DROP TABLE studyReply CASCADE CONSTRAINTS ;
   


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
CONSTRAINT lecture_detail_pk PRIMARY KEY(lecture_id, lecture_category_id),
CONSTRAINT lecture_detail_FK FOREIGN KEY(lecture_id, lecture_category_id)REFERENCES lecture (lecture_id, lecture_category_id)
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
    , review_content VARCHAR2(300) not null
    , review_dt DATE not null

    , CONSTRAINT lecture_category_id_pk PRIMARY KEY(lecture_category_id, member_id, lecture_id)
    , CONSTRAINT review_fk
    FOREIGN KEY (lecture_category_id, member_id, lecture_id)
    REFERENCES member_lecture_history (lecture_category_id , member_id, lecture_id)
    ON DELETE CASCADE
);
    --drop table REVIEW CASCADE CONSTRAINTS;

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

commit;


--DML 
INSERT INTO lecture_category VALUES('MA','마케팅');
INSERT INTO lecture_category VALUES('WP','웹 프로그래밍');
INSERT INTO lecture_category VALUES('SC','스터디 카운슬링');


Insert into FAQ VALUES(faq_seq.nextVal, 'faq 1번 문항', '1번 문항 답변');
Insert into FAQ VALUES(faq_seq.nextVal, 'faq 2번 문항', '2번 문항 답변');

INSERT INTO member VALUES('member1', 'MA', 'WP', NULL, 'N', 'pw1', '고준식', 'p@a.com', '000-0000-0000', 'M');
INSERT INTO member VALUES('member2', 'SC', NULL, NULL, 'Y', 'pw2', '준고식', 'pp@a.com', '010-0000-0000', 'F');
INSERT INTO member VALUES('member3', 'WP', 'MA', NULL, 'Y', 'pw3', '식준고', 'pp@ap.com', '010-0000-0001', 'N');

    
INSERT INTO tutor VALUES('member2', 'SC', 'tutor2_test.jpg', 'tutor2_career.docx', 'test용 자기소개', 'http://www.naver.com', 0); 
INSERT INTO tutor VALUES('member3', 'WP', 'tutor3_test.jpg', 'tutor3_career.hwp', 'test용 자기소개2', 'http://www.daum.com', 0);
INSERT INTO tutor VALUES('member3', 'MA', 'tutor3_test.jpg', 'tutor3_career.hwp', 'test용 자기소개2', 'http://www.daum.com', 4);

INSERT INTO freeboard VALUES(FREEBOARD_SEQ.Nextval, 'member1', '자유게시판 제목1', '자유게시판 내용1', NULL, to_date('2020/09/10'), 0, 'N');
INSERT INTO freeboard VALUES(FREEBOARD_SEQ.Nextval, 'member1', '자유게시판 제목2', '자유게시판 내용2', '미국갔어.jpg', to_date('2020/09/10'), 0, 'N');
INSERT INTO freeboard VALUES(FREEBOARD_SEQ.Nextval, 'member2', '자유게시판 제목3', '자유게시판 내용3', NULL, to_date('2020/09/10'), 0, 'Y');
INSERT INTO freeboard VALUES(FREEBOARD_SEQ.Nextval, 'member3', '자유게시판 제목4', '자유게시판 내용4', NULL, to_date('2020/09/10'), 0, 'N');   

INSERT INTO freereply VALUES(FREEREPLY_SEQ.Nextval, '1', 'member2', '댓글1', to_date('2020/09/09'));
INSERT INTO freereply VALUES(FREEREPLY_SEQ.Nextval, '1', 'member2', '댓글2', to_date('2020/09/09'));
INSERT INTO freereply VALUES(FREEREPLY_SEQ.Nextval, '2', 'member2', '댓글3', to_date('2020/09/09'));
INSERT INTO freereply VALUES(FREEREPLY_SEQ.Nextval, '4', 'member2', '댓글4', to_date('2020/09/09'));


INSERT INTO studyboard VALUES(STUDYBOARD_SEQ.Nextval, 'member3', '스터디게시판 제목1', '스터디게시판 내용1', NULL, to_date('2020/09/10'), 0, 'N');
INSERT INTO studyboard VALUES(STUDYBOARD_SEQ.Nextval, 'member3', '스터디게시판 제목2', '스터디게시판 내용2', '너개못하잖아.jpg', to_date('2020/09/10'), 0, 'N');
INSERT INTO studyboard VALUES(STUDYBOARD_SEQ.Nextval, 'member1', '스터디게시판 제목3', '스터디게시판 내용3', NULL, to_date('2020/09/10'), 0, 'Y');
INSERT INTO studyboard VALUES(STUDYBOARD_SEQ.Nextval, 'member2', '스터디게시판 제목4', '스터디게시판 내용4', NULL, to_date('2020/09/10'), 0, 'N');

INSERT INTO lecture VALUES(lecture_seq.nextVal, 'SC', 'member2', 'lecture_test1.png', '스터디 카운슬링', '공부법1, 공부법2', 5000, '승인', to_date('2020/09/20', 'YYYY/MM/DD'), to_date('2020/10/20', 'YYYY/MM/DD'), 15, 5, 0); 
INSERT INTO lecture VALUES(lecture_seq.nextVal, 'WP', 'member3', 'lecture_test2.jpg', '웹 마스터리', '자바와 시블블', 6000, '승인대기', to_date('2020/09/20', 'YYYY/MM/DD'), to_date('2020/10/20', 'YYYY/MM/DD'), 20, 8, 0);
INSERT INTO lecture VALUES(lecture_seq.nextVal, 'MA', 'member3', 'lecture_test3.jpg', '마케링', '애드블럭 ㅅㄱ', 7000, '승인', to_date('2020/08/20', 'YYYY/MM/DD'), to_date('2020/09/10', 'YYYY/MM/DD'), 15, 5, 6);
INSERT INTO lecture VALUES(lecture_seq.nextVal, 'MA', 'member3', 'lecture_test4.jpg', '마케링2', '애드블럭 ㅅㄱ2', 5000, '취소', to_date('2020/08/10', 'YYYY/MM/DD'), to_date('2020/09/10', 'YYYY/MM/DD'), 15, 5, 0);


INSERT INTO studyreply VALUES(STUDYREPLY_SEQ.Nextval, '1', 'member2', '댓글1', to_date('2020/09/09'));
INSERT INTO studyreply VALUES(STUDYREPLY_SEQ.Nextval, '1', 'member2', '댓글2', to_date('2020/09/09'));
INSERT INTO studyreply VALUES(STUDYREPLY_SEQ.Nextval, '2', 'member2', '댓글3', to_date('2020/09/09'));
INSERT INTO studyreply VALUES(STUDYREPLY_SEQ.Nextval, '4', 'member2', '댓글4', to_date('2020/09/09'));   


INSERT INTO lecture_detail VALUES(1, 'SC', 'SC 준비물', 'SC 주의사항', null, null, null, '인천 송도');
INSERT INTO lecture_detail VALUES(2, 'WP', 'WP 준비물', 'WP 주의사항', 'lecture_detail2.jpg', null, null, '신림 포도몰');
INSERT INTO lecture_detail VALUES(lecture_seq.currval, 'MA', 'MA 준비물', 'MA 주의사항', 'lecture_detail3.pdf', null, null, '디에고 코스타');

INSERT INTO wishlist VALUES(1, 'member3', 'SC');

INSERT INTO member_lecture_history (MEMBER_ID,LECTURE_ID,LECTURE_CATEGORY_ID, PAYMENT_DT) VALUES('member1', 1, 'SC', to_date('2020/09/10'));
INSERT INTO member_lecture_history (MEMBER_ID,LECTURE_ID,LECTURE_CATEGORY_ID, PAYMENT_DT) VALUES('member2', 3, 'MA', to_date('2020/08/10'));

INSERT INTO review VALUES('MA', 'member2', 3, 100, '좋습니다',  to_date('2020/09/10'));

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
