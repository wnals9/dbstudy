-- 1. EMPLOYEES ���̺��� JOB_ID�� ��ȸ�Ͻÿ�. ������ JOB_ID�� �� ���� ����ϰ� ���ĺ� ������ �����Ͽ� ��ȸ�Ͻÿ�.
SELECT DISTINCT JOB_ID
  FROM EMPLOYEES
 ORDER BY JOB_ID;

-- 2. EMPLOYEES ���̺��� DEPARTMENT_ID�� 50�� ��� �߿��� SALARY�� 5000 �̻��� ����� ��ȸ�Ͻÿ�.
SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 50 AND SALARY >= 5000;

-- 3. EMPLOYEES ���̺��� FIRST_NAME�� 'Steven', LAST_NAME�� 'King'�� ����� ��ȸ�Ͻÿ�.
SELECT *
  FROM EMPLOYEES
 WHERE FIRST_NAME = 'Steven'
   AND LAST_NAME  = 'King';

-- 4. EMPLOYEES ���̺��� EMPLOYEE_ID�� 151 ~ 200�� ����� ��ȸ�Ͻÿ�.
SELECT *
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID BETWEEN 151 AND 200;
 
SELECT *
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID >=151 AND  EMPLOYEE_ID <=200;

-- 5. EMPLOYEES ���̺��� JOB_ID�� 'IT_PROG', 'ST_MAN'�� ����� ��ȸ�Ͻÿ�.
SELECT *
  FROM EMPLOYEES
 WHERE JOB_ID IN('IT_PROG', 'ST_MAN');
 
SELECT *
  FROM EMPLOYEES
 WHERE JOB_ID = 'IT_PROG' OR JOB_ID ='ST_MAN';

-- 6. EMPLOYEES ���̺��� HIRE_DATE�� 2005�⵵�� ����� ��ȸ�Ͻÿ�.
SELECT *
  FROM EMPLOYEES
 WHERE HIRE_DATE LIKE '05' || '%';

-- 7. EMPLOYEES ���̺��� MANAGER_ID�� ���� ����� ��ȸ�Ͻÿ�.
SELECT *
  FROM EMPLOYEES
 WHERE MANAGER_ID IS NULL;

-- 8. EMPLOYEES ���̺��� COMMISSION_PCT�� �޴� ������� ���� Ŀ�̼��� ��ȸ�Ͻÿ�. Ŀ�̼��� COMMISSION_PCT * SALARY�� ����Ͻÿ�.
SELECT EMPLOYEE_ID
     , FIRST_NAME || ' ' || LAST_NAME
     , COMMISSION_PCT * SALARY
  FROM EMPLOYEES
 WHERE COMMISSION_PCT IS NOT NULL;

-- 9. EMPLOYEES ���̺��� FIRST_NAME�� 'J'�� �����ϴ� ����� ��ȸ�Ͻÿ�.
SELECT *
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE 'J' || '%';

-- 10. EMPLOYEES ���̺��� JOB_ID�� 'MAN'���� ������ ������� MANAGER_ID�� �ߺ��� �����Ͽ� ��ȸ�Ͻÿ�.
SELECT DISTINCT MANAGER_ID
  FROM EMPLOYEES
 WHERE JOB_ID LIKE '%' || 'MAN';

-- 11. EMPLOYEES ���̺��� ��ü ����� DEPARTMENT_ID�� ������������ ��ȸ�ϵ�, ������ DEPARTMENT_ID �������� HIRE_DATE�� ������������ ��ȸ�Ͻÿ�.
SELECT *
  FROM EMPLOYEES
 ORDER BY DEPARTMENT_ID ASC, HIRE_DATE ASC;

-- 12. EMPLOYEES ���̺��� DEPARTMENT_ID�� 80�� ������� ���� SALARY������ ��ȸ�Ͻÿ�. SALARY�� 9,000ó�� õ ���� ���б�ȣ�� ǥ���ؼ� ��ȸ�Ͻÿ�.
SELECT TO_CHAR(SALARY, '9,999')
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 80
 ORDER BY SALARY;
            

-- 13. EMPLOYEES ���̺��� ��ü ����� �ٹ� ���� ���� ������ ��ȸ�Ͻÿ�. 1���� 1���� �ٹ��ߴٸ� 2������ �ٹ��� ������ ó���ؼ� ��ȸ�Ͻÿ�.
SELECT EMPLOYEE_ID
      ,CEIL(MONTHS_BETWEEN(SYSDATE, HIRE_DATE))
  FROM EMPLOYEES;

-- 14. EMPLOYEES ���̺��� PHONE_NUMBER�� ���� ����(REGION)�� ��ȸ�Ͻÿ�.
-- PHONE_NUMBER�� 011�� �����ϸ� 'MOBILE', 515�� �����ϸ� 'EAST', 590���� �����ϸ� 'WEST', 603���� �����ϸ� 'SOUTH', 650���� �����ϸ� 'NORTH'�� ��ȸ�Ͻÿ�.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID
     , DECODE(SUBSTR(PHONE_NUMBER, 1, 3)
     , '011' , ' MOBILE '
     , '515' , ' EAST '
     , '590' , ' WEST '
     , '603' , ' SOUTH '
     , '650' , ' MONTH ') AS REGION
  FROM EMPLOYEES;



-- 15. EMPLOYEES ���̺��� �ٹ� ���� ���� 240���� �̻��̸� '������������', �ƴϸ� �� ���ڿ�('')�� ��ȸ�Ͻÿ�.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID
     , FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) AS �ٹ�������
     , CASE WHEN MONTHS_BETWEEN(SYSDATE, HIRE_DATE) >= 240 THEN '������������'
            ELSE ' '
  END AS ����������������   
 FROM EMPLOYEES;


-- 16. EMPLOYEES ���̺��� SALARY ����� 10000 �̻��� �μ��� DEPARTMENT_ID�� SALARY ����� ��ȸ�Ͻÿ�. ����� ������ ����ó���Ͻÿ�.
SELECT DEPARTMENT_ID
     , FLOOR(AVG(SALARY))
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) >= 10000;

-- 17. EMPLOYEES ���̺��� DEPARTMENT_ID�� JOB_ID�� ��� ���� ������� �׷�ȭ�Ͽ� �� �׷��� ������� ��ȸ�Ͻÿ�. DEPARTMENT_ID�� NULL�� ����� �����Ͻÿ�.
SELECT DEPARTMENT_ID, JOB_ID
     , COUNT(EMPLOYEE_ID)
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IS NOT NULL
 GROUP BY DEPARTMENT_ID, JOB_ID
 ORDER BY COUNT(EMPLOYEE_ID);
-- 18. EMPLOYEES ���̺��� ��ü ������� �μ��� ���� ������ ��ȸ�Ͻÿ�. 
SELECT EMPLOYEE_ID
     , DEPARTMENT_ID
     , SALARY
     , RANK() OVER(ORDER BY SALARY DESC)
  FROM EMPLOYEES
 ORDER BY DEPARTMENT_ID;


-- 19. DEPARTMENTS ���̺��� LOCATION_ID�� �׷�ȭ�Ͽ� �� �׷��� �μ����� ��ȸ�Ͻÿ�. MANAGER_ID�� ���� ������ �����Ͻÿ�.
SELECT  LOCATION_ID
      , COUNT(DEPARTMENT_ID) AS �μ���
  FROM DEPARTMENTS
 WHERE MANAGER_ID IS NOT NULL
 GROUP BY LOCATION_ID;

-- 20. DEPARTMENTS ���̺��� DEPARTMENT_NAME�� ù 2���ڷ� �׷�ȭ�Ͽ� �� �׷��� �μ����� ��ȸ�Ͻÿ�. 'IT'�� 'Co'�� �μ��� ��ȸ�Ͻÿ�.
SELECT SUBSTR(DEPARTMENT_NAME, 1, 2)
     , COUNT(*) AS �μ���
  FROM DEPARTMENTS
 WHERE DEPARTMENT_NAME LIKE 'IT%' OR 
       DEPARTMENT_NAME LIKE '%Co'
 GROUP BY SUBSTR(DEPARTMENT_NAME, 1, 2);