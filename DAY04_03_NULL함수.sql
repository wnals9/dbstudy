/*
    NUUL ó�� �Լ�
    1. NVL(ǥ����, ǥ������ ����� NULL�� ��쿡 ����� ��)
    2. NVL2(ǥ����, ǥ������ ����� NULL�� �ƴ� ��쿡 ����� ��, ǥ������ ����� NULL�� ��쿡 ����� ��)
*/
-- 1. ��� ���̺��� �����ȣ�� �μ���ȣ�� ��ȸ�ϱ�
-- �μ���ȣ�� ���� ��쿡�� 0���� ��ȸ�ϱ�
SELECT EMPLOYEE_ID, NVL(DEPARTMENT_ID, 0)
  FROM EMPLOYEES;
  
-- 2. ��� ���̺��� ��� ������� ���� Ŀ�̼��� ��ȸ�ϱ�
-- Ŀ�̼� = ���� * Ŀ�̼��ۼ�Ʈ
-- Ŀ�̼��� ���� �ʴ� ��� 0���� ��ȸ�ϱ�
SELECT EMPLOYEE_ID
      ,NVL(SALARY * COMMISSION_PCT, 0) AS COMMISSION1
     , SALARY * NVL(COMMISSION_PCT, 0) AS COMMISSION2
  FROM EMPLOYEES;