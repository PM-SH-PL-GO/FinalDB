CREATE TABLE MEMBER_LECTURE_HISTORY (
        MEMBER_ID VARCHAR2(15),
        LECTURE_ID number,
        LECTURE_CATEGORY_ID VARCHAR2(10),
        PAYMENT_DT DATE,
        CANCEL_DT DATE,

      CONSTRAINT STUDY_BOARD_PK PRIMARY KEY (MEMBER_ID,LECTURE_ID,LECTURE_CATEGORY_ID),
      CONSTRAINT MEMBER_FK FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER(MEMBER_ID),
      CONSTRAINT LECTURE_FK FOREIGN KEY (LECTURE_ID) REFERENCES LECTURE(LECTURE_ID),
      CONSTRAINT REVIEW_FK FOREIGN KEY (LECTURE_CATEGORY_ID) REFERENCES REVIEW(LECTURE_CATEGORY_ID)
    
);
