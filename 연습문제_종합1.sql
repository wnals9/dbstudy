-- ���̺� ����
DROP TABLE BUY_T;
DROP TABLE PRODUCT_T;
DROP TABLE USER_T;

-- ����� ���̺�
CREATE TABLE USER_T (
    USER_NO      NUMBER             NOT NULL         -- ����ڹ�ȣ(�⺻Ű)
  , USER_ID      VARCHAR2(20 BYTE)  NOT NULL UNIQUE  -- ����ھ��̵�
  , USER_NAME    VARCHAR2(20 BYTE)  NULL             -- ����ڸ�
  , USER_YEAR    NUMBER(4)          NULL             -- �¾�⵵
  , USER_ADDR    VARCHAR2(100 BYTE) NULL             -- �ּ�
  , USER_MOBILE1 VARCHAR2(3 BYTE)   NULL             -- ����ó1(010, 011 ��)
  , USER_MOBILE2 VARCHAR2(8 BYTE)   NULL             -- ����ó2(12345678, 11111111 ��)
  , USER_REGDATE DATE               NULL             -- �����
  , CONSTRAINT PK_USER PRIMARY KEY(USER_NO)
);

-- ��ǰ ���̺�
CREATE TABLE PRODUCT_T (
    PROD_CODE     NUMBER            NOT NULL
  , PROD_NAME     VARCHAR2(20 BYTE) NULL
  , PROD_CATEGORY VARCHAR2(20 BYTE) NULL
  , PROD_PRICE    NUMBER            NULL
  , CONSTRAINT PK_PRODUCT PRIMARY KEY(PROD_CODE)
);

-- ���� ���̺�
CREATE TABLE BUY_T (
    BUY_NO     NUMBER NOT NULL
  , USER_NO    NUMBER NULL
  , PROD_CODE  NUMBER NULL
  , BUY_AMOUNT NUMBER NULL
  , CONSTRAINT PK_BUY PRIMARY KEY(BUY_NO)
  , CONSTRAINT FK_USER_BUY    FOREIGN KEY(USER_NO)   REFERENCES USER_T(USER_NO)
  , CONSTRAINT FK_PRODUCT_BUY FOREIGN KEY(PROD_CODE) REFERENCES PRODUCT_T(PROD_CODE) ON DELETE SET NULL
);

-- ����� ������
DROP SEQUENCE USER_SEQ;
CREATE SEQUENCE USER_SEQ ORDER;

-- ��ǰ ������
DROP SEQUENCE PRODUCT_SEQ;
CREATE SEQUENCE PRODUCT_SEQ ORDER;

-- ���� ������
DROP SEQUENCE BUY_SEQ;
CREATE SEQUENCE BUY_SEQ ORDER;

-- ����� ���̺� ������
INSERT INTO USER_T(USER_NO, USER_ID, USER_NAME, USER_YEAR, USER_ADDR, USER_MOBILE1, USER_MOBILE2, USER_REGDATE) VALUES (USER_SEQ.NEXTVAL, 'YJS', '���缮', 1972, '����', '010', '11111111', '08/08/08');
INSERT INTO USER_T(USER_NO, USER_ID, USER_NAME, USER_YEAR, USER_ADDR, USER_MOBILE1, USER_MOBILE2, USER_REGDATE) VALUES (USER_SEQ.NEXTVAL, 'KHD', '��ȣ��', 1970, '���', '011', '22222222', '07/07/07');
INSERT INTO USER_T(USER_NO, USER_ID, USER_NAME, USER_YEAR, USER_ADDR, USER_MOBILE1, USER_MOBILE2, USER_REGDATE) VALUES (USER_SEQ.NEXTVAL, 'KKJ', '�豹��', 1965, '����', '010', '33333333', '09/09/09');
INSERT INTO USER_T(USER_NO, USER_ID, USER_NAME, USER_YEAR, USER_ADDR, USER_MOBILE1, USER_MOBILE2, USER_REGDATE) VALUES (USER_SEQ.NEXTVAL, 'KYM', '��븸', 1967, '����', '010', '44444444', '15/05/05');
INSERT INTO USER_T(USER_NO, USER_ID, USER_NAME, USER_YEAR, USER_ADDR, USER_MOBILE1, USER_MOBILE2, USER_REGDATE) VALUES (USER_SEQ.NEXTVAL, 'KJD', '������', 1974, '�泲', NULL, NULL, '13/03/03');
INSERT INTO USER_T(USER_NO, USER_ID, USER_NAME, USER_YEAR, USER_ADDR, USER_MOBILE1, USER_MOBILE2, USER_REGDATE) VALUES (USER_SEQ.NEXTVAL, 'NHS', '����', 1971, '�泲', '010', '55555555', '14/04/04');
INSERT INTO USER_T(USER_NO, USER_ID, USER_NAME, USER_YEAR, USER_ADDR, USER_MOBILE1, USER_MOBILE2, USER_REGDATE) VALUES (USER_SEQ.NEXTVAL, 'SDY', '�ŵ���', 1971, '���', NULL, NULL, '08/10/10');
INSERT INTO USER_T(USER_NO, USER_ID, USER_NAME, USER_YEAR, USER_ADDR, USER_MOBILE1, USER_MOBILE2, USER_REGDATE) VALUES (USER_SEQ.NEXTVAL, 'LHJ', '������', 1972, '���', '011', '66666666', '06/04/04');
INSERT INTO USER_T(USER_NO, USER_ID, USER_NAME, USER_YEAR, USER_ADDR, USER_MOBILE1, USER_MOBILE2, USER_REGDATE) VALUES (USER_SEQ.NEXTVAL, 'LKK', '�̰��', 1960, '�泲', '011', '77777777', '04/12/12');
INSERT INTO USER_T(USER_NO, USER_ID, USER_NAME, USER_YEAR, USER_ADDR, USER_MOBILE1, USER_MOBILE2, USER_REGDATE) VALUES (USER_SEQ.NEXTVAL, 'PSH', '�ڼ�ȫ', 1970, '����', '010', '88888888', '12/05/05');

-- ��ǰ ���̺� ������
INSERT INTO PRODUCT_T(PROD_CODE, PROD_NAME, PROD_CATEGORY, PROD_PRICE) VALUES (PRODUCT_SEQ.NEXTVAL, '�ȭ', '�Ź�', 30);
INSERT INTO PRODUCT_T(PROD_CODE, PROD_NAME, PROD_CATEGORY, PROD_PRICE) VALUES (PRODUCT_SEQ.NEXTVAL, 'û����', '�Ƿ�', 50);
INSERT INTO PRODUCT_T(PROD_CODE, PROD_NAME, PROD_CATEGORY, PROD_PRICE) VALUES (PRODUCT_SEQ.NEXTVAL, 'å', '��ȭ', 15);
INSERT INTO PRODUCT_T(PROD_CODE, PROD_NAME, PROD_CATEGORY, PROD_PRICE) VALUES (PRODUCT_SEQ.NEXTVAL, '��Ʈ��', '����', 1000);
INSERT INTO PRODUCT_T(PROD_CODE, PROD_NAME, PROD_CATEGORY, PROD_PRICE) VALUES (PRODUCT_SEQ.NEXTVAL, '�����', '����', 200);
INSERT INTO PRODUCT_T(PROD_CODE, PROD_NAME, PROD_CATEGORY, PROD_PRICE) VALUES (PRODUCT_SEQ.NEXTVAL, '�޸�', '����', 80);
INSERT INTO PRODUCT_T(PROD_CODE, PROD_NAME, PROD_CATEGORY, PROD_PRICE) VALUES (PRODUCT_SEQ.NEXTVAL, '��Ʈ', '��ȭ', 30);

-- ���� ���̺� ������
INSERT INTO BUY_T(BUY_NO, USER_NO, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 2, 1, 2);
INSERT INTO BUY_T(BUY_NO, USER_NO, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 2, 4, 1);
INSERT INTO BUY_T(BUY_NO, USER_NO, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 4, 5, 1);
INSERT INTO BUY_T(BUY_NO, USER_NO, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 10, 5, 5);
INSERT INTO BUY_T(BUY_NO, USER_NO, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 2, 2, 3);
INSERT INTO BUY_T(BUY_NO, USER_NO, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 10, 6, 10);
INSERT INTO BUY_T(BUY_NO, USER_NO, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 5, 3, 5);
INSERT INTO BUY_T(BUY_NO, USER_NO, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 8, 3, 2);
INSERT INTO BUY_T(BUY_NO, USER_NO, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 8, 2, 1);
INSERT INTO BUY_T(BUY_NO, USER_NO, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 10, 1, 2);

COMMIT;


/****************************** �� �� ****************************************/

-- 1. ����ó1�� ���� ������� ����ڹ�ȣ, ���̵�, ����ó1, ����ó2�� ��ȸ�Ͻÿ�.
SELECT USER_NO, USER_ID, USER_MOBILE1, USER_MOBILE2
  FROM USER_T 
 WHERE USER_MOBILE1 IS NULL;

-- 2. ����ó2�� '5'�� �����ϴ� ������� ����ڹ�ȣ, ���̵�, ����ó1, ����ó2�� ��ȸ�Ͻÿ�.
SELECT USER_NO, USER_ID, USER_MOBILE1, USER_MOBILE2
  FROM USER_T
 WHERE USER_MOBILE2 LIKE '5%';

-- 3. 2010�� ���Ŀ� ������ ������� ����ڹ�ȣ, ���̵�, �������� ��ȸ�Ͻÿ�.
SELECT USER_NO, USER_ID, USER_REGDATE
  FROM USER_T
 WHERE EXTRACT(YEAR FROM USER_REGDATE) >= 2010;

-- 4. ����ڹ�ȣ�� ����ó1, ����ó2�� �����Ͽ� ��ȸ�Ͻÿ�. ����ó�� ���� ��� NULL ��� 'None'���� ��ȸ�Ͻÿ�.
SELECT USER_NO, NVL(CONCAT(USER_MOBILE1, USER_MOBILE2), 'None')
  FROM USER_T;

-- 5. ������ ����ڼ��� ��ȸ�Ͻÿ�.
-- �ּ�   ����ڼ�
-- ���   1
-- �泲   2
-- ����   4
-- ���   2
-- �泲   1
SELECT USER_ADDR AS �ּ�
     , COUNT(*)  AS ����ڼ�
  FROM USER_T
 GROUP BY USER_ADDR;

-- 6. '����', '���'�� ������ ������ ����ڼ��� ��ȸ�Ͻÿ�.
-- �ּ�   ����ڼ�
-- ���   1
-- �泲   2
-- �泲   1
SELECT USER_ADDR AS �ּ�
     , COUNT(*)  AS ����ڼ�
  FROM USER_T
 WHERE USER_ADDR NOT IN('����', '���') -- WHERE USER_ADDR != '����' AND USER_ADDR != '���';
 GROUP BY USER_ADDR;
-- �׷��� ���� : WHERE
-- �׷��� ���� : HAVING - ������ ����ڼ��� 2�� �̻���
 

-- 7. ���ų����� ���� ����ڸ� ��ȸ�Ͻÿ�.
-- ��ȣ  ���̵�
-- 6     HNS
-- 1     YJS
-- 7     SDY
-- 3     KKJ
-- 9     LKK
SELECT USER_NO AS ��ȣ
     , USER_ID AS ���̵�
  FROM USER_T
 WHERE USER_NO NOT IN(SELECT USER_NO
                        FROM BUY_T);  -- ��������

-- 8. ī�װ��� ����Ƚ���� ��ȸ�Ͻÿ�.
-- ī�װ�  ����Ƚ��
-- ����      4
-- �Ź�      2
-- ��ȭ      2
-- �Ƿ�      2
SELECT P.PROD_CATEGORY AS ī�װ�
     , COUNT(B.BUY_NO)
  FROM PRODUCT_T P INNER JOIN BUY_T B
    ON P.PROD_CODE = B.PROD_CODE
 GROUP BY P.PROD_CATEGORY;

-- 9. ���̵� ����Ƚ���� ��ȸ�Ͻÿ�.
-- ���̵�  ����Ƚ��
-- KHD     3
-- LHJ     2
-- KYM     1
-- KJD     1
-- PSH     3
SELECT U.USER_ID AS ���̵�
     , COUNT(B.BUY_NO) AS ����Ƚ��
  FROM USER_T U INNER JOIN BUY_T B
    ON U.USER_NO = B.USER_NO
 GROUP BY U.USER_ID;


-- 10. ���̵� ����Ƚ���� ��ȸ�Ͻÿ�. ���� �̷��� ���� ��� ����Ƚ���� 0���� ��ȸ�ϰ� ���̵��� ������������ ��ȸ�Ͻÿ�.
-- ���̵�  ����  ����Ƚ��
-- KHD     ��ȣ��  3
-- KJD     ������  1
-- KKJ     �豹��  0
-- KYM     ��븸  1
-- LHJ     ������  2
-- LKK     �̰��  0
-- NHS     ����  0
-- PSH     �ڼ�ȫ  3
-- SDY     �ŵ���  0
-- YJS     ���缮  0
SELECT U.USER_ID AS ���̵�
     , U.USER_NAME AS ����
     , COUNT(B.BUY_NO) AS ����Ƚ��
  FROM USER_T U LEFT OUTER JOIN BUY_T B
    ON U.USER_NO = B.USER_NO
 GROUP BY U.USER_ID, U.USER_NAME
 ORDER BY U.USER_ID ASC;


-- 11. ī�װ��� '����'�� ��ǰ�� ������ ���� ���ų����� ��ȸ�Ͻÿ�.
-- ����  ��ǰ��  ���ž�
-- ��ȣ��  ��Ʈ��  1000
-- ��븸  �����  200
-- �ڼ�ȫ  �����  1000
-- �ڼ�ȫ  �޸�  800
SELECT U.USER_NAME                 AS ����
     , P.PROD_NAME                 AS ��ǰ��
     , P.PROD_PRICE * B.BUY_AMOUNT AS ���ž�
  FROM USER_T U INNER JOIN BUY_T B
    ON U.USER_NO = B.USER_NO INNER JOIN PRODUCT_T P
    ON B.PROD_CODE = P.PROD_CODE
 WHERE PROD_CATEGORY = '����';


-- 12. ��� ��ǰ�� ��ǰ��� �Ǹ�Ƚ���� ��ȸ�Ͻÿ�. �Ǹ� �̷��� ���� ��ǰ�� 0���� ��ȸ�Ͻÿ�.
-- ��ǰ��  �Ǹ�Ƚ��
-- �޸�  1��
-- �ȭ  2��
-- û����  2��
-- ��Ʈ��  1��
-- �����  2��
-- å      2��
-- ��Ʈ    0��
SELECT P.PROD_NAME           AS ��ǰ��
     , CONCAT(COUNT(B.BUY_NO), '��')  AS �Ǹ�Ƚ��
  FROM PRODUCT_T P LEFT OUTER JOIN BUY_T B
    ON P.PROD_CODE = B.PROD_CODE
 GROUP BY P.PROD_CODE,P.PROD_NAME;


-- 13. ��ǰ�� ������ �̷��� �ִ� ���� ���̵�, ����, ����Ƚ��, �ѱ��ž��� ��ȸ�Ͻÿ�.
-- ���̵�  ����  ����Ƚ��  �ѱ��ž�
-- PSH     �ڼ�ȫ  3         1860
-- KYM     ��븸  1         200
-- KJD     ������  1         75
-- LHJ     ������  2         80
-- KHD     ��ȣ��  3         1210
SELECT U.USER_ID                         AS ���̵�
     , U.USER_NAME                       AS ����
     , COUNT(B.BUY_NO)                   AS ����Ƚ��
     , SUM(B.BUY_AMOUNT * P.PROD_PRICE)  AS �ѱ��ž�
  FROM USER_T U INNER JOIN BUY_T B
    ON U.USER_NO = B.USER_NO INNER JOIN PRODUCT_T P
    ON B.PROD_CODE = P.PROD_CODE
 GROUP BY U.USER_ID, U.USER_NAME;


-- 14. ����Ƚ���� 2ȸ �̻��� ����� ����Ƚ���� ��ȸ�Ͻÿ�.
-- ����  ����Ƚ��
-- �ڼ�ȫ  3
-- ��ȣ��  3
-- ������  2
SELECT U.USER_NAME      AS ����
     , COUNT(B.BUY_NO)  AS ����Ƚ��
  FROM USER_T U INNER JOIN BUY_T B
    ON U.USER_NO = B.USER_NO
 GROUP BY U.USER_NO, U.USER_NAME
HAVING COUNT(B.BUY_NO) >= 2;
 


-- 15. � ���� � ��ǰ�� �����ߴ��� ��ȸ�Ͻÿ�. ���� �̷��� ���� ���� ��ȸ�ϰ� ���̵�� �������� �����Ͻÿ�.
-- ����   ������ǰ
-- ��ȣ��   �ȭ
-- ��ȣ��   û����
-- ��ȣ��   ��Ʈ��
-- ������   å
-- �豹��   NULL
-- ��븸   �����
-- ������   û����
-- ������   å
-- �̰��   NULL
-- ����   NULL
-- �ڼ�ȫ   �����
-- �ڼ�ȫ   �ȭ
-- �ڼ�ȫ   �޸�
-- �ŵ���   NULL
-- ���缮   NULL
SELECT U.USER_NAME AS ����
     , P.PROD_NAME AS ������ǰ
  FROM USER_T U LEFT OUTER JOIN BUY_T B
    ON U.USER_NO = B.USER_NO LEFT OUTER JOIN PRODUCT_T P
    ON B.PROD_CODE = P.PROD_CODE
 ORDER BY U.USER_ID ASC;

-- 16. ��ǰ ���̺��� ��ǰ���� 'å'�� ��ǰ�� ī�װ��� '����'���� �����Ͻÿ�.
UPDATE PRODUCT_T
   SET PROD_CATEGORY = '����'
 WHERE PROD_NAME = 'å';
COMMIT;


-- 17. ����ó1�� '011'�� ������� ����ó1�� ��� '010'���� �����Ͻÿ�.
UPDATE USER_T
   SET USER_MOBILE1 = '010'
 WHERE USER_MOBILE1 = '011';
COMMIT;

SELECT BUY_SEQ.CURRVAL  
  FROM DUAL;

-- 18. ���Ź�ȣ�� ���� ū ���ų����� �����Ͻÿ�.
DELETE
  FROM BUY_T
 WHERE BUY_NO = (SELECT MAX(BUY_NO)
                   FROM BUY_T);
COMMIT;            

-- �Ʒ� ������ ����õ.
-- �������� ����Ͽ�����, INSERT ��ü�� ������ ��� ���� ū ���Ź�ȣ�� CURRVAL���� �ٸ���.
DELETE
  FROM BUY_T
 WHERE BUY_NO = (SELECT BUY_SEQ.CURRVAL
                   FROM DUAL);
-- 19. ��ǰ�ڵ尡 1�� ��ǰ�� �����Ͻÿ�. ���� ���� ��ǰ��ȣ�� 1�� ��ǰ�� ���ų����� ��� ���ϴ��� ��ȸ�Ͻÿ�.
-- ���� �� ���ų���
SELECT * FROM BUY_T;
-- ����
DELETE 
  FROM PRODUCT_T
 WHERE PROD_CODE = 1;
COMMIT;
--���� �� ���ų���
SELECT * FROM BUY_T;

-- 20. ����ڹ�ȣ�� 5�� ����ڸ� �����Ͻÿ�. ����ڹ�ȣ�� 5�� ������� ���� ������ ���� ������ �� �����Ͻÿ�.
DELETE
  FROM BUY_T
 WHERE USER_NO = 5;

DELETE
  FROM USER_T
 WHERE USER_NO =5;

COMMIT;