/*
    M:N 관계
    1. 현실세계에서 빈번히 나타나지만 주의해야 하는 관계
    2. M:N 관계를 가진 2개의 테이블은 직접 관계를 맺는 것이 불가능하다.
    3. 관계를 맺기 위해서 별도의 테이블이 추가로 필요하다.
    4. M:N 관계는 1:M 관계 2개로 구현할 수 있다.
*/

-- 삭제는 생성의 역순으로 진행
DROP TABLE ENROLL_T;
DROP TABLE SUBJECT_T;
DROP TABLE UNIV_STUDENT_T;


-- 학생 테이블
CREATE TABLE UNIV_STUDENT_T (
    STU_NO   NUMBER            NOT NULL
   ,STU_NAME VARCHAR2(10 BYTE) NOT NULL
   ,AGE      NUMBER
   ,CONSTRAINT PK_UNIV_STU PRIMARY KEY(STU_NO)
);

-- 과목 테이블
CREATE TABLE SUBJECT_T (
    SBJ_CODE  VARCHAR2(5 BYTE)  NOT NULL
   ,SBJ_NAME  VARCHAR2(10 BYTE) NOT NULL
   ,PROFESSOR VARCHAR2(10 BYTE) NOT NULL
   ,CONSTRAINT PK_SBJ PRIMARY KEY(SBJ_CODE)
);

-- 수강신청 테이블
CREATE TABLE ENROLL_T (
    EN_NO    NUMBER           NOT NULL
   ,STU_NO   NUMBER           
   ,SBJ_CODE VARCHAR2(5 BYTE) 
   ,CONSTRAINT PK_EN          PRIMARY KEY(EN_NO)
   ,CONSTRAINT FK_UNIV_STU_EN FOREIGN KEY(STU_NO)   REFERENCES UNIV_STUDENT_T(STU_NO)
   ,CONSTRAINT FK_SBJ_EN      FOREIGN KEY(SBJ_CODE) REFERENCES SUBJECT_T(SBJ_CODE)
);


--학생 테이블<-> 과목 테이블은 서로 연관이없으므로 임의 순서로 만들어도됨