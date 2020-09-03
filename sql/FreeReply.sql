  CREATE TABLE FreeReply
   (
   freeReply_id NUMBER NOT NULL PRIMARY KEY, 
   freeReply_parent_board NUMBER NOT NULL,
   freeReply_member_id VARCHAR2(10 BYTE) NOT NULL,
   freeReply_content VARCHAR2(900 BYTE) NOT NULL,
   freeReply_dt DATE NOT NULL,
   CONSTRAINT freereply_parent_board_fk FOREIGN KEY (freeReply_parent_board) REFERENCES FreeBoard(freeBoard_id), 
   CONSTRAINT freereply_member_id_fk FOREIGN KEY (freeReply_member_id) REFERENCES member(member_id)
   );