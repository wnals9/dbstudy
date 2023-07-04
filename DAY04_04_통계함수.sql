/*
    ��� �Լ�
    1. SUM(ǥ����)   : �հ�
    2. AVG(ǥ����)   : ���
    3. MAX(ǥ����)   : �ִ밪
    4. MIN(ǥ����)   : �ּҰ�
    5. COUNT(ǥ����) : ������ ����
    
    --��� �Լ����� NULL���� ���ܵȴ�.
*/
-- 1. ��� ���̺��� ���� �հ� ��ȸ�ϱ�
SELECT SUM(SALARY) AS �����հ�
  FROM EMPLOYEES;
  
-- 2. ��� ���̺��� ��ü ����� Ŀ�̼��ۼ�Ʈ�� ��� ��ȸ�ϱ�
-- Ŀ�̼��� ���� ����� �����ϰ� ��ȸ�ϱ�
SELECT AVG(COMMISSION_PCT) AS Ŀ�̼��ۼ�Ʈ���
  FROM EMPLOYEES
 WHERE COMMISSION_PCT IS NOT NULL; -- Ŀ�̼��� ���� ����� �����ϴ� ���ǽ������� ��� �ʿ����� �ʴ�. AVG�Լ��� ��ü������ NULL�� �����ϱ⶧��.
 
-- 3. ��� ���̺��� ��ü ��� �� �ִ� ������ ��ȸ�ϱ�
SELECT MAX(SALARY) AS �ִ뿬��
  FROM EMPLOYEES;
  
-- 4. ��� ���̺��� ��ü ����� �ִ� Ŀ�̼� ��ȸ�ϱ�
-- Ŀ�̼� = ���� * Ŀ�̼��ۼ�Ʈ
SELECT MAX(SALARY * COMMISSION_PCT) AS �ִ�Ŀ�̼�
  FROM EMPLOYEES;

-- 5. ��� ���̺��� ��ü ��� �� ���� ���߿� �Ի��� ����� �Ի��� ��ȸ�ϱ�
SELECT MAX(HIRE_DATE) AS �ֱٰ����
  FROM EMPLOYEES;
  
-- 6. ��ü ��� �� ��ȸ�ϱ�
-- 1) NOT NULL�� Ȯ���� Į��(��ǥ������ PK)���� ������ ���Ѵ�.
SELECT COUNT(EMPLOYEE_ID) AS ��ü�����
  FROM EMPLOYEES;
-- 2) ��� Į���� ������ ���Ѵ�.
SELECT COUNT(*) AS ��ü�����
  FROM EMPLOYEES;

-- 7. ������� �ٹ��ϴ� �μ��� ���� ��ȸ�ϱ�
SELECT COUNT(DISTINCT DEPARTMENT_ID) AS �μ���
  FROM EMPLOYEES;