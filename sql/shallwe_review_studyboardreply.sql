
-- 강의 후기 테이블 생성
/*
    강의 후기(table) ---- reference 결제된 강의 목록
    카테고리 약어(FK) lecture_category_id varchar2()
    아이디 (FK) member_id varchar2()
    강의 번호 (FK) lecture_id varchar2()
    강사 평가 review_score number
    후기 내용 review_content varchar2()
    후기 작성일 review_dt date
    후기 삭제여부 review_deleteYN varchar2(1)
*/

CREATE TABLE REVIEW (
	lecture_category_id VARCHAR2(50) NOT NULL
    , lecture_category_id VARCHAR2(50) NOT NULL
	, member_id VARCHAR2(50) NOT NULL 
    , lecture_id  VARCHAR2(50) NOT NULL 
    , review_score NUMBER(50)
    , review_content VARCHAR2(50)
    , review_dt DATE
    , review_deleteYN  VARCHAR2(1)
    
    -- review PK
    CONSTRAINT PK_lecture_category_id PRIMARY KEY lecture_category_id ,
    
    -- review FK : user_lecture_history 테이블 참조
    CONSTRAINT FK_review_TO_user_lecture_history
    FOREIGN KEY ( lecture_category_id, member_id, lecture_id)
    REFERENCES user_lecture_history (	lecture_category_id , member_id, lecture_id)
    ON DELETE CASCADE
);

-- studyReply  -- 공부게시판댓글(table)
/*
    댓글번호 (PK,FK)  studyReply_id  number
    부모게시글번호(PK,FK)   studyReply_parent_board number ---- reference 공부게시판 (StudyBoard)
    댓글게시자(PK,FK)  studyReply_user_id -----------reference 회원 (Member) 
    댓글내용 studyReply_content varchar2()
    댓글작성일 studyReply_dt date
*/
CREATE TABLE studyReply (
	studyReply_id NUMBER(50) NOT NULL
	, studyReply_parent_board NUMBER(50) NOT NULL
	, studyReply_user_id  VARCHAR2(50) NOT NULL
    , studyReply_content VARCHAR2(50)
    , studyReply_dt DATE
   
    -- studyReply PK
    CONSTRAINT PK_studyReply_id PRIMARY KEY studyReply_id ,
    CONSTRAINT PK_studyReply_parent_board PRIMARY KEY studyReply_parent_board ,
    CONSTRAINT PK_studyReply_user_id PRIMARY KEY studyReply_user_id ,
    
    -- studyReply FK  : studyBoard 테이블 참조
    CONSTRAINT FK_studyReply_TO_studyBoard FOREIGN KEY ( studyReply_parent_board )
    REFERENCES studyBoard ( studyBoard_id ) , 
   
    -- studyReply FK  : member 테이블 참조
    CONSTRAINT FK_studyReply_TO_member FOREIGN KEY ( studyReply_user_id )
    REFERENCES member ( member_id )
);
