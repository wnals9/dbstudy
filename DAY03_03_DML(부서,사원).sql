/*
    DML
    1. Data Manipulation languege
    2. ������(��, Row)�� ����(����, ����, ����)�ϴ� ����̴�.
    3. Ʈ����� ����̴�.(�۾��� �Ϸ�Ǹ� COMMIT, �۾��� ����Ϸ��� ROLLBACK�� �ʿ��ϴ�.)
      1) COMMIT   : �۾��� �����Ѵ�. COMMIT�� �Ϸ�� �۾��� ROLLBACK���� ����� �� ����.
      2) ROLLBACK : �۾��� ����Ѵ�. COMMIT '����' �۾��� ����Ѵ�.
    4. ����
      1) ���� : INSERT INTO VALUES
      2) ���� : UPDATE SET WHERE
      3) ���� : DELETE FROM WHERE
*/

-- ����) �ڰ��������� DML�� ����(����)�� INSERT, UPDATE, DELETE, SELECT�� ���⵵ �Ѵ�.

-- ������ ������ ����
DROP TABLE EMPLOYEE_TBL;
DROP TABLE DEPARTMENT_TBL;

-- �μ� ���̺� ����
CREATE TABLE DEPARTMENT_TBL (
    DEPT_NO   NUMBER            NOT NULL
   ,DEPT_NAME VARCHAR2(15 BYTE) NOT NULL
   ,LOCATION  VARCHAR2(15 BYTE) NOT NULL
   ,CONSTRAINT PK_DEPART PRIMARY KEY(DEPT_NO)
);
 
 
-- ��� ���̺� ����
CREATE TABLE EMPLOYEE_TBL (
    EMP_NO    NUMBER            NOT NULL
   ,NAME      VARCHAR2(20 BYTE) NOT NULL
   ,DEPART    NUMBER
   ,POSITION  VARCHAR2(20 BYTE)
   ,GENDER    CHAR(2 BYTE)
   ,HIRE_DATE DATE
   ,SALARY    NUMBER
   ,CONSTRAINT PK_EMPLOYEE   PRIMARY KEY(EMP_NO)
   ,CONSTRAINT FK_DEPART_EMP FOREIGN KEY(DEPART) REFERENCES DEPARTMENT_TBL(DEPT_NO) ON DELETE SET NULL
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

INSERT INTO DEPARTMENT_TBL(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '������', '�뱸');
INSERT INTO DEPARTMENT_TBL(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '�λ��', '����');
INSERT INTO DEPARTMENT_TBL(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '�ѹ���', '�뱸');
INSERT INTO DEPARTMENT_TBL(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '��ȹ��', '����');

COMMIT;

-- ������ ��������
DROP SEQUENCE EMP_SEQ;
-- �����ȣ�� �����ϴ� ������
CREATE SEQUENCE EMP_SEQ 
    START WITH 1001
    ORDER;
    
INSERT INTO EMPLOYEE_TBL(EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY) VALUES(EMP_SEQ.NEXTVAL, '��â��', 1, '����', 'M', '95-05-01', 5000000); -- ��¥�� ������(-) �Ǵ� ������(/)�� ����
INSERT INTO EMPLOYEE_TBL(EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY) VALUES(EMP_SEQ.NEXTVAL, '��μ�', 1, '���', 'M', '17-07-01', 2500000); -- ��¥�� ������(-) �Ǵ� ������(/)�� ����
INSERT INTO EMPLOYEE_TBL(EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY) VALUES(EMP_SEQ.NEXTVAL, '������', 2, '����', 'F', '90/09/01', 5500000); -- ��¥�� ������(-) �Ǵ� ������(/)�� ����
INSERT INTO EMPLOYEE_TBL(EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY) VALUES(EMP_SEQ.NEXTVAL, '�Ѽ���', 2, '����', 'M', '90/04/01', 5000000); -- ��¥�� ������(-) �Ǵ� ������(/)�� ����
COMMIT;
