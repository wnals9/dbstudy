/*
    1:M ����
    1. 2���� ���̺��� ���� ���� ���� ��ǥ���� ����
    2. 1    : M
       PK   : FK
       �θ�  : �ڽ�
    3. �ݵ�� �θ� ���̺��� ���� �����, �ڽ� ���̺��� ���߿� ������ �Ѵ�.
    4. �ݵ�� �ڽ� ���̺��� ���� �����, �θ� ���̺��� ���߿� ������ �Ѵ�.
*/

/*
    ���� �ɼ�
    1. ON DELETE CASCADE  : �ܷ�Ű�� �����ϴ� �⺻Ű ���� �����Ǹ� �ܷ�Ű�� �Բ� �����Ѵ�.
    2. ON DELETE SET NULL : �ܷ�Ű�� �����ϴ� �⺻Ű ���� �����Ǹ� �ܷ�Ű�� NULL�� ó���Ѵ�.
    
*/
-- �ڽ� ���� �����
DROP TABLE STUDENT_T;

--�θ� ���߿� �����
DROP TABLE SCHOOL_T;



-- �θ� ���� �����
CREATE TABLE SCHOOL_T (
    SCH_CODE NUMBER            NOT NULL
   ,SCH_NAME VARCHAR2(10 BYTE) NOT NULL
   ,CONSTRAINT PK_SCH PRIMARY KEY(SCH_CODE) -- ���������� �̸��� PK_SCH, SCH_CODE�� PRIMARY KEY�� ����
);

-- �ڽ� ���߿� �����
CREATE TABLE STUDENT_T (
    STU_NO   NUMBER            NOT NULL
   ,SCH_CODE NUMBER            
   ,STU_NAME VARCHAR2(10 BYTE) NOT NULL
   ,CONSTRAINT PK_STU PRIMARY KEY(STU_NO)  -- ���������� �̸��� PK_STU, STU_NO�� PRIMARY KEY�� ����
   ,CONSTRAINT FK_SCH_STU FOREIGN KEY(SCH_CODE) REFERENCES SCHOOL_T(SCH_CODE) ON DELETE CASCADE --���������� �̸��� FK_SCH_STU, SCH_CODE�� SCHOOL_T ���̺��� SCH_CODE�� �����Ѵ�.
);