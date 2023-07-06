/*
    SELECT ���� ���� ����
    
    SELECT Į��       5
      FROM ���̺�     1
     WHERE ����       2
     GROUP BY �׷�    3
    HAVING �׷�����   4
     ORDER BY ����    6
*/

-- ��� ���̺��� �μ��� ������� ��ȸ�Ͻÿ�.
-- ����
SELECT DEPARTMENT_ID, COUNT(*)  -- 3
  FROM EMPLOYEES                -- 1
 GROUP BY DEPARTMENT_ID;        -- 2
 
-- �Ұ���
SELECT DEPARTMENT_ID AS DEPT_ID, COUNT(*)  -- 3
  FROM EMPLOYEES                           -- 1
 GROUP BY DEPT_ID;                         -- 2 (GROUP BY ���� ����Ǵ� ���������� DEPT_ID�� �������� �ʱ� ������ ������ �߻�)


-- ��� ���̺��� �μ��� ���� ��հ� ������� ��ȸ�Ͻÿ�. �μ��� ������� 2�� �̻��� �μ��� ��ȸ�Ͻÿ�.
-- �Ұ���
SELECT DEPARTMENT_ID         AS �μ���ȣ
     , ROUND(AVG(SALARY), 2) AS ��տ���
     , COUNT(*)              AS �����    -- 4
  FROM EMPLOYEES                          -- 1
 GROUP BY DEPARTMENT_ID                   -- 2
HAVING ����� >= 2                        -- 3 (HAVING ���� ����Ǵ� ���������� "�����"�� �������� �ʱ� ������ ������ �߻�)
 ORDER BY DEPARTMENT_ID;                  -- 5

-- ����
SELECT DEPARTMENT_ID         AS �μ���ȣ
     , ROUND(AVG(SALARY), 2) AS ��տ���
     , COUNT(*)              AS �����    -- 4
  FROM EMPLOYEES                          -- 1
 GROUP BY DEPARTMENT_ID                   -- 2
HAVING COUNT(*) >= 2                      -- 3
 ORDER BY �μ���ȣ;                       -- 5 (ORDER BY ���� ����Ǳ� ������ SELECT ������ "�μ���ȣ" ������ �����Ǿ��� ������ ��� ����)