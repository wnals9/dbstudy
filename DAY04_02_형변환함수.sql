SELECT 1 + 1 FROM DUAL;  -- DUAL = FROM���� �ʿ������ FROM���̾����� �����̾ȵǹǷ� FROM���� �ʿ������ ���°�
CREATE SEQUENCE TEST_SEQ ORDER;
SELECT TEST_SEQ.NEXTVAL FROM DUAL;

/*
    DUAL ���̺�
    1. DUMMY Į�� 1���� ������ �ִ� ���̺��̴�.
    2. 'X'���� �������ִ�.
    3. FROM���� �ʿ� ���� SELECT���� ����� �� DUAL ���̺��� �̿��Ѵ�.
*/

-- ������Ÿ�Ժ�ȯ : ����, ��¥, ���� ���� ������Ÿ���� �ٲ�

/*
    1. ���� -> ���� ��ȯ�ϱ�
        TO_NUMBER(����)
*/
SELECT TO_NUMBER('123')
  FROM DUAL;

/*
    2. ���� -> ���� ��ȯ�ϱ�
        TO_CHAR(����, [����])
*/
SELECT TO_CHAR(1234)
     , TO_CHAR(1234, '999999')  -- '  1234'
     , TO_CHAR(1234, '000000')  -- '001234'
     , TO_CHAR(1234, '9,999')   -- '1,234'
     , TO_CHAR(12345, '9,999')   -- '#####' ���ڴ� 5�ڸ��ε�, ������ 4�ڸ��� �����Ǿ���.
     , TO_CHAR(12345, '99,999') -- '12,345'
  FROM DUAL;
  
  /*
    3. ��¥ -> ���� ��ȯ�ϱ�
        TO_CHAR(��¥, [����])
        
        *��¥/�ð� ����
        1) YY   : �⵵ 2�ڸ�
        2) YYYY : �⵵ 4�ڸ�
        3) MM   : �� 2�ڸ� (01 ~ 12)
        4) DD   : �� 2�ڸ� (01 ~ 31)
        5) AM   : ���� / ����
        6) HH   : 12�ð�(01 ~ 12)
        7) HH24 : 24�ð�(00 ~ 23)
        8) MI   : ��(00 ~ 59)
        9) SS   : ��(00 ~ 59)
  */
SELECT TO_CHAR(HIRE_DATE, 'YYYY-MM-DD')
  FROM EMPLOYEES;
/*
    4. ���� -> ��¥ ��ȯ�ϱ�
        TO_DATE(����, [����])
*/

-- ���� ��¥�� �ð�
SELECT SYSDATE       -- '23/07'04'
     , SYSTIMESTAMP  -- '23/07/04 14:46:44.303000000 +09:00'
  FROM DUAL;
  
-- ���� ��¥�� �ð� - ���� ����
SELECT TO_CHAR(SYSDATE,      'YYYY-MM-DD AM HH:MI:SS')
      ,TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD HH24:MI:SS')
  FROM DUAL;


-- ���ڷ� �� ��¥/�ð��� ���� ��¥/�ð� Ÿ������ ��ȯ�ϱ�
SELECT TO_DATE('23/07/04')              -- '��/��/��' �������� �ؼ�
      ,TO_DATE('23/07/04', 'DD/MM/YY')  -- '��/��/��' �������� �ؼ�
  FROM DUAL;

-- ���� ������ �ۼ�
DROP TABLE EXAMPLE_T;
CREATE TABLE EXAMPLE_T (
    DT1 DATE
   ,DT2 TIMESTAMP
);
INSERT INTO EXAMPLE_T(DT1, DT2) VALUES(SYSDATE, SYSTIMESTAMP);
COMMIT;

-- DT1�� '23/07/04/'�� �����͸� ��ȸ�ϱ�(�� ��)
SELECT * 
  FROM EXAMPLE_T
 WHERE DT1 = '23/07/04';
 
SELECT *
  FROM EXAMPLE_T
 WHERE DT1 = TO_DATE('23/07/04', 'YY/MM/DD'); -- YY/MM/DD�� �⺻�����̹Ƿ� ��������
 
-- DT1�� '23/07/04'�� �����͸� ��ȸ�ϱ�(��)
SELECT *
  FROM EXAMPLE_T
 WHERE TO_DATE(DT1, 'YY/MM/DD') = TO_DATE('23/07/04', 'YY/MM/DD');
 

