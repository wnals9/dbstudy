--실습과제
--ALTER TALBE로 PK,KF 줘보기

--역순으로 삭제
DROP TABLE SCHEDULE_TBL;
DROP TABLE PLAYER_TBL;
DROP TABLE EVENT_TBL;
DROP TABLE NATION_TBL;


--국가 테이블
CREATE TABLE NATION_TBL (
    N_CODE         NUMBER(3)         NOT NULL  -- NUMBER(3) : 0~999
   ,N_NAME         VARCHAR2(30 BYTE) NOT NULL
   ,N_PARTI_PERSON NUMBER
   ,N_PARTI_EVENT  NUMBER
   ,N_PREV_RANK    NUMBER
   ,N_CURR_BANK    NUMBER
);


--종목 테이블
CREATE TABLE EVENT_TBL (
    E_CODE       NUMBER            NOT NULL
   ,E_NAME       VARCHAR2(30 BYTE) NOT NULL
   ,E_FIRST_YEAR NUMBER(4)                    -- NUMBER(4) : 0~9999
   ,E_INFO       VARCHAR2(100 BYTE)
);


--선수 테이블
CREATE TABLE PLAYER_TBL (
    P_CODE NUMBER(3)         NOT NULL 
   ,P_NAME VARCHAR2(30 BYTE) NOT NULL
   ,N_CODE NUMBER(3)         NOT NULL 
   ,E_CODE NUMBER            NOT NULL 
   ,P_RANK NUMBER
   ,P_AGE  NUMBER(3)
);


--일정 테이블
CREATE TABLE SCHEDULE_TBL (
    S_NO         NUMBER(3) NOT NULL
   ,N_CODE       NUMBER(3)
   ,E_CODE       NUMBER
   ,S_START_DATE DATE
   ,S_END_DATE   DATE
   ,S_INFO       VARCHAR2(100 BYTE)
);


--기본키 추가하기
ALTER TABLE NATION_TBL   ADD CONSTRAINT PK_NATION PRIMARY KEY(N_CODE);
ALTER TABLE EVENT_TBL    ADD CONSTRAINT PK_EVENT PRIMARY KEY(E_CODE);
ALTER TABLE PLAYER_TBL   ADD CONSTRAINT PK_PLAYER PRIMARY KEY(P_CODE);
ALTER TABLE SCHEDULE_TBL ADD CONSTRAINT PK_SCHEDULE PRIMARY KEY(S_NO);

--외래키 추가하기
ALTER TABLE PLAYER_TBL   ADD CONSTRAINT FK_NATION_PLAYER FOREIGN KEY(N_CODE) REFERENCES NATION_TBL(N_CODE) ON DELETE CASCADE; -- PLAYER_TBL의 N_CODE가 NOT NULL 이므로 ON DELETE SEE NULL이 불가능하다.
ALTER TABLE PLAYER_TBL   ADD CONSTRAINT FK_EVENT_PLAYER FOREIGN KEY(E_CODE) REFERENCES EVENT_TBL(E_CODE)   ON DELETE CASCADE; -- PLATER_TBL의 E_CODE가 NOY NULL 이므로 ON DELETE SET NULL이 불가능하다.
ALTER TABLE SCHEDULE_TBL ADD CONSTRAINT FK_NATION_SCHEDULE FOREIGN KEY(N_CODE) REFERENCES NATION_TBL(N_CODE) ON DELETE SET NULL; -- ON DELETE CASCADE도 가능하다.
ALTER TABLE SCHEDULE_TBL ADD CONSTRAINT FK_EVENT_SCHEDULE FOREIGN KEY(E_CODE) REFERENCES EVENT_TBL(E_CODE)   ON DELETE SET NULL; -- ON DELETE CASCADE도 가능하다.
