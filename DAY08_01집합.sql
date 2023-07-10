/*
    ����
    1. 2�� �̻��� ���̺��� �� ���� ��ȸ�ϴ� ��� �� �ϳ��̴�.
    2. ��� SELECT ���� Į�� ������ Ÿ���� ��ġ�ؾ� �Ѵ�.
    3. ����
        1) UNION     : ������, �ߺ� ���� �� ���� ��ȸ
        2) UNION ALL : ������, �ߺ� ���� �״�� ��ȸ
        3) INTERSECT : ������, �ߺ� ���� �� ���� ��ȸ
        4) MINUS     : ������, ù ��° SELECT ������� �� ��° SELECT ����� ����
    4. ����
        SELECT ī��1, Į��2, ...
          FROM ���̺�1
         ���տ�����
        SELECT Į��1, Į��2, ...
          FROM ���̺�2
        [ORDER BY ����]
*/

-- ������
SELECT 1, 2
  FROM DUAL
 UNION
SELECT 3, 4
  FROM DUAL;

SELECT 1, 2
  FROM DUAL
 UNION      -- �ߺ��� ������ ������
SELECT 1, 2
  FROM DUAL;
  
SELECT 1, 2
  FROM DUAL
 UNION ALL  -- �ߺ��� �״�� ��ȸ�ϴ� ������
SELECT 1, 2
  FROM DUAL;

-- ��� ���̺�� �μ� ���̺� �����ϴ� ��� �μ��� ��ȸ�ϱ�
SELECT DEPARTMENT_ID
  FROM DEPARTMENTS
 UNION
SELECT DEPARTMENT_ID
  FROM EMPLOYEES;
  
SELECT DEPARTMENT_ID
  FROM DEPARTMENTS
 UNION ALL
SELECT DEPARTMENT_ID
  FROM EMPLOYEES;
  
  
-- ��� ���̺�� �μ� ���̺� ��� �����ϴ� �μ���ȣ ��ȸ�ϱ�
-- (������� �ٹ� ���� �μ���ȣ�� ��ȸ�ϱ�)
SELECT DEPARTMENT_ID
  FROM DEPARTMENTS
INTERSECT
SELECT DEPARTMENT_ID
  FROM EMPLOYEES;


-- �μ� ���̺� ���������� ��� ���̺� �������� �ʴ� �μ���ȣ ��ȸ�ϱ�
SELECT DEPARTMENT_ID
  FROM DEPARTMENTS
MINUS
SELECT DEPARTMENT_ID
  FROM EMPLOYEES;
  
  
-- Ȱ��1. WITH���� ��� ����
WITH MY_SUBQUERY(N, TOTAL) AS (  -- N, TOTAL�� MY_SUBQUERY�� Į���� �ǹ��Ѵ�.
    SELECT 1, 1                 -- N=1, TOTAL=1�� �ǹ��ϴ� �ʱ�ȭ ��������
      FROM DUAL
     UNION ALL
    SELECT N+ 1, TOTAL + (N + 1)      -- N = N + 1, TOTAL = TOTAL + (N +1) ������� �ݺ��ؼ� ó���Ǵ� �κ�
      FROM MY_SUBQUERY
     WHERE N < 10
)
SELECT N, TOTAL FROM MY_SUBQUERY;

-- Ȱ��2. WITH���� ��� ������ Ȱ���� ����� ���� ǥ���ϱ�
-- MANAGER�� �� ���ΰ��� ���� LVL ǥ���ϱ�
-- MANAGER�� 0���̴� : LVL = 1
-- MANAGER�� 1���̴� : V = 2
WITH MY_SUBQUERY(LVL, EMPLOYEE_ID, FIRST_NAME, LAST_NAME, MANAGER_ID) AS (
    -- �ʱⰪ(V =1 )�� �����ϴ� ��������
    SELECT 1, EMPLOYEE_ID, FIRST_NAME, LAST_NAME, MANAGER_ID
      FROM EMPLOYEES
     WHERE MANAGER_ID IS NULL
     UNION ALL
    -- �ݺ��ؼ� ȣ��Ǵ� ��������
    SELECT M.LVL +1 AS LVL, E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME, E.MANAGER_ID
      FROM EMPLOYEES E INNER JOIN MY_SUBQUERY M
        ON E.MANAGER_ID = M.EMPLOYEE_ID
)
SELECT LVL, EMPLOYEE_ID, FIRST_NAME, LAST_NAME, MANAGER_ID
  FROM MY_SUBQUERY;