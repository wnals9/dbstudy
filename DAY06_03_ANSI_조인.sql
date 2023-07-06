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
SELECT EMPLOYEE_ID
     , FIRST_NAME
     , LAST_NAME
     , D.DEPARTMENT_ID  --2���� ���̺� ��� �ִ� Į��(�̸��� ���� Į��)�� �ݵ�� ���̺�(����)�� ����ؾ� �Ѵ�.
     , DEPARTMENT_NAME
  FROM DEPARTMENTS D INNER JOIN EMPLOYEES E  -- ���̺� ���� : ���̺�� ���� 
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;

-- 2. �����ȣ, �����, ����, ������ �ִ뿬��,�ּҿ����� ��ȸ�Ͻÿ�.
SELECT EMPLOYEE_ID
     , FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME
     , J.JOB_ID
     , SALARY
     , MIN_SALARY
     , MAX_SALARY
  FROM JOBS J INNER JOIN EMPLOYEES E
    ON J.JOB_ID = E.JOB_ID;
    

-- �ܺ� ����

-- 3. ��� �������(�μ��� ���� ��d�� ����) �����ȣ, �����, �μ���ȣ, �μ����� ��ȸ�Ͻÿ�.
SELECT EMPLOYEE_ID
     , FIRST_NAME
     , LAST_NAME
     , D.DEPARTMENT_ID
     , DEPARTMENT_NAME
  FROM DEPARTMENTS D RIGHT OUTER JOIN EMPLOYEES E -- ������ ���̺�(EMPLOYEES)�� ��� �����͸� ��ȸ�Ͻÿ�.(�μ���ȣ�� ���� ����� ��ȸ�Ͻÿ�)
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;
    
-- 4. �����ȣ, �����, �μ���ȣ, �μ����� ��ȸ�Ͻÿ�. ����� �ٹ����� �ʴ� ���� �μ��� ��ȸ�Ͻÿ�.
SELECT EMPLOYEE_ID
     , FIRST_NAME
     , LAST_NAME
     , D.DEPARTMENT_ID
     , DEPARTMENT_NAME
 FROM DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E -- ���� ���̺�(DEPARTMENTS)�� ��� �����͸� ��ȸ�Ͻÿ�.(����� �ٹ����� �ʴ� �μ��� ��ȸ�Ͻÿ�)
   ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;