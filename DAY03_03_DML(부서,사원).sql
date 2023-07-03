-- ������ ������ ����
DROP TABLE EMPLOYEE_T;
DROP TABLE DEPARTMENT_T;

-- �μ� ���̺� ����
CREATE TABLE DEPARTMENT_T (
    DEPT_NO   NUMBER            NOT NULL
   ,DEPT_NAME VARCHAR2(15 BYTE) NOT NULL
   ,LOCATION  VARCHAR2(15 BYTE) NOT NULL
   ,CONSTRAINT PK_DEPART PRIMARY KEY(DEPT_NO)
);
 
 
-- ��� ���̺� ����
CREATE TABLE EMPLOYEE_T (
    EMP_NO    NUMBER            NOT NULL
   ,NAME      VARCHAR2(20 BYTE) NOT NULL
   ,DEPART    NUMBER
   ,POSITION  VARCHAR2(20 BYTE)
   ,GENDER    CHAR(2 BYTE)
   ,HIRE_DATE DATE
   ,SALARY    NUMBER
   ,CONSTRAINT PK_EMPLOYEE   PRIMARY KEY(EMP_NO)
   ,CONSTRAINT FK_DEPART_EMP FOREIGN KEY(DEPART) REFERENCES DEPARTMENT_T(DEPT_NO) ON DELETE SET NULL
);

/*
-- �μ���ȣ�� �����ϴ� ������ �����
CREATE SEQUENCE DEPT_SEQ
    INCREMENT BY 1  -- 1�� �����ϴ� ��ȣ�� �����.(����Ʈ)
    START WITH 1    -- 1���� ��ȣ�� �����.(����Ʈ)
    NOMAXVALUE      -- ��ȣ�� ���Ѽ��� ����.(����Ʈ)
    NOMINVALUE      -- ��ȣ�� ���Ѽ��� ����.(����Ʈ)
    NOCYCLE         -- ��ȣ ��ȯ�� ����.(����Ʈ)
    CACHE 20        -- 20���� ��ȣ�� �̸� ����� �д�.(����Ʈ)
    NOORDER         -- ��ȣ�� ������� ������� �ʴ´�.(����Ʈ) - ��ȣ�� ������� ����ϴ� ORDER �ɼ����� �ٲ㼭 �������� �����Ѵ�.
;
*/
-- �������� ��������
DROP SEQUENCE DEPT_SEQ;

-- ������ ����
CREATE SEQUENCE DEPT_SEQ ORDER;

INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '������', '�뱸');
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '�λ��', '����');
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '�ѹ���', '�뱸');
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '��ȹ��', '����');

