-- 1. ��ҹ��� ��ȯ�ϱ�
SELECT UPPER(EMAIL)   -- ��� �빮��
     , LOWER(EMAIL)   -- ��� �ҹ���
     , INITCAP(EMAIL) -- ù ���ڸ� �빮��, �������� �ҹ���
  FROM EMPLOYEES;
  
-- 2. ���� ��
SELECT FIRST_NAME
     , LENGTH(FIRST_NAME)
  FROM EMPLOYEES;
  
-- 3. ����Ʈ ��
SELECT FIRST_NAME
     , LENGTH(FIRST_NAME)
  FROM EMPLOYEES;
  
-- 4. �����ϱ�
--    1) || ������ (����Ŭ �����̹Ƿ� �ٸ� DB������ ������ ����.)
--    2) CONCAT(CNCATENATE) �Լ�
--       CONCAT(A, B) : �μ��� 2���� ������ �� �ִ�
--       CONCAT(CONCAT(A, B), C) : �μ� 3�� �̻��� CONCAT �Լ� ���� ���� �ذ��Ѵ�.
SELECT *
  FROM EMPLOYEES
 WHERE PHONE_NUMBER LIKE CONCAT('515','%');     
  
SELECT *
  FROM EMPLOYEES
 WHERE EMAIL LIKE CONCAT(CONCAT('%', 'A'), '%');   -- A�� ����('%' || 'A' || '%')
 
-- 5. �Ϻθ� ��ȯ�ϱ�
SELECT SUBSTR(PHONE_NUMBER, 1, 3)  -- ��ȭ��ȣ�� 1��° ���ں��� 3���ڸ� ��ȯ
     , SUBSTR(PHONE_NUMBER, 5)     -- ��ȭ��ȣ�� 5��° ���ں��� ������ ��ȯ
  FROM EMPLOYEES;
  
-- 6. Ư�� ������ ��ġ ��ȯ�ϱ�
--    ������ ��ġ�� 1���� �����Ѵ�.
--    ��ã���� 0�� ��ȯ�Ѵ�.
SELECT EMAIL 
     , INSTR(EMAIL, 'A')
  FROM EMPLOYEES;
  
-- 7. �ٲٱ�
SELECT EMAIL
     , REPLACE(EMAIL, 'A', '$') -- ��� A�� ã�Ƽ� $�� �ٲٱ�
  FROM EMPLOYEES;
  
-- 8. ä���
--    1) LPAD(ǥ����, ��ü��, ä�﹮��)
--    2) RPAD(ǥ����, ��ü��, ä�﹮��)
SELECT DEPARTMENT_ID
     , LPAD(DEPARTMENT_ID, 3, 0)
     , EMAIL
     , RPAD(SUBSTR(EMAIL, 1, 2), 5, '*')
  FROM EMPLOYEES;
  
-- 9. ���� ����
SELECT '[' || LTRIM('     HELLO     WORLD     ') || ']'  -- ���� ���� ����
     , '[' || RTRIM('     HELLO     WORLD     ') || ']'  -- ������ ���� ����
     , '[' ||  TRIM('     HELLO     WORLD     ') || ']'  -- ����/������ ���� ����
  FROM DUAL;
  

-- �ǽ�.
-- 1. ��� ���̺��� JOB_ID ���� ����(_) ��/�� �κ� �и� ��ȸ�ϱ�
-- ����) IT_PROG --> IT / PROG
--      ���ڼ�        : 7
--      ������ġ      : 3
--      ���� �� ���ڼ� : 2(������ġ -1)
--      ���� �� ���ڼ� : 4(���ڼ� - ������ġ) (����� ����� �ʿ����� �ʴ�.)
SELECT JOB_ID
     , SUBSTR(JOB_ID, 1, INSTR(JOB_ID, '_') - 1)
     , SUBSTR(JOB_ID, INSTR(JOB_ID, '_') +1, LENGTH(JOB_ID) - INSTR(JOB_ID, '_'))
     , SUBSTR(JOB_ID, INSTR(JOB_ID, '_') +1)
  FROM EMPLOYEES;
-- 2. FIRST_NAME�� LAST_NAME�� �����ؼ� ��� �빮�ڷ� �ٲ� FULL_NAME ��ȸ�ϱ�
-- ����) FIRST_NAME : Steven
--      LAST_NAME   : KING
--      FULL_NAME   : STEVEN KING
SELECT UPPER(CONCAT(CONCAT(FIRST_NAME, ' '), LAST_NAME)) AS FULL_NAME
  FROM EMPLOYEES
 ORDER BY EMPLOYEE_ID;
