/*
    ��
    1. ���̺��̳� �ٸ� �並 �̿��ؼ� ���� ���� ���̺��̴�.
    2. �����Ͱ� �ƴ� ���������� �����ϰ� �ִ�.
    3. ���ֻ���ϰ� ������ �������� ��� ����� �θ� ���� ȣ���ؼ� ����� �� �ִ�.
*/

-- �� �����
CREATE VIEW V_EMP AS (
    SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME, E.JOB_ID, D.DEPARTMENT_ID, D.DEPARTMENT_NAME, D.LOCATION_ID
      FROM DEPARTMENTS D INNER JOIN EMPLOYEES E
        ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
);

-- �� ��ȸ�ϱ�
SELECT *
  FROM V_EMP;
  

-- �並 �̿��� ��ȸ ����

-- 1. �����ȣ, �����, �μ���ȣ, �μ���, ������ȣ, ���θ� �ּҸ� ��ȸ�Ͻÿ�.
SELECT V.EMPLOYEE_ID, V.FIRST_NAME, V.LAST_NAME, V.DEPARTMENT_ID, V.DEPARTMENT_NAME, L.LOCATION_ID, L.STREET_ADDRESS
  FROM LOCATIONS L INNER JOIN V_EMP V
    ON L.LOCATION_ID = V.LOCATION_ID;

-- 2. �����ȣ, �����, �μ���ȣ, ������ȣ, �����̸�(JOB_TITLE)�� ��ȸ�Ͻÿ�
SELECT V.EMPLOYEE_ID, V.FIRST_NAME, V.LAST_NAME, J.JOB_ID, J.JOB_TITLE
  FROM JOBS J INNER JOIN V_EMP V
    ON J.JOB_ID = V.JOB_ID;

-- �� ����
DROP VIEW V_EMP;