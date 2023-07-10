-- 1. ���� ���ϱ�
-- RANK() OVER(ORDER BY Į�� ASC)  : ���� ���� 1��
-- RANK() OVER(ORDER BY Į�� DESC) : ���� ���� 1��
SELECT EMPLOYEE_ID
     , SALARY
     , RANK() OVER(ORDER BY SALARY DESC) AS �������� -- ���� �������� ���� �� ���� �ű��(�����ڴ� ���� ������ ����)
  FROM EMPLOYEES;
  
SELECT EMPLOYEE_ID    
     , HIRE_DATE
     , RANK() OVER(ORDER BY HIRE_DATE)   AS �Ի���� -- ����� �������� ���� �� ���� �ű��
  FROM EMPLOYEES;
  

-- 2. �� ��ȣ ���ϱ�
SELECT EMPLOYEE_ID
     , SALARY
     , ROW_NUMBER() OVER(ORDER BY SALARY DESC)  -- ���� �������� ���� �� ��ȣ �ű��(������ ó�� ��� ����)
  FROM EMPLOYEES;
  
  
-- 3. ��ȣȭ �Լ�
SELECT STANDARD_HASH('1111', 'SHA1')   -- ��ȣȭ �˰��� SHA1
     , STANDARD_HASH('1111', 'SHA256') -- ��ȣȭ �ϰ��� SHA256
     , STANDARD_HASH('1111', 'SHA384') -- ��ȣȭ �˰��� SHA384
     , STANDARD_HASH('1111', 'SHA512') -- ��ȣȭ �˰��� SHA512
     , STANDARD_HASH('1111', 'MD5')    -- ��ȣȭ �˰��� MD5
  FROM DUAL;
  

-- 4. �б� ó�� �Լ�
SELECT EMPLOYEE_ID
     , DEPARTMENT_ID
     , DECODE(DEPARTMENT_ID
        , 10, 'Administration'
        , 20, 'Marketing'
        , 30, 'Purchasing'
        , 40, 'Human Resources'
        , 50, 'Shipping'
        , 60, 'IT') AS DEPARTMENT_NAME
  FROM EMPLOYEES;

-- 5. �б� ó�� ǥ����
SELECT EMPLOYEE_ID
     , DEPARTMENT_ID
     , CASE
         WHEN DEPARTMENT_ID = 10 THEN 'Administration'
         WHEN DEPARTMENT_ID = 20 THEN 'Marketing'
         WHEN DEPARTMENT_ID = 30 THEN 'Purchasing'
         WHEN DEPARTMENT_ID = 40 THEN 'Human Resources'
         WHEN DEPARTMENT_ID = 50 THEN 'Shipping'
         WHEN DEPARTMENT_ID = 60 THEN 'IT'
         ELSE 'Unknown'
       END AS DEPARTMENT_NAME
  FROM EMPLOYEES;