/*
    GROUP BY ��
    1. ���� ���� ���� �����͵��� �ϳ��� �׷����� ��� ó���Ѵ�.
    2. ��踦 ���� �������� ����Ѵ�.(�հ�, ���, �ִ�, �ּڰ�, ���� ��)
    3. SELECT ������ ��ȸ�Ϸ��� Į���� "�ݵ��" GROUP BY ���� ��õǾ� �־�� �Ѵ�.
*/

-- 1. ��� ���̺��� ������ �μ���ȣ�� ���� ������� �׷�ȭ�Ͽ� �� �׷캰�� �� ���� ����� �ִ��� ��ȸ�Ͻÿ�.
SELECT DEPARTMENT_ID     --GROUP BY ������ ������ Į���� ��ȸ�� �� �ִ�.
     , COUNT(*)
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID;
 
-- 2. ��� ���̺��� ���� ������ ���� ������� �׷�ȭ�Ͽ� �� �׷캰�� ������ ����� ������ ��ȸ�Ͻÿ�.
SELECT JOB_ID
     , ROUND(AVG(SALARY), 2)
  FROM EMPLOYEES
 GROUP BY JOB_ID;
 
-- 3. ��� ���̺��� ��ȭ��ȣ �� 3�ڸ��� ���� ������� �׷�ȭ�Ͽ� �� �׷캰�� ������ �հ�
SELECT SUBSTR(PHONE_NUMBER, 1, 3)
     , SUM(SALARY)
  FROM EMPLOYEES
 GROUP BY SUBSTR(PHONE_NUMBER, 1, 3);
 
-- ����. GROUP BY �� ���� ��賻��
SELECT DISTINCT DEPARTMENT_ID
     , COUNT(*)    OVER(PARTITION BY DEPARTMENT_ID)
     , ROUND(AVG(SALARY) OVER(PARTITION BY DEPARTMENT_ID), 2)
  FROM EMPLOYEES;

/*
    HAVING ��
    1, GROUP BY �� ���Ŀ� ��Ÿ����.
    2. GROUP BY ���� �̿��� ��ȸ ����� ������ ���� �ϴ� ��쿡 ����Ѵ�
    3. GROUP BY ���� �ʿ����� �ʴ� ������ WHERE ���� �����Ѵ�.
*/

-- 4. ��� ���̺��� �� �μ��� ������� 20�� �̻��� �μ��� ��ȸ�Ͻÿ�.
-- ���� : �μ�������� >= 20
-- ���ǿ��� ���Ǵ� �μ���������� GROUP BY ���� �ʿ��ϹǷ� HAVING ���� ó���Ѵ�.
SELECT DEPARTMENT_ID
     , COUNT(*)
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID
HAVING COUNT(*) >= 20;

-- 5. ��� ���̺��� �� �μ��� ������� ��ȸ �Ͻÿ�. ��, �μ���ȣ�� ���� ����� �����Ͻÿ�
-- ���� : �μ���ȣ IS NOT NULL
-- ���ǿ��� ���Ǵ� �μ���ȣ�� GROUP BY ���� �ʿ�����Ƿ� WHERER ���� ó���Ѵ�.
SELECT DEPARTMENT_ID
     , COUNT(*)
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IS NOT NULL  -- HAVING DEPARTMENT_ID IS NOT NULL �� ���������� ������ ��������.
 GROUP BY DEPARTMENT_ID;