/*
    DDL
    1. Date Definition Language
    2. �����ͺ��̽� ��ü�� �ٷ�� ���
    3. Ʈ����� ����� �ƴϴ�.(�۾��� ����� �� ����.)
      *Ʈ����� : �ݵ�� �ѹ��� ����(����)�Ǿ�� �ϴ� �۾� (ex.���� ��ü ���+�Ա�)
    4.����
      1) CREATE   : ����
      2) ALTER    : ����
      3) DROP     : ����
      4) TRUNCATE : ����(���븸 ����)
*/

-- ���̺� ������ ������ ����
DROP TABLE CUSTOMER_TBL;
DROP TABLE BANK_TBL;

-- BANK ���̺�
CREATE TABLE BANK_TBL (
    BANK_CODE VARCHAR2(20 BYTE) NOT NULL
   ,BANK_NAME VARCHAR2(30 BYTE)
   ,CONSTRAINT PK_BANK PRIMARY KEY(BANK_CODE)
);

-- CUSTOMER ���̺�
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
    ���̺� �����ϱ�
    1. Į�� �߰�   : ALTER TABLE ���̺�� ADD Į���� ������Ÿ�� [��������]
    2. Į�� ����   : ALTER TABLE ���̺�� MODIFY Į���� ������Ÿ�� [��������]
    3. Į�� ����   : ALTER TABLE ���̺�� DROP COLUMN Į����
    4. Į�� �̸�   : ALTER TABLE ���̺�� RENAME COLUMN ����Į���� TO �ű�Į��
    5. ���̺� �̸� : ALTER TABLE ���̺�� RENAME TO �ű����̺��
    6. PK/FK ��������
      1) PK
       ��. �߰�
           ALTER TABLE ���̺�� ADD CONTRAINT �������Ǹ� PRIMARY KEY(Į��)
       ��. ����
           ALTER TBALE ���̺�� DROP CONSTRAINT �������Ǹ�
           ALTER TABLE ���̺�� DROP PRIMARY KEY
      2) FK
       ��. �߰�
           ALTER TABLE �ڽ����̺�� ADD CONSTRAINT �������Ǹ� FOREIGN KEY(Į��) REFERENCES �θ����̺��(������ Į��)
       ��. ����
           ALTER TALBE ���̺�� DROP CONSTRAINT �������Ǹ�
*/

-- �ǽ�

-- 1. ���� ���̺� ����ó(BANK_TEL) Į���� �߰��Ͻÿ�.
ALTER TABLE BANK_TBL ADD BANK_TEL VARCHAR2(15 BYTE) NOT NULL;

-- 2. ���� ���̺��� �����(BANK_NAME) Į���� ������Ÿ���� VARCHAR2(15 BYTE)�� �����Ͻÿ�.
ALTER TABLE BANK_TBL MODIFY BANK_NAME VARCHAR2(15 BYTE);

-- 3. �� ���̺��� ����(AGE) Į���� �����Ͻÿ�.
ALTER TABLE CUSTOMER_TBL DROP COLUMN AGE;

-- 4. �� ���̺��� ����ȣ(NO) Į������ CUST_NO�� �����Ͻÿ�.
ALTER TABLE CUSTOMER_TBL RENAME COLUMN NO TO CUST_NO;

-- 5. �� ���̺� GRADE Į���� �߰��Ͻÿ�. ('VIP', 'GOLD', 'SILVER', 'BRONZE' �� �ϳ��� ���� �������� �Ѵ�.)
ALTER TABLE CUSTOMER_TBL ADD GRADE VARCHAR2(6 BYTE) CHECK(GRADE = 'VIP' OR GRADE = 'GOLD' OR GRADE = 'SIVER' OR GRADE = 'BONZE');
ALTER TABLE CUSTOMER_TBL ADD GRADE VARCHAR2(6 BYTE) CHECK(GRADE IN('VIP', 'GOLD', 'SILVER', 'BRONZE'));

-- 6. �� ���̺��� ����(NAME)�� ����ó(PHONE) Į�� �̸��� CUST_NAME, CUST_PHONE���� �����Ͻÿ�.
ALTER TABLE CUSTOMER_TBL RENAME COLUMN NAME TO CUST_NAME;
ALTER TABLE CUSTOMER_TBL RENAME COLUMN PHONE TO CUST_PHONE;

-- 7. �� ���̺��� ����ó(CUST_PHONNE) Į���� �ʼ� Į������ �����Ͻÿ�.
ALTER TABLE CUSTOMER_TBL MODIFY CUST_PHONE VARCHAR2(30 BYTE) NOT NULL;

-- 8. �� ���̺��� ����(CUST_NAME) Į���� �ʼ� ���������� ���ֽÿ�.
ALTER TABLE CUSTOMER_TBL MODIFY CUST_NAME VARCHAR2(30 BYTE) NULL; -- �ݵ�� NULL�� ����ؾ��Ѵ�.

-- ���̺� ���� Ȯ���ϱ�
DESC BANK_TBL;
DESC CUSTOMER_TBL;











