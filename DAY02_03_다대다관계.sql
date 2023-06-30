/*
    M:N ����
    1. ���Ǽ��迡�� ����� ��Ÿ������ �����ؾ� �ϴ� ����
    2. M:N ���踦 ���� 2���� ���̺��� ���� ���踦 �δ� ���� �Ұ����ϴ�.
    3. ���踦 �α� ���ؼ� ������ ���̺��� �߰��� �ʿ��ϴ�.
    4. M:N ����� 1:M ���� 2���� ������ �� �ִ�.
*/

-- ������ ������ �������� ����
DROP TABLE ENROLL_T;
DROP TABLE SUBJECT_T;
DROP TABLE UNIV_STUDENT_T;


-- �л� ���̺�
CREATE TABLE UNIV_STUDENT_T (
    STU_NO   NUMBER            NOT NULL
   ,STU_NAME VARCHAR2(10 BYTE) NOT NULL
   ,AGE      NUMBER
   ,CONSTRAINT PK_UNIV_STU PRIMARY KEY(STU_NO)
);

-- ���� ���̺�
CREATE TABLE SUBJECT_T (
    SBJ_CODE  VARCHAR2(5 BYTE)  NOT NULL
   ,SBJ_NAME  VARCHAR2(10 BYTE) NOT NULL
   ,PROFESSOR VARCHAR2(10 BYTE) NOT NULL
   ,CONSTRAINT PK_SBJ PRIMARY KEY(SBJ_CODE)
);

-- ������û ���̺�
CREATE TABLE ENROLL_T (
    EN_NO    NUMBER           NOT NULL
   ,STU_NO   NUMBER           
   ,SBJ_CODE VARCHAR2(5 BYTE) 
   ,CONSTRAINT PK_EN          PRIMARY KEY(EN_NO)
   ,CONSTRAINT FK_UNIV_STU_EN FOREIGN KEY(STU_NO)   REFERENCES UNIV_STUDENT_T(STU_NO)
   ,CONSTRAINT FK_SBJ_EN      FOREIGN KEY(SBJ_CODE) REFERENCES SUBJECT_T(SBJ_CODE)
);


--�л� ���̺�<-> ���� ���̺��� ���� �����̾����Ƿ� ���� ������ ������

