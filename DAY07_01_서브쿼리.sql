/*
    ��������(sub qeury_
    1. ���������� ���ԵǴ� ���������� ���� ������� �Ѵ�.
    2. ���������� ���� �����ؼ� �� ����� ���������� �����Ѵ�.
    3. ����
        1) SELECT �� : ��Į�� ��������
        2)   FROM �� : �ζ��� ��(INLINE VIEW)
        3)  WHERE �� : ���� �� �������� (����� 1��)
                       ���� �� �������� (����� N��) 
*/

/*
    ���� �� ��������(single row sub query)
    1. ����� 1���̴�. (1���̴�.)
    2. ���� �� ���������� ���
        1) WHERE ������ ����� Į���� PK �Ǵ� UNIQUE Į���� ���
        2) ��� �Լ��� ����� ��� 
    3. ���� �� �������� ������
        =, !=, >, >=, <, <=
    
    ���� �� ��������(multiple row sub query)
    1. ����� N���̴�.
    2. ���� �� �������� ������
        IN, ANY, ALL ��
*/

/* WHERE ���� �������� */

-- 1. �����ȣ�� 101�� ����� ������ ������ ������ ���� ����� ��ȸ�Ͻÿ�
SELECT *
  FROM EMPLOYEES
 WHERE JOB_ID = (SELECT JOB_ID 
                   FROM EMPLOYEES
                  WHERE EMPLOYEE_ID = 101);
            
                  
-- 2. �μ����� 'IT'�� �μ��� �ٹ��ϴ� ��� ��ȸ�ϱ�
SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN(SELECT DEPARTMENT_ID
                          FROM DEPARTMENTS
                         WHERE DEPARTMENT_NAME = 'IT'); -- ���������� DEPARTMENT_NAME Į���� �ߺ��� ���� �� �����Ƿ� ���� �� ���������� ó���Ѵ�.


-- 3. 'Seattle'���� �ٹ��ϴ� ��� ��ȸ�ϱ�
SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN(SELECT DEPARTMENT_ID 
                          FROM DEPARTMENTS
                         WHERE LOCATION_ID IN(SELECT LOCATION_ID 
                                                FROM LOCATIONS 
                                               WHERE CITY = 'Seattle'));

-- 4. ���� ���� ���� ��� ��ȸ�ϱ�
SELECT *
  FROM EMPLOYEES
 WHERE SALARY = (SELECT MAX(SALARY)
                   FROM EMPLOYEES);

-- 5. ���� ���� �Ի��� ��ȸ�ϱ�
SELECT *
  FROM EMPLOYEES
 WHERE HIRE_DATE = (SELECT MIN(HIRE_DATE)
                      FROM EMPLOYEES);

-- 6. ��� ���� �̻��� �޴� ��� ��ȸ�ϱ�
SELECT * 
  FROM EMPLOYEES
 WHERE SALARY >= (SELECT AVG(SALARY)
                    FROM EMPLOYEES);
                    
/* FROM ���� �������� */

-- 1. ������ 3��°�� ���� ��� ��ȸ�ϱ�
--    1) ���� ���� ������ �����Ѵ�.
--    2) ���� ����� �� ��ȣ�� ���δ�.
--    3) �� ��ȣ 3�� �����´�.

SELECT ���ȣ, EMPLOYEE_ID
  FROM (SELECT ROW_NUMBER() OVER(ORDER BY SALARY DESC) AS ���ȣ, EMPLOYEE_ID
          FROM EMPLOYEES)
 WHERE ���ȣ = 3;
 
-- 2. ���� 11~20��° ��� ��ȸ�ϱ�
SELECT RN, EMPLOYEE_ID
  FROM (SELECT ROW_NUMBER() OVER(ORDER BY SALARY DESC) AS RN, EMPLOYEE_ID
          FROM EMPLOYEES)
 WHERE RN BETWEEN 11 AND 20;
 
-- 3. 21 ~ 30��°�� �Ի��� ��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID
  FROM (SELECT ROW_NUMBER() OVER(ORDER BY HIRE_DATE) AS RN, EMPLOYEE_ID
          FROM EMPLOYEES)
 WHERE RN BETWEEN 21 AND 30;
 
 
/* SELECT ���� �������� */

-- 1.�μ���ȣ�� 50�� �μ��� �ٹ��ϴ� �����ȣ, �����, �μ��� ��ȸ�ϱ�
SELECT EMPLOYEE_ID
     , FIRST_NAME
     , LAST_NAME
     , (SELECT DEPARTMENT_NAME
          FROM DEPARTMENTS
         WHERE DEPARTMENT_ID = 50) AS DEPT_NAME
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 50;
 
SELECT E.EMPLOYEE_ID
     , E.FIRST_NAME
     , E.LAST_NAME
     , (SELECT D.DEPARTMENT_NAME
          FROM DEPARTMENTS D
         WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID
           AND D.DEPARTMENT_ID = 50) AS DEPT_NAME
  FROM EMPLOYEES E;