-- 1. ���� Į�� ������ �̿��Ͽ� MEMBER_T ���̺��� �����Ͻÿ�.
--    1) ȸ����ȣ: MEM_NO, NUMBER, �ʼ�
--    2) ȸ�����̵�: MEM_ID, VARCHAR2(30 BYTE), �ʼ�, �ߺ� �Ұ�
--    3) ȸ���н�����: MEM_PW, VARCHAR2(30 BYTE), �ʼ�
--    4) ȸ������Ʈ: MEM_POINT, NUMBER
--    5) ȸ������: MEM_GUBUN, VARCHAR2(7 BYTE), 'REGULAR', 'SOCIAL' �� �� �ϳ��� ����
--    6) ȸ���̸���: MEM_EMAIL, VARCHAR2(100 BYTE), �ߺ� �Ұ�
CREATE TABLE MEMBER_T (
    MEM_NO    NUMBER             NOT NULL,
    MEM_ID    VARCHAR2(30 BYTE)  NOT NULL UNIQUE,
    MEM_PW    VARCHAR2(30 BYTE)  NOT NULL,
    MEM_POINT NUMBER             NULL,
    MEM_GUBUN VARCHAR2(10 BYTE)  CHECK(MEM_GUBUN IN('REGULAR', 'SOCIAL')),
    MEM_EMAIL VARCHAR2(100 BYTE) NULL UNIQUE
);

-- 2. MEMBER_T ���̺� ���� ���ο� Į���� �߰��Ͻÿ�.
--    1) ȸ���ּ�: ADDRESS VARCHAR2(200 BYTE)
--    2) ȸ��������: JOINED_DT DATE
ALTER TABLE MEMBER_T ADD ADDRESS VARCHAR2(200 BYTE);
ALTER TABLE MEMBER_T ADD JOINED_DT DATE;

-- 3. �߰��� ȸ���ּ� Į���� �ٽ� �����Ͻÿ�.
ALTER TABLE MEMBER_T DROP COLUMN ADDRESS;

-- 4. ȸ������ Į���� Ÿ���� VARCHAR2(20 BYTE)���� �����Ͻÿ�.
ALTER TABLE MEMBER_T MODIFY MEM_GUBUN VARCHAR2(20 BYTE);

-- 5. ȸ���н����� Į���� �̸��� MEM_PWD�� �����Ͻÿ�.
ALTER TABLE MEMBER_T RENAME COLUMN MEM_PW TO MEM_PWD;

-- 6. ȸ����ȣ Į���� �⺻Ű(PK_MEMBER)�� �����Ͻÿ�.
ALTER TABLE MEMBER_T ADD CONSTRAINT PK_MEMBER PRIMARY KEY(MEM_NO);

-- 7. ���� Į�� ������ �̿��Ͽ� BOARD_T ���̺��� �����Ͻÿ�.
--    1) �۹�ȣ: BOARD_NO, NUMBER, �ʼ�
--    2) ������: TITLE, VARCHAR2(4000 BYTE), �ʼ�
--    3) �۳���: CONTENT, VARCHAR2(4000 BYTE), �ʼ�
--    4) ��ȸ��: HIT, VARCHAR2(1 BYTE)
--    5) �ۼ���: MEM_ID, VARCHAR2(30 BYTE), �ʼ�
--    6) �ۼ�����: CREATED_DT, DATE
CREATE TABLE BOARD_T (
    BOARD_NO   NUMBER              NOT NULL,
    TITLE      VARCHAR2(4000 BYTE) NOT NULL,
    CONTENT    VARCHAR2(4000 BYTE) NOT NULL,
    HIT        VARCHAR2(1 BYTE)    NULL,
    MEM_ID     VARCHAR2(30 BYTE)   NOT NULL,
    CREATED_DT DATE                NULL
);

-- 8. ��ȸ�� Į���� Ÿ���� NUMBER�� �����Ͻÿ�.
ALTER TABLE BOARD_T MODIFY HIT NUMBER;

-- 9. �۳��� Į���� �ʼ� ���������� �����Ͻÿ�.
ALTER TABLE BOARD_T MODIFY CONTENT VARCHAR2(4000 BYTE) NULL;

-- 10. �۹�ȣ Į���� �⺻Ű(PK_BOARD)�� �����Ͻÿ�.
ALTER TABLE BOARD_T ADD CONSTRAINT PK_BOARD PRIMARY KEY(BOARD_NO);

-- 11. �ۼ��� Į���� MEMBER_T ���̺��� ȸ�����̵� �����ϴ� FK_MEMBER_BOARD �ܷ�Ű�� �����Ͻÿ�.
-- �Խñ��� �ۼ��� ȸ�� ������ �����Ǹ� �ش� ȸ���� �ۼ��� �Խñ۵� ��� �Բ� ���������� ó���Ͻÿ�.
ALTER TABLE BOARD_T ADD CONSTRAINT FK_MEMBER_BOARD FOREIGN KEY(MEM_ID) REFERENCES MEMBER_T(MEM_ID) ON DELETE CASCADE; -- PK�� �ƴϴ��� UNIQUEĮ���� 1 : N ���踦 ���� �� �ִ�.

-- 12. MEMBER_T ���̺�� BOARD_T ���̺��� ��� �����Ͻÿ�.
DROP TABLE BOARD_T;
DROP TABLE MEMBER_T;