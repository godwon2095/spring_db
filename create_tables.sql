DROP TABLE STUDENT CASCADE CONSTRAINTS PURGE;
DROP TABLE PROFESSOR CASCADE CONSTRAINTS PURGE;
DROP TABLE COURSE CASCADE CONSTRAINTS PURGE;
DROP TABLE ENROLL CASCADE CONSTRAINTS PURGE;
DROP TABLE TEACH CASCADE CONSTRAINTS PURGE;
DROP TABLE POINT_HISTORY CASCADE CONSTRAINTS PURGE;
DROP SEQUENCE enroll_e_id_seq;
DROP SEQUENCE point_history_p_id_seq;


CREATE TABLE student
(
    s_id	    VARCHAR2(10),
    s_name  VARCHAR2(50)   not null,
    s_addr    VARCHAR2(200),
    s_year     NUMBER(1)   not null,
    s_college    VARCHAR2(50)   not null,
    s_major   VARCHAR2(50)   not null,
    s_pwd       VARCHAR2(10)   not null,
    s_point   INTEGER default 100 not null,
    CONSTRAINT student_pk PRIMARY KEY (s_id)
);

INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('2015110417', '장성원','서울시 중구 필동3가 28-32', 3, '이과대학', '수학과','111111');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20011234', '신경화','경기도 화성군 송산면 고정1리 540-2', 4, 'IT학부', '컴퓨터공학과','1234');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20011235', '서용만','경기도 용인시 기흥읍 농서리 산24', 4, 'IT학부', '컴퓨터공학과','1235');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20011236', '정주영','경기도 성남시 분당구 구미동 79번지 까치마을', 4, 'IT학부', '컴퓨터공학과','1236');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20011237', '고정환','경기도 수원시 팔달구 매탄3동 416번지', 4, 'IT학부', '컴퓨터공학과','1237');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20021245', '전용호','경북 안동시 용상동 1234-5번지', 3, 'IT학부', '컴퓨터공학과','3123');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20021246', '한신동','서울 종로구 수송동 81', 3, 'IT학부', '컴퓨터공학과','3124');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20021247', '노호현ˆ','서울 동작구 사당3동 183-2', 3, 'IT학부', '컴퓨터공학과','3125');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20023451', '김영철','서울 동대문구 회기동 101-6', 3, 'IT학부', '멀티미디어공학과','3451');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20012454', '정태웅','서울 송파구 가락동 80-3', 4, 'IT학부', '멀티미디어공학과','3454');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20012456', '정진영','인천시 부평구 갈산2동 400-5', 4, 'IT학부', '멀티미디어공학과','3456');

CREATE TABLE course
(
    c_id   	VARCHAR2(10),
    c_id_no  NUMBER(1),
    c_name  VARCHAR2(50),
    c_unit     NUMBER(1),
    CONSTRAINT course_pk PRIMARY KEY (c_id, c_id_no)
);

INSERT INTO course VALUES ('C100', 3, '컴퓨터 프로그래밍', 3) ;
INSERT INTO course VALUES ('C200', 3, '자료구조', 3) ;
INSERT INTO course VALUES ('C300', 3, '알고리즘', 3) ;
INSERT INTO course VALUES ('C400', 3, '데이터베이스 시스템', 3) ;
INSERT INTO course VALUES ('C500', 3, '운영체제', 3) ;
INSERT INTO course VALUES ('C600', 3, '소프트웨어 공학', 3) ;
INSERT INTO course VALUES ('C700', 3, '네트워크', 3) ;
INSERT INTO course VALUES ('C800', 3, '데이터베이스 프로그래밍', 3) ;
INSERT INTO course VALUES ('C900', 3, '객체지향 윈도우즈 프로그래밍', 3) ;
INSERT INTO course VALUES ('M100', 3, '멀티미디어 개론', 3) ;
INSERT INTO course VALUES ('M200', 3, '선형대수', 3) ;
INSERT INTO course VALUES ('M300', 3, '그래픽 활용', 3) ;
INSERT INTO course VALUES ('M400', 3, '윈도우즈 프로그래밍', 3) ;
INSERT INTO course VALUES ('M500', 3, '컴퓨터 그래픽스', 3) ;
INSERT INTO course VALUES ('M600', 3, '멀티미디어 처리', 3) ;
INSERT INTO course VALUES ('M700', 3, '게임 프로그래밍', 3) ;


CREATE TABLE professor
(
    p_id	       VARCHAR2(10),
    p_name      VARCHAR2(50)   not null,
    p_college    VARCHAR2(50)   not null,
    p_major      VARCHAR2(50)   not null,
    p_pwd         VARCHAR2(10)   not null,
    CONSTRAINT professor_pk PRIMARY KEY (p_id)
);

INSERT INTO professor VALUES ('CS4580', '박구곤', 'IT학부', '컴퓨터공학','4580');
INSERT INTO professor VALUES ('CS4581', '손명성', 'IT학부', '컴퓨터공학','4581');
INSERT INTO professor VALUES ('CS4582', '이은선', 'IT학부', '컴퓨터공학','4582');
INSERT INTO professor VALUES ('CS4583', '서의홍', 'IT학부', '컴퓨터공학','4583');
INSERT INTO professor VALUES ('CS4584', '김심선', 'IT학부', '컴퓨터공학','4584');
INSERT INTO professor VALUES ('CS4585', '전지영', 'IT학부', '컴퓨터공학','4585');
INSERT INTO professor VALUES ('MM4570', '김정미', 'IT학부', '멀티미디어공학','4570');
INSERT INTO professor VALUES ('MM4571', '신기웅', 'IT학부', '멀티미디어공학','4571');
INSERT INTO professor VALUES ('MM4572', '이상헌', 'IT학부', '멀티미디어공학','4572');


CREATE TABLE enroll
(
    e_id       NUMBER,
    s_id	     VARCHAR2(10),
    c_id	     VARCHAR2(10),
    c_id_no    NUMBER(1),
    e_year      NUMBER(4),
    e_semester    NUMBER(1),
    e_score    NUMBER(3),
    e_success  CHAR(1) default('0'),
    CONSTRAINT enroll_pk PRIMARY KEY (e_id),
    CONSTRAINT enroll_student_fk FOREIGN KEY (s_id) REFERENCES student(s_id),
    CONSTRAINT enroll_course_fk FOREIGN KEY (c_id, c_id_no) REFERENCES  course (c_id, c_id_no),
    CONSTRAINT enroll_success_ck CHECK (e_success in ('0', '1'))
);

CREATE SEQUENCE enroll_e_id_seq
START WITH 1
INCREMENT BY 1
MINVALUE 1;

-- INSERT INTO enroll(e_id, s_id, c_id, c_id_no, e_year, e_semester, e_score) VALUES (enroll_e_id_seq.NEXTVAL, '20011234', 'C600', 3, 2019, 2, null);
-- INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester, e_score) VALUES ( '20011234', 'C700', 3, 2019, 2, null);
-- INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester, e_score) VALUES ( '20011235', 'C100', 3, 2019, 2, 76);
-- INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester, e_score) VALUES ( '20011235', 'C300', 3, 2019, 2, null);
-- INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester, e_score) VALUES ( '20011235', 'C400', 3, 2019, 2, null);
-- INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester, e_score) VALUES ( '20011235', 'C500', 3, 2019, 2, null);
-- INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester, e_score) VALUES ( '20011235', 'C600', 3, 2019, 2, null);
-- INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester, e_score) VALUES ( '20011235', 'C700', 3, 2019, 2, null);
-- INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester, e_score) VALUES ( '20011236', 'C100', 3, 2019, 2, 67);
-- INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester, e_score) VALUES ( '20011236', 'C300', 3, 2019, 2, null);
-- INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester, e_score) VALUES ( '20011236', 'C500', 3, 2019, 2, null);
-- INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester, e_score) VALUES ( '20011236', 'C600', 3, 2019, 2, null);
-- INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester, e_score) VALUES ( '20011236', 'C700', 3, 2019, 2, null);
-- INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester, e_score) VALUES ( '20011237', 'C100', 3, 2019, 2, 45);
-- INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester, e_score) VALUES ( '20011237', 'C300', 3, 2019, 2, null);
-- INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester, e_score) VALUES ( '20011237', 'C500', 3, 2019, 2, null);
-- INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester, e_score) VALUES ( '20011237', 'C600', 3, 2019, 2, null);
-- INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester, e_score) VALUES ( '20011237', 'C700', 3, 2019, 2, null);
-- INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester, e_score) VALUES ( '20021245', 'C100', 3, 2019, 2, 75);
-- INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester, e_score) VALUES ( '20021245', 'C200', 3, 2019, 2, null);
-- INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester, e_score) VALUES ( '20021246', 'C100', 3, 2019, 2, 91);
-- INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester, e_score) VALUES ( '20021246', 'C200', 3, 2019, 2, null);
-- INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester, e_score) VALUES ( '20021247', 'C100', 3, 2019, 2, 87);
-- INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester, e_score) VALUES ( '20021247', 'C200', 3, 2019, 2, null);
-- INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester, e_score) VALUES ( '20012454', 'C100', 3, 2019, 2, 67);
-- INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester, e_score) VALUES ( '20012454', 'M100', 3, 2019, 2, 57);
-- INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester, e_score) VALUES ( '20012454', 'M500', 3, 2019, 2, null);
-- INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester, e_score) VALUES ( '20012456', 'C100', 3, 2019, 2, 96);
-- INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester, e_score) VALUES ( '20012456', 'M100', 3, 2019, 2, 63);
-- INSERT INTO enroll(s_id, c_id, c_id_no, e_year, e_semester, e_score) VALUES ( '20012456', 'M500', 3, 2019, 2, null);

CREATE TABLE teach
(
    p_id	   VARCHAR2(10),
    c_id	   VARCHAR2(10),
    c_id_no  NUMBER(1),
    t_year    NUMBER(4),
    t_semester    NUMBER(1),
    t_time    NUMBER(1),
    t_where  VARCHAR2(50),
    t_max    NUMBER(2),
    CONSTRAINT teach_pk PRIMARY KEY (p_id, c_id, c_id_no, t_year, t_semester),
    CONSTRAINT teach_course_fk FOREIGN KEY (c_id, c_id_no) REFERENCES  course (c_id, c_id_no)
 );

INSERT INTO teach VALUES ( 'CS4580', 'C100', 3 , 2020, 1, 4, '인-201', 5);
INSERT INTO teach VALUES ( 'CS4581', 'C200', 3 , 2020, 1, 5, '인-201', 5);
INSERT INTO teach VALUES ( 'CS4581', 'C200', 3 , 2019, 2, 5, '인-201', 5);
INSERT INTO teach VALUES ( 'CS4581', 'C300', 3 , 2020, 1, 2, '인-416', 5);
INSERT INTO teach VALUES ( 'CS4582', 'C400', 3 , 2020, 1, 6, '인-201', 5);
INSERT INTO teach VALUES ( 'CS4582', 'C400', 3 , 2019, 2, 6, '인-201', 5);
INSERT INTO teach VALUES ( 'CS4583', 'C500', 3 , 2020, 1, 3, '인-201', 2);
INSERT INTO teach VALUES ( 'CS4583', 'C700', 3 , 2019, 2, 4, '인-310', 2);
INSERT INTO teach VALUES ( 'CS4584', 'C600', 3 , 2019, 2, 1, '인-309', 2);
INSERT INTO teach VALUES ( 'CS4584', 'C800', 3 , 2020, 1, 7, '인-309', 2);
INSERT INTO teach VALUES ( 'MM4570', 'M100', 3 , 2020, 1, 5, '숭-201', 3);
INSERT INTO teach VALUES ( 'MM4570', 'M400', 3 , 2020, 1, 5, '숭-201', 3);
INSERT INTO teach VALUES ( 'MM4571', 'M200', 3 , 2020, 1, 3, '숭-417', 3);
INSERT INTO teach VALUES ( 'MM4571', 'M200', 3 , 2019, 2, 3, '숭-417', 3);
INSERT INTO teach VALUES ( 'MM4571', 'M500', 3 , 2019, 2, 6, '숭-201', 3);
INSERT INTO teach VALUES ( 'MM4572', 'M300', 3 , 2020, 1, 3, '숭-201', 3);
INSERT INTO teach VALUES ( 'MM4572', 'M300', 3 , 2019, 2, 3, '숭-201', 3);
INSERT INTO teach VALUES ( 'MM4572', 'C900', 3 , 2020, 1, 2, '숭-201', 3);
INSERT INTO teach VALUES ( 'MM4572', 'M700', 3 , 2020, 1, 8, '숭-201', 3);

CREATE TABLE point_history
(
    p_id     NUMBER,
    s_id	     VARCHAR2(10) not null,
    e_id	     NUMBER null,
    p_amount INTEGER not null,
    p_type VARCHAR2(20),
    p_created_at DATE default SYSDATE NOT NULL,
    CONSTRAINT point_pk PRIMARY KEY (p_id),
    CONSTRAINT point_enroll_id_fk FOREIGN KEY (e_id) REFERENCES  enroll (e_id) ON DELETE SET NULL,
    CONSTRAINT point_student_id_fk FOREIGN KEY (s_id) REFERENCES  student (s_id) ON DELETE CASCADE,
    CONSTRAINT p_type_ck CHECK (p_type in ('enroll', 'charge', 'deduction', 'delete_enroll'))
);

CREATE SEQUENCE point_history_p_id_seq
START WITH 1
INCREMENT BY 1
MINVALUE 1;

COMMIT;
