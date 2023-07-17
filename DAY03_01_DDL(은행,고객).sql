/*
    DDL
    1. Date Definition Language
    2. 데이터베이스 객체를 다루는 언어
    3. 트랜잭션 대상이 아니다.(작업을 취소할 수 없다.)
      *트랜잭션 : 반드시 한번에 실행(성공)되어야 하는 작업 (ex.은행 이체 출금+입금)
    4.종류
      1) CREATE   : 생성
      2) ALTER    : 수정
      3) DROP     : 삭제
      4) TRUNCATE : 삭제(내용만 삭제)
*/

-- 테이블 삭제는 생성의 역순
DROP TABLE CUSTOMER_TBL;
DROP TABLE BANK_TBL;

-- BANK 테이블
CREATE TABLE BANK_TBL (
    BANK_CODE VARCHAR2(20 BYTE) NOT NULL
   ,BANK_NAME VARCHAR2(30 BYTE)
   ,CONSTRAINT PK_BANK PRIMARY KEY(BANK_CODE)
);

-- CUSTOMER 테이블
CREATE TABLE CUSTOMER_TBL (
    NO        NUMBER            NOT NULL
   ,NAME      VARCHAR2(30 BYTE) NOT NULL
   ,PHONE     VARCHAR2(30 BYTE) UNIQUE
   ,AGE       NUMBER            CHECK(AGE BETWEEN 0 AND 100)
   ,BANK_CODE VARCHAR2(20 BYTE)
   ,CONSTRAINT PK_CUST PRIMARY KEY(NO)
   ,CONSTRAINT FK_CUST_BANK FOREIGN KEY(BANK_CODE) REFERENCES BANK_TBL(BANK_CODE)
);


/*
    테이블 수정하기
    1. 칼럼 추가   : ALTER TABLE 테이블명 ADD 칼럼명 데이터타입 [제약조건]
    2. 칼럼 수정   : ALTER TABLE 테이블명 MODIFY 칼럼명 데이터타입 [제약조건]
    3. 칼럼 삭제   : ALTER TABLE 테이블명 DROP COLUMN 칼럼명
    4. 칼럼 이름   : ALTER TABLE 테이블명 RENAME COLUMN 기존칼럼명 TO 신규칼럼
    5. 테이블 이름 : ALTER TABLE 테이블명 RENAME TO 신규테이블명
    6. PK/FK 제약조건
      1) PK
       ㄱ. 추가
           ALTER TABLE 테이블명 ADD CONTRAINT 제약조건명 PRIMARY KEY(칼럼)
       ㄴ. 삭제
           ALTER TBALE 테이블명 DROP CONSTRAINT 제약조건명
           ALTER TABLE 테이블명 DROP PRIMARY KEY
      2) FK
       ㄱ. 추가
           ALTER TABLE 자식테이블명 ADD CONSTRAINT 제약조건명 FOREIGN KEY(칼럼) REFERENCES 부모테이블명(참조할 칼럼)
       ㄴ. 삭제
           ALTER TABLE 테이블명 DROP CONSTRAINT 제약조건명
       ㄷ.일시중지
           ALTER TABLE 테이블명 DISABLE CONSTRAINT 제약조건명
       ㄹ.활성화
           ALTER TABLE 테이블명 ENABLE CONSTRAINT 제약조건명
*/

-- 실습

-- 1. 은행 테이블에 연락처(BANK_TEL) 칼럼을 추가하시오.
ALTER TABLE BANK_TBL ADD BANK_TEL VARCHAR2(15 BYTE) NOT NULL;

-- 2. 은행 테이블의 은행명(BANK_NAME) 칼럼의 데이터타입을 VARCHAR2(15 BYTE)로 변경하시오.
ALTER TABLE BANK_TBL MODIFY BANK_NAME VARCHAR2(15 BYTE);

-- 3. 고객 테이블의 나이(AGE) 칼럼을 삭제하시오.
ALTER TABLE CUSTOMER_TBL DROP COLUMN AGE;

-- 4. 고객 테이블의 고객번호(NO) 칼럼명을 CUST_NO로 변경하시오.
ALTER TABLE CUSTOMER_TBL RENAME COLUMN NO TO CUST_NO;

-- 5. 고객 테이블에 GRADE 칼럼을 추가하시오. ('VIP', 'GOLD', 'SILVER', 'BRONZE' 중 하나의 값을 가지도록 한다.)
ALTER TABLE CUSTOMER_TBL ADD GRADE VARCHAR2(6 BYTE) CHECK(GRADE = 'VIP' OR GRADE = 'GOLD' OR GRADE = 'SIVER' OR GRADE = 'BONZE');
ALTER TABLE CUSTOMER_TBL ADD GRADE VARCHAR2(6 BYTE) CHECK(GRADE IN('VIP', 'GOLD', 'SILVER', 'BRONZE'));

-- 6. 고객 테이블의 고객명(NAME)과 연락처(PHONE) 칼럼 이름을 CUST_NAME, CUST_PHONE으로 변경하시오.
ALTER TABLE CUSTOMER_TBL RENAME COLUMN NAME TO CUST_NAME;
ALTER TABLE CUSTOMER_TBL RENAME COLUMN PHONE TO CUST_PHONE;

-- 7. 고객 테이블의 연락처(CUST_PHONNE) 칼럼을 필수 칼럼으로 변경하시오.
ALTER TABLE CUSTOMER_TBL MODIFY CUST_PHONE VARCHAR2(30 BYTE) NOT NULL;

-- 8. 고객 테이블의 고객명(CUST_NAME) 칼럼의 필수 제약조건을 없애시오.
ALTER TABLE CUSTOMER_TBL MODIFY CUST_NAME VARCHAR2(30 BYTE) NULL; -- 반드시 NULL을 명시해야한다.

-- 테이블 구조 확인하기
DESC BANK_TBL;
DESC CUSTOMER_TBL;