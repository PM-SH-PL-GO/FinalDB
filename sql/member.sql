  CREATE TABLE member
   (
   member_id VARCHAR2(10 BYTE) NOT NULL PRIMARY KEY, 
   member_favorite1 VARCHAR2(20 BYTE),
   member_favorite2 VARCHAR2(20 BYTE),
   member_favorite3 VARCHAR2(20 BYTE),
   tutor_YN VARCHAR2(2 BYTE) NOT NULL,
   member_pwd VARCHAR2(20 BYTE) NOT NULL,
   member_name VARCHAR2(20 BYTE) NOT NULL,
   member_email VARCHAR2(30 BYTE) NOT NULL, 
   member_phone VARCHAR2(14 BYTE) NOT NULL,
   member_sex VARCHAR2(6 BYTE),
   CONSTRAINT member_fk FOREIGN KEY (member_favorite1, member_favorite2, member_favorite3) REFERENCES lec_category(category_id)
   );