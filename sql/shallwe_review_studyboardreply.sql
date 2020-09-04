
-- ���� �ı� ���̺� ����
/*
    ���� �ı�(table) ---- reference ������ ���� ���
    ī�װ� ���(FK) lecture_category_id varchar2()
    ���̵� (FK) member_id varchar2()
    ���� ��ȣ (FK) lecture_id varchar2()
    ���� �� review_score number
    �ı� ���� review_content varchar2()
    �ı� �ۼ��� review_dt date
    �ı� �������� review_deleteYN varchar2(1)
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
    
    -- review FK : user_lecture_history ���̺� ����
    CONSTRAINT FK_review_TO_user_lecture_history
    FOREIGN KEY ( lecture_category_id, member_id, lecture_id)
    REFERENCES user_lecture_history (	lecture_category_id , member_id, lecture_id)
    ON DELETE CASCADE
);

-- studyReply  -- ���ΰԽ��Ǵ��(table)
/*
    ��۹�ȣ (PK,FK)  studyReply_id  number
    �θ�Խñ۹�ȣ(PK,FK)   studyReply_parent_board number ---- reference ���ΰԽ��� (StudyBoard)
    ��۰Խ���(PK,FK)  studyReply_user_id -----------reference ȸ�� (Member) 
    ��۳��� studyReply_content varchar2()
    ����ۼ��� studyReply_dt date
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
    
    -- studyReply FK  : studyBoard ���̺� ����
    CONSTRAINT FK_studyReply_TO_studyBoard FOREIGN KEY ( studyReply_parent_board )
    REFERENCES studyBoard ( studyBoard_id ) , 
   
    -- studyReply FK  : member ���̺� ����
    CONSTRAINT FK_studyReply_TO_member FOREIGN KEY ( studyReply_user_id )
    REFERENCES member ( member_id )
);
