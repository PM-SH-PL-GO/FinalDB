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
    
create sequence freeboard_seq
increment by 1
start with 1
minvalue 1
maxvalue 1000
nocycle
nocache;