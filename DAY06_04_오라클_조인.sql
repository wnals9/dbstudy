/*
    ����
    
    1. 2�� �̻��� ���̺��� �� ���� ��ȸ�ϴ� ����̴�.
    2.�� ���̺��� ����(1 : M)�� �̿��ؼ� ���� ������ �����.
    3.���� ����
       1) ���� ���� : 2�� ���̺� ��� �����ϴ� �����͸� ��ȸ�ϴ� ���
       2) �ܺ� ���� : 2�� ���̺� ��� �������� �ʴ��� ��ȸ�ϴ� ���
       
       ȸ��      ����
       1 a     1 a �����
       2 b     2 a ������
       3 c     3 b �����
       
       ���ų����� �̾ƺ���(���� ����)
       a �����
       a ������
       b �����
       
       ���ų����� ���� ����� �����ؼ� ���ų����� �̾ƺ���(�ܺ� ����)
       a �����
       a ������
       b �����
       c null
*/

/*
    ����̺� ���̺� vs �帮�� ���̺�
    
    1. ����̺� ���̺�
       1) ���� ���踦 ó���ϴ� ���� ���̺�
       2. 1:M ���迡�� 1�� �ش��ϴ� ���̺�
       3) �Ϲ������� �������� ������ ����.
       4) PK�� ���� �������� ����ϱ� ������ �ε���(INDEX) ����� �����ϴ�.(�����ٴ� �ǹ�)
    2. �帮�� ���̺�
       1) 1:M ���迡�� M�� �ش��ϴ� ���̺�
       2) �Ϲ������� �������� ������ ����.
       3) FK�� ���� �������� ����ϱ� ������ �ε���(INDEX) ����� �Ұ����ϴ�.(�����ٴ� �ǹ�)\
    3. ����̺� ���̺��� �帮�� ���̺��� ���� �ۼ��ϸ� ���ɿ� ������ �ȴ�.
*/

-- ���� ����

-- 1. �����ȣ, �����, �μ���ȣ, �μ����� ��ȸ�Ͻÿ�.
SELECT E.EMPLOYEE_ID
     , E.FIRST_NAME
     , E.LAST_NAME
     , D.DEPARTMENT_ID  --2���� ���̺� ��� �ִ� Į��(�̸��� ���� Į��)�� �ݵ�� ���̺�(����)�� ����ؾ� �Ѵ�.
     , D.DEPARTMENT_NAME
  FROM DEPARTMENTS D, EMPLOYEES E          -- INNER JOIN ��� �޸�(,)�� ����Ѵ�.
 WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID;  -- ON ��� WHERE�� ����Ѵ�.

-- 2. �����ȣ, �����, ����, ������ �ִ뿬��,�ּҿ����� ��ȸ�Ͻÿ�.
SELECT E.EMPLOYEE_ID
     , E.FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME
     , J.JOB_ID
     , E.SALARY
     , J.MIN_SALARY
     , J.MAX_SALARY
  FROM JOBS J, EMPLOYEES E
 WHERE J.JOB_ID = E.JOB_ID;
    

-- �ܺ� ����

-- 3. ��� �������(�μ��� ���� ��d�� ����) �����ȣ, �����, �μ���ȣ, �μ����� ��ȸ�Ͻÿ�.
SELECT E.EMPLOYEE_ID
     , E.FIRST_NAME
     , E.LAST_NAME
     , D.DEPARTMENT_ID
     , D.DEPARTMENT_NAME
  FROM DEPARTMENTS D, EMPLOYEES E -- ������ ���̺�(EMPLOYEES)�� ��� �����͸� ��ȸ�Ͻÿ�.(�μ���ȣ�� ���� ����� ��ȸ�Ͻÿ�)
 WHERE D.DEPARTMENT_ID(+) = E.DEPARTMENT_ID;  -- RIGHT OUTER JOIN�� �ݴ����(LEFT)�� (+)�� �߰��Ѵ�.
    
-- 4. �����ȣ, �����, �μ���ȣ, �μ����� ��ȸ�Ͻÿ�. ����� �ٹ����� �ʴ� ���� �μ��� ��ȸ�Ͻÿ�.
SELECT E.EMPLOYEE_ID
     , E.FIRST_NAME
     , E.LAST_NAME
     , D.DEPARTMENT_ID
     , D.DEPARTMENT_NAME
 FROM DEPARTMENTS D, EMPLOYEES E -- ���� ���̺�(DEPARTMENTS)�� ��� �����͸� ��ȸ�Ͻÿ�.(����� �ٹ����� �ʴ� �μ��� ��ȸ�Ͻÿ�)
 WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID(+);  -- LEFT OUTER JOIN�� �ݴ����(RIGHT)�� (+)�� �߰��Ѵ�.
   

-- 3�� �̻� ���̺� �����ϱ�

-- 5. �����ȣ, �����, �μ���ȣ, �μ���, �ٹ������� ��ȸ�Ͻÿ�
SELECT E.EMPLOYEE_ID
     , E.FIRST_NAME
     , E.LAST_NAME
     , D.DEPARTMENT_ID
     , D.DEPARTMENT_NAME
     , L.LOCATION_ID
     , L.CITY
  FROM LOCATIONS L, DEPARTMENTS D, EMPLOYEES E
 WHERE L.LOCATION_ID = D.LOCATION_ID
   AND D.DEPARTMENT_ID = E.DEPARTMENT_ID;

-- 6. �μ���ȣ, �μ���, �ٹ�����, �ٹ����� ��ȸ�Ͻÿ�.
SELECT D.DEPARTMENT_ID
     , D.DEPARTMENT_NAME
     , L.LOCATION_ID
     , C.COUNTRY_NAME
  FROM COUNTRIES C, LOCATIONS L, DEPARTMENTS D
 WHERE C.COUNTRY_ID = L.COUNTRY_ID
   AND L.LOCATION_ID = D.LOCATION_ID;