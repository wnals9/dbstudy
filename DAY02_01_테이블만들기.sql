/*
    ���̺�(table)
    1. �����ͺ��̽����� �����͸� �����ϴ� ��ü�̴�.
    2. ǥ ������ ������.
    3. ��(row)�� ��(column)�� ���� �����̴�.
*/

/*
    ������ Ÿ��
    1.NUMBER(p,s) : ���е� p, ������ s�� ǥ���ϴ� ���� ����
        1) ���е� p : ��ü ��ȿ ������ ����
        2) ������ s : �Ҽ����� ��ȿ ������ ����
    2. CHAR(size) : ���� ����(character)
        1) ���� ���� ������ Ÿ��(���� : �ڵ�����ȣ, �ֹι�ȣ ��)
        2) size : �ִ� 2000 byte
    3.VARCHAR2(size) : ���� ���ڤ�
        1) ���� ���� �������� ���� Ÿ��(���� : �̸�, �̸���, �ּ� ��)
        2) size : �ִ� 4000 byte
    4.CLOB : ū �ؽ�Ʈ Ÿ��
    5.DATE : ��¥�� �ð��� ���ÿ� ǥ���ϴ� Ÿ��(��,��,��,��,��,��)
    6.TIMESTAMP : ��¥�� �ð��� ���ÿ� ǥ���ϴ� Ÿ��(��,��,��,��,��,��,����ũ����(�鸸���� 1��))
*/

/*
    �������� 5����
    1.NOT NULL    : �ʼ�
    2.UNIQUE      : �ߺ� �Ұ�
    3.PRIMARY KEY : �⺻Ű
    4.FOREIGN KEY : �ܷ�Ű
    5.CHECK       : ���� ����
*/


--�� ���̺�
DROP TABLE CUSTOMER_T;
CREATE TABLE CUSTOMER_T (
    NO    NUMBER NOT NULL   PRIMARY KEY
   ,ID    VARCHAR2(32 BYTE) NOT NULL UNIQUE
   ,NAME  VARCHAR2(32 BYTE) NOT NULL
   ,JOB   VARCHAR2(32 BYTE) NULL
   ,PHONE CHAR(13 BYTE)     NULL UNIQUE
   ,JUBUN CHAR(14 BYTE)     NULL UNIQUE
);
