CREATE TABLE Tutor (
    tutor_id varchar2(30),
    tutor_category_id varchar2(20),
    tutor_img varchar2(100),
    tutor_career_file varchar2(100),
    tutor_introduce varchar2(3000),
    tutor_link varchar2(100),
    tutor_score number(5),
    
    constraint tutor_pk primary key(tutor_id, tutor_category_id),
    constraint tutor_member_fk foreign key(tutor_id) references member(member_id),
    constraint tutor_fk foreign key(tutor_id) references lecture_category(category_id)
);