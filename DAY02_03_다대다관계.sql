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
DROP TABLE STUDENT_T;


-- �л� ���̺�
CREATE TABLE STUDENT_T (
    STU_NO   NUMBER            NOT NULL PRIMARY KEY
   ,STU_NAME VARCHAR2(10 BYTE) NOT NULL
   ,AGE      NUMBER
);

-- ���� ���̺�
CREATE TABLE SUBJECT_T (
    SBJ_CODE  VARCHAR2(5 BYTE)  NOT NULL PRIMARY KEY
   ,SBJ_NAME  VARCHAR2(10 BYTE) NOT NULL
   ,PROFESSOR VARCHAR2(10 BYTE) NOT NULL
);

-- ������û ���̺�
CREATE TABLE ENROLL_T (
    EN_NO    NUMBER           NOT NULL PRIMARY KEY
   ,STU_NO   NUMBER           REFERENCES STUDENT_T(STU_NO)
   ,SBJ_CODE VARCHAR2(5 BYTE) REFERENCES SUBJECT_T(SBJ_CODE)
);


--�л� ���̺�<-> ���� ���̺��� ���� �����̾����Ƿ� ���� ������ ������

