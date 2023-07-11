-- 1. ���� ������ �а� ������ ���̺��� �����Ͻÿ�.
-- ���̺� ������ �� �⺻Ű�� �ܷ�Ű�� ������ �������� ���ÿ�.(5,6�� ������ �⺻Ű, �ܷ�Ű ���� �����Դϴ�.)
DROP TABLE ORDER_T;
DROP TABLE CUSTOMER_T;
DROP TABLE BOOK_T;
/*
    BOOK_T ���̺�
    (1) BOOK_ID : å��ȣ, ���� (�ִ� 11�ڸ�), �ʼ�
    (2) BOOK_NAME : å�̸�, ���� ���� ���� (�ִ� 100 BYTE)
    (3) PUBLISHER : ���ǻ�, ���� ���� ���� (�ִ� 50 BYTE)
    (4) PRICE : ����, ���� (�ִ� 6�ڸ�)
*/
CREATE TABLE BOOK_T (
       BOOK_ID   NUMBER(11)         NOT NULL
      ,BOOK_NAME VARCHAR2(100 BYTE) NULL
      ,PUBLISHER VARCHAR2(50 BYTE)  NULL
      ,PRICE     NUMBER(6)
);
/*
    CUSTOMER_T ���̺�
    (1) CUST_ID   : ����ȣ, ���� (�ִ� 11�ڸ�), �ʼ�
    (2) CUST_NAME : ����, ���� ���� ���� (�ִ� 20 BYTE)
    (3) CUST_ADDR : �ּ�, ���� ���� ���� (�ִ� 50 BYTE)
    (4) CUST_TEL  : ��ȭ, ���� ���� ���� (�ִ� 20 BYTE)
*/
CREATE TABLE CUSTOMER_T (
             CUST_ID   NUMBER(11)        NOT NULL
            ,CUST_NAME VARCHAR2(20 BYTE) NULL
            ,CUST_ADDR VARCHAR2(50 BYTE) NULL
            ,CUST_TEL  VARCHAR2(20 BYTE) NULL
);
/*
    ORDER_T ���̺�
    (1) ORDER_ID : �ֹ���ȣ, ���� ���� ���� (�ִ� 20 ����Ʈ), �ʼ�
    (2) CUST_ID : ����ȣ, ���� (�ִ� 11�ڸ�)
    (3) BOOK_ID : å��ȣ, ���� (�ִ� 11�ڸ�)
    (4) AMOUNT : �Ǹż���, ���� (�ִ� 2�ڸ�)
    (5) ORDER_DT : �ֹ���, ��¥
*/
CREATE TABLE ORDER_T (
             ORDER_ID VARCHAR2(20 BYTE) NOT NULL
            ,CUST_ID  NUMBER(11)        NULL
            ,BOOK_ID  NUMBER(11)        NULL
            ,AMOUNT   NUMBER(2)         NULL
            ,ORDER_DT DATE              NULL
);        

-- 2. 1���� 1�� �����ϴ� ���� �����ϴ� BOOK_SEQ �������� �����Ͻÿ�.
-- �Ʒ� �����͸� BOOK_T ���̺� INSERT�Ͻÿ�. å��ȣ�� BOOK_SEQ �������� �̿��Ͻÿ�.
/*
    å��ȣ  å�̸�           ���ǻ�      ����
    1       �౸�� ����      �½�����    7000
    2       �౸ �ƴ� ����   ���̽���    13000
    3       �౸�� ����      ���ѹ̵��  22000
    4       ���� ���̺�      ���ѹ̵��  35000
    5       �ǰ� ����        �½�����    6000
    6       ���� �ܰ躰 ��� �½�����    6000
    7       �߱��� �߾�      �̻�̵��  20000
    8       �߱��� ��Ź��    �̻�̵��  13000
    9       �ø��� �̾߱�    �Ｚ��      7500
    10      �ø��� è�Ǿ�    ���̽���    13000
*/
DROP SEQUENCE BOOK_SEQ;
CREATE SEQUENCE BOOK_SEQ 
      START WITH 1   --1���ͽ����Ѵ�
      INCREMENT BY 1 -- 1�������Ѵ�
      NOMAXVALUE     -- �ִ񰪾���   --MAXVALUE 9999 : 9999����
      NOMINVALUE     -- �ּڰ�����
      NOCYCLE        -- ��ȯ�����ʴ´�
      CACHE 20       -- ĳ�� 20
      ORDER;         --INECREMANET ~ CAHCE ����Ʈ��(������ȴ�)

INSERT INTO BOOK_T(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES(BOOK_SEQ.NEXTVAL, '�౸�� ����', '�½�����', 7000);
INSERT INTO BOOK_T(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES(BOOK_SEQ.NEXTVAL, '�౸ �ƴ� ����', '���̽���', 13000);
INSERT INTO BOOK_T(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES(BOOK_SEQ.NEXTVAL, '�౸�� ����', '���ѹ̵��', 22000);
INSERT INTO BOOK_T(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES(BOOK_SEQ.NEXTVAL, '���� ���̺�', '���ѹ̵��', 35000);
INSERT INTO BOOK_T(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES(BOOK_SEQ.NEXTVAL, '�ǰ� ����', '�½�����', 6000);
INSERT INTO BOOK_T(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES(BOOK_SEQ.NEXTVAL, '���� �ܰ躰 ���', '�½�����', 6000);
INSERT INTO BOOK_T(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES(BOOK_SEQ.NEXTVAL, '�߱��� �߾�', '�̻�̵��', 20000);
INSERT INTO BOOK_T(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES(BOOK_SEQ.NEXTVAL, '�߱��� ��Ź��', '�̻�̵��', 13000);
INSERT INTO BOOK_T(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES(BOOK_SEQ.NEXTVAL, '�ø��� �̾߱�', '�Ｚ��', 7500);
INSERT INTO BOOK_T(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES(BOOK_SEQ.NEXTVAL, '�ø��� è�Ǿ�', '���̽���', 13000);
COMMIT;

-- 3. 1000���� 1�� �����ϴ� ���� �����ϴ� CUST_SEQ �������� �����Ͻÿ�.
-- �Ʒ� �����͸� CUSTOMER_T ���̺� INSERT�Ͻÿ�. ȸ����ȣ�� CUST_SEQ �������� �̿��Ͻÿ�.
/*
    ȸ����ȣ ����   �ּ�      ��ȭ
    1000     ������   ����      000-000-000
    1001     �迬��   ���ѹα�  111-111-111
    1002     ��̶�   ���ѹα�  222-222-222
    1003     �߽ż�   �̱�      333-333-333
    1004     �ڼ���   ���ѹα�  NULL
*/
DROP SEQUENCE CUST_SEQ;
CREATE SEQUENCE CUST_SEQ
          START WITH 1000
          INCREMENT BY 1
          NOMAXVALUE
          NOMINVALUE
          NOCYCLE
          CACHE 20
          ORDER;  
 
INSERT INTO CUSTOMER_T(CUST_ID, CUST_NAME, CUST_ADDR, CUST_TEL) VALUES(CUST_SEQ.NEXTVAL, '������', '����', '000-000-000');
INSERT INTO CUSTOMER_T(CUST_ID, CUST_NAME, CUST_ADDR, CUST_TEL) VALUES(CUST_SEQ.NEXTVAL, '�迬��', '���ѹα�', '111-111-111');
INSERT INTO CUSTOMER_T(CUST_ID, CUST_NAME, CUST_ADDR, CUST_TEL) VALUES(CUST_SEQ.NEXTVAL, '��̶�', '���ѹα�', '222-222-222');
INSERT INTO CUSTOMER_T(CUST_ID, CUST_NAME, CUST_ADDR, CUST_TEL) VALUES(CUST_SEQ.NEXTVAL, '�߽ż�', '�̱�', '333-333-333');
INSERT INTO CUSTOMER_T(CUST_ID, CUST_NAME, CUST_ADDR, CUST_TEL) VALUES(CUST_SEQ.NEXTVAL, '�ڼ���', '���ѹα�', NULL);
COMMIT;
-- 4. 1���� 1�� �����ϴ� ORDER_SEQ �������� �����Ͻÿ�.
-- �Ʒ� �����͸� ORDER_T ���̺� INSERT�Ͻÿ�. '�ֹ�����6�ڸ�-������' �������� �ֹ���ȣ�� ����ÿ�.
-- TIP.
-- 1) ORDER_SEQ �������� �̿��ؼ� �ֹ���ȣ�� INSERT�Ѵ�.
-- 2) ���� �ֹ���ȣ�� �ֹ���-�ֹ���ȣ ������ �ֹ���ȣ�� UPDATE�Ѵ�.
/*
    �ֹ���ȣ   ����ȣ  å��ȣ  �Ǹż��� �ֹ�����
    200701-1   1000      1       1        20/07/01
    200703-2   1000      3       2        20/07/03
    200703-3   1001      5       1        20/07/03
    200704-4   1002      6       2        20/07/04
    200705-5   1003      7       3        20/07/05
    200707-6   1000      2       5        20/07/07
    200707-7   1003      8       2        20/07/07
    200708-8   1002      10      2        20/07/08
    200709-9   1001      10      1        20/07/09
    200710-10  1002      6       4        20/07/10
*/
DROP SEQUENCE ORDER_SEQ;
CREATE SEQUENCE ORDER_SEQ
      START WITH 1
      INCREMENT BY 1
      NOMAXVALUE
      NOMINVALUE
      NOCYCLE
      CACHE 20
      ORDER;

INSERT INTO ORDER_T(ORDER_ID, CUST_ID, BOOK_ID, AMOUNT, ORDER_DT) VALUES(ORDER_SEQ.NEXTVAL, 1000, 1, 1, TO_DATE('20/07/01', 'YY/MM/DD'));
INSERT INTO ORDER_T(ORDER_ID, CUST_ID, BOOK_ID, AMOUNT, ORDER_DT) VALUES(ORDER_SEQ.NEXTVAL, 1000, 3, 2, TO_DATE('20/07/03'));
INSERT INTO ORDER_T(ORDER_ID, CUST_ID, BOOK_ID, AMOUNT, ORDER_DT) VALUES(ORDER_SEQ.NEXTVAL, 1001, 5, 1, TO_DATE('20/07/03'));
INSERT INTO ORDER_T(ORDER_ID, CUST_ID, BOOK_ID, AMOUNT, ORDER_DT) VALUES(ORDER_SEQ.NEXTVAL, 1002, 6, 2, TO_DATE('20/07/04'));
INSERT INTO ORDER_T(ORDER_ID, CUST_ID, BOOK_ID, AMOUNT, ORDER_DT) VALUES(ORDER_SEQ.NEXTVAL, 1003, 7, 3, TO_DATE('20/07/05'));
INSERT INTO ORDER_T(ORDER_ID, CUST_ID, BOOK_ID, AMOUNT, ORDER_DT) VALUES(ORDER_SEQ.NEXTVAL, 1000, 2, 5, TO_DATE('20/07/07'));
INSERT INTO ORDER_T(ORDER_ID, CUST_ID, BOOK_ID, AMOUNT, ORDER_DT) VALUES(ORDER_SEQ.NEXTVAL, 1003, 8, 2, TO_DATE('20/07/07'));
INSERT INTO ORDER_T(ORDER_ID, CUST_ID, BOOK_ID, AMOUNT, ORDER_DT) VALUES(ORDER_SEQ.NEXTVAL, 1002, 10, 2, TO_DATE('20/07/08'));
INSERT INTO ORDER_T(ORDER_ID, CUST_ID, BOOK_ID, AMOUNT, ORDER_DT) VALUES(ORDER_SEQ.NEXTVAL, 1001, 10, 1, TO_DATE('20/07/09'));
INSERT INTO ORDER_T(ORDER_ID, CUST_ID, BOOK_ID, AMOUNT, ORDER_DT) VALUES(ORDER_SEQ.NEXTVAL, 1002, 6, 4, TO_DATE('20/07/10'));

UPDATE ORDER_T
   SET ORDER_ID = CONCAT(TO_CHAR(ORDER_DT, 'YYMMDD-'), ORDER_ID);
COMMIT;
-- 5. BOOK_T, CUSTOMER_T, ORDER_T ���̺��� BOOK_ID, CUST_ID, ORDER_ID Į���� �⺻Ű�� �߰��Ͻÿ�.
-- �⺻Ű ���������� �̸��� PK_BOOK, PK_CUSTOMER, PK_ORDER���� �����Ͻÿ�.
ALTER TABLE BOOK_T ADD CONSTRAINT PK_BOOK PRIMARY KEY(BOOK_ID);
ALTER TABLE CUSTOMER_T ADD CONSTRAINT PK_CUSTOMER PRIMARY KEY(CUST_ID);
ALTER TABLE ORDER_T ADD CONSTRAINT PK_ORDER PRIMARY KEY(ORDER_ID);

-- 6. ORDER_T ���̺��� CUST_ID, BOOK_ID Į���� ���� CUSTOMER_T ���̺�� BOOK_T ���̺��� ������ �ܷ�Ű�� �߰��Ͻÿ�.
-- �ܷ�Ű ���������� �̸��� FK_CUSTOMER_ORDER, FK_BOOK_ORDER���� �����Ͻÿ�.
-- CUST_ID�� BOOK_ID�� �����Ǵ� ��� �̸� �����ϴ� ORDER_T ���̺��� ������ NULL�� ó���Ͻÿ�.
ALTER TABLE ORDER_T ADD CONSTRAINT FK_CUSTOMER_ORDER FOREIGN KEY(CUST_ID) REFERENCES CUSTOMER_T(CUST_ID) ON DELETE SET NULL;
ALTER TABLE ORDER_T ADD CONSTRAINT FK_BOOK_ORDER FOREIGN KEY(BOOK_ID) REFERENCES BOOK_T(BOOK_ID) ON DELETE SET NULL;
COMMIT;


-- 7. å�̸��� '�ø���'�� ���Ե� å ������ ��ȸ�Ͻÿ�.
SELECT *
  FROM BOOK_T
 WHERE BOOK_NAME LIKE '%�ø���%';

-- 8. ������ ���� ��� å�� ��ȸ�Ͻÿ�.
SELECT *
  FROM BOOK_T
 WHERE PRICE = (SELECT MAX(PRICE)
                  FROM BOOK_T);

-- ��ũ�� �����ؼ� ���� ���å ��ȸ�ϱ�

SELECT *
  FROM (SELECT RANK()OVER(ORDER BY PRICE DESC) AS ����, BOOK_ID, BOOK_NAME, PUBLISHER, PRICE
        FROM BOOK_T)
 WHERE ���� = 1;

-- 9. '20/07/05'���� '20/07/09' ���̿� �ֹ��� ���� ������ ��ȸ�Ͻÿ�.
-- �ֹ���ȣ å��ȣ å�̸�
-- 230705-5 7      �߱��� �߾�
-- 230707-6 2      �౸ �ƴ� ����
-- 230707-7 8      �߱��� ��Ź��
-- 230708-8 10     �ø��� è�Ǿ�
-- 230709-9 10     �ø��� è�Ǿ�
SELECT O.ORDER_ID  AS �ֹ���ȣ
     , O.BOOK_ID   AS å��ȣ
     , B.BOOK_NAME AS å�̸�
  FROM BOOK_T B INNER JOIN ORDER_T O
    ON B.BOOK_ID = O.BOOK_ID
 WHERE O.ORDER_DT BETWEEN TO_DATE('20/07/05') AND TO_DATE('20/07/09')
 ORDER BY O.ORDER_ID;

-- 10. �ֹ��� �̷��� ���� ���� �̸��� ��ȸ�Ͻÿ�.
-- ����
-- �ڼ���
SELECT CUST_NAME AS ����
  FROM CUSTOMER_T
 WHERE CUST_ID NOT IN(SELECT CUST_ID
                        FROM ORDER_T);

SELECT C.CUST_NAME AS ����
  FROM CUSTOMER_T C LEFT OUTER JOIN ORDER_T O
    ON C.CUST_ID = O.CUST_ID
 WHERE O.CUST_ID IS NULL;
                        
-- 11. '20/07/04'���� '20/07/07' ���̿� �ֹ� ���� ������ �����ϰ� ������ ��� �ֹ� ������ ��ȸ�Ͻÿ�.
-- ���Ź�ȣ  ������  å�̸�           �ѱ��ž� �ֹ�����
-- 200701-1  ������  �౸�� ����      7000     20/07/01
-- 200703-2  ������  �౸�� ����      44000    20/07/03
-- 200703-3  �迬��  �ǰ� ����        6000     20/07/03
-- 200710-10 ��̶�  ���� �ܰ躰 ��� 24000    20/07/10
-- 200709-9  �迬��  �ø��� è�Ǿ�    13000    20/07/09
-- 200708-8  ��̶�  �ø��� è�Ǿ�    26000    20/07/08
SELECT O.ORDER_ID         AS ���Ź�ȣ
     , C.CUST_NAME        AS ������
     , B.BOOK_NAME        AS å�̸�
     , O.AMOUNT * B.PRICE AS �ѱ��ž�
     , O.ORDER_DT         AS �ֹ�����
  FROM BOOK_T B INNER JOIN ORDER_T O 
    ON B.BOOK_ID = O.BOOK_ID INNER JOIN CUSTOMER_T C
    ON C.CUST_ID = O.CUST_ID
 WHERE O.ORDER_DT NOT BETWEEN TO_DATE('20/07/04') AND TO_DATE('20/07/07');
-- 12. ���� �ֱٿ� ������ ���� �̸�, å�̸�, �ֹ����ڸ� ��ȸ�Ͻÿ�.
-- ����  å�̸�            �ֹ�����
-- ��̶�  ���� �ܰ躰 ���  20/07/10
SELECT C.CUST_NAME  AS ����
     , B.BOOK_NAME  AS å�̸�
     , O.ORDER_DT   AS �ֹ�����
  FROM BOOK_T B INNER JOIN ORDER_T O
    ON B.BOOK_ID = O.BOOK_ID INNER JOIN CUSTOMER_T C
    ON O.CUST_ID = C.CUST_ID
 WHERE O.ORDER_DT = (SELECT MAX(ORDER_DT)
                       FROM ORDER_T);
 
 
-- 13. �ֹ��� ���� ���� å�� �ֹ���ȣ, å��ȣ, å�̸��� ��ȸ�Ͻÿ�.
-- �ֹ���ȣ å��ȣ å�̸�
-- NULL     4      ���� ���̺�
-- NULL     9      �ø��� �̾߱�
SELECT O.ORDER_ID  AS �ֹ���ȣ
     , B.BOOK_ID   AS å��ȣ
     , B.BOOK_NAME AS å�̸�
  FROM ORDER_T O RIGHT OUTER JOIN BOOK_T B
    ON O.BOOK_ID = B.BOOK_ID
 WHERE O.ORDER_ID IS NULL;
-- 14. ��� ���� �߿��� ���� ��� ������ ������ ���̸�, å�̸�, ������ ��ȸ�Ͻÿ�.
-- ���� ��� ������ ������ ���� ���ٸ� �� �̸��� NULL�� ó���Ͻÿ�.
-- ����  å�̸�       å����
-- NULL    ���� ���̺�  35000
SELECT C.CUST_NAME AS ����
     , B.BOOK_NAME AS å�̸�
     , B.PRICE     AS å����
  FROM BOOK_T B LEFT OUTER JOIN ORDER_T O
    ON B.BOOK_ID = O.BOOK_ID LEFT OUTER JOIN CUSTOMER_T C  
    ON O.CUST_ID = C.CUST_ID
 WHERE B.PRICE = (SELECT MAX(PRICE)
                    FROM  BOOK_T);
                    
-- 15. '�迬��'�� ������ �������� ��ȸ�Ͻÿ�.
-- ����  ����Ƚ��
-- �迬��  2
SELECT C.CUST_NAME        AS ����
     , COUNT(O.ORDER_ID)  AS ����Ƚ��  -- �ֹ��� �� �� �ߴ°�?
  FROM CUSTOMER_T C INNER JOIN ORDER_T O
    ON C.CUST_ID = O.CUST_ID
 WHERE C.CUST_NAME = '�迬��'
 GROUP BY C.CUST_NAME, C.CUST_ID;

-- '�迬��'�� ������ å�� �� ���ΰ�? (�ǰ� ������ 2�� �ֹ��޴ٸ� ������ å�� 1��)
SELECT C.CUST_NAME      AS ����
     , COUNT(B.BOOK_ID) AS ���ŵ�����
  FROM BOOK_T B INNER JOIN ORDER_T O
    ON B.BOOK_ID = O.BOOK_ID INNER JOIN CUSTOMER_T C
    ON O.CUST_ID = C.CUST_ID
 WHERE C.CUST_NAME = '�迬��'
 GROUP BY C.CUST_NAME,C.CUST_ID;
 
SELECT C.CUST_NAME               AS ����
     , COUNT(DISTINCT O.BOOK_ID) AS ���ŵ�����
  FROM CUSTOMER_T C INNER JOIN ORDER_T O
    ON C.CUST_ID = O.CUST_ID
 WHERE C.CUST_NAME = '�迬��'
 GROUP BY C.CUST_NAME, C.CUST_ID;
-- 16. ���ǻ纰�� �Ǹŵ� å�� ������ ��ȸ�Ͻÿ�.
-- ���ǻ�     �Ǹŵ�å��
-- �½�����   4
-- �Ｚ��     0
-- ���̽���   3
-- ���ѹ̵�� 1
-- �̻�̵�� 2
SELECT B.PUBLISHER        AS ���ǻ�
     , COUNT(O.ORDER_ID)  AS �Ǹŵ�å��
  FROM BOOK_T B LEFT OUTER JOIN ORDER_T O
    ON B.BOOK_ID = O.BOOK_ID
 GROUP BY B.PUBLISHER;

-- 17. '������'�� ������ ������ �߰��� ���ǻ�(PUBLISHER) ������ ��ȸ�Ͻÿ�.
-- ����  ���ǻ��
-- ������  3
SELECT C.CUST_NAME        AS ����
     , COUNT(DISTINCT B.PUBLISHER) AS ���ǻ��
  FROM CUSTOMER_T C INNER JOIN ORDER_T O
    ON C.CUST_ID = O.CUST_ID INNER JOIN BOOK_T B
    ON B.BOOK_ID = O.BOOK_ID
 WHERE C.CUST_NAME = '������'
 GROUP BY C.CUST_NAME, C.CUST_ID;


-- 18. ��� ���� ���� �̸��� �ѱ��ž�(PRICE * AMOUNT)�� ��ȸ�Ͻÿ�. ���� �̷��� �ִ� ���� ��ȸ�Ͻÿ�.
-- ����  �ѱ��ž�
-- ������  116000
-- �迬��  19000
-- ��̶�  62000
-- �߽ż�  86000
SELECT C.CUST_NAME              AS ����
     , SUM(B.PRICE * O.AMOUNT)  AS �ѱ��ž�
  FROM CUSTOMER_T C INNER JOIN ORDER_T O
    ON C.CUST_ID = O.CUST_ID INNER JOIN BOOK_T B
    ON B.BOOK_ID = O.BOOK_ID
 GROUP BY C.CUST_NAME,C.CUST_ID;


-- 19. ��� ���� ���� �̸��� �ѱ��ž�(PRICE * AMOUNT)�� ����Ƚ���� ��ȸ�Ͻÿ�. ���� �̷��� ���� ���� �ѱ��žװ� ����Ƚ���� 0���� ��ȸ�ϰ�, ����ȣ ������������ �����Ͻÿ�.
-- ����  �ѱ��ž�  ����Ƚ��
-- ������  116000     3
-- �迬��  19000      2
-- ��̶�  62000      3
-- �߽ż�  86000      2
-- �ڼ���  0          0
SELECT C.CUST_NAME                       AS ����
     , NVL(SUM(B.PRICE * O.AMOUNT), '0') AS �ѱ��ž�
     , COUNT(O.ORDER_ID)                 AS ����Ƚ��
  FROM BOOK_T B LEFT OUTER JOIN ORDER_T O
    ON O.BOOK_ID = B.BOOK_ID RIGHT OUTER JOIN CUSTOMER_T C
    ON O.CUST_ID = C.CUST_ID
 GROUP BY C.CUST_NAME, C.CUST_ID
 ORDER BY C.CUST_ID ASC;
 

-- 20. �ѱ��ž��� 2~3���� ���� �̸��� �ѱ��ž��� ��ȸ�Ͻÿ�.
-- ����  �ѱ��ž�
-- �߽ż�  86000
-- ��̶�  62000
SELECT A.CUST_NAME AS ����
     , A.TOTAL     AS �ѱ��ž�
  FROM (SELECT RANK() OVER(ORDER BY SUM(B.PRICE * O.AMOUNT) DESC) AS RK
             , C.CUST_NAME
             , SUM(B.PRICE * O.AMOUNT) AS TOTAL
          FROM CUSTOMER_T C INNER JOIN ORDER_T O
            ON C.CUST_ID = O.CUST_ID INNER JOIN BOOK_T B
            ON B.BOOK_ID = O.BOOK_ID
         GROUP BY C.CUST_ID, C.CUST_NAME) A
  WHERE A.RK BETWEEN 2 AND 3;
