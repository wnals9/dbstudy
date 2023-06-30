-- 삭제는 역순으로 진행
DROP TABLE PROCEEDING_TBL;
DROP TABLE PROJECT_TBL;
DROP TABLE EMPLOYEE_TBL;
DROP TABLE DEPARTMENT_TBL;


-- 부서 테이블
CREATE TABLE DEPARTMENT_TBL (
    DEPT_NO       VARCHAR2(15 BYTE) NOT NULL PRIMARY KEY
   ,DEPT_NAME     VARCHAR2(30 BYTE)
   ,DEPT_LOCATION VARCHAR2(50 BYTE)
);
    

-- 사원 테이블
CREATE TABLE EMPLOYEE_TBL (
    EMP_NO    NUMBER            NOT NULL PRIMARY KEY
   ,DEPT_NO   VARCHAR2(15 BYTE) REFERENCES DEPARTMENT_TBL(DEPT_NO)
   ,POSITION  CHAR(10 BYTE)
   ,NAME      VARCHAR2(15 BYTE)
   ,HIRE_DATE DATE
   ,SALARY    NUMBER
);


-- 프로젝트 테이블
CREATE TABLE PROJECT_TBL (
    PJT_NO     NUMBER            NOT NULL PRIMARY KEY
   ,PJT_NAME   VARCHAR2(30 BYTE)
   ,BEGIN_DATE DATE
   ,END_DATE   DATE
);


-- 프로젝트 진행 테이블
CREATE TABLE PROCEEDING_TBL (
    PCD_NO    NUMBER NOT NULL PRIMARY KEY
   ,EMP_NO    NUMBER REFERENCES EMPLOYEE_TBL(EMP_NO)
   ,PJT_NO    NUMBER REFERENCES PROJECT_TBL(PJT_NO)
   ,PJT_STATE NUMBER NOT NULL
);