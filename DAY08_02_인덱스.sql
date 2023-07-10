/*
    RWOID
    1. ����Ŭ���� �����ϴ� ���� Į��(PSEUDO COLUMN)�̴�.
    2. � ���� ��� ����Ǿ� �ִ��� �˰� �ִ� Į���̴�.
    3. ������ ����� ������ ������ġ�� Ȯ���� �� �ִ�.
*/

-- ROWID Ȯ��
SELECT ROWID, EMPLOYEE_ID, FIRST_NAME, LAST_NAME
  FROM EMPLOYEES;

-- ROWID�� �̿��� ��ȸ
-- 1. ����Ŭ���� ���� ���� ��ȸ�̴�.
-- 2. ������ ����ϱⰡ �Ұ����ϴ�. ��� �ε����� ����Ѵ�.
SELECT *
  FROM EMPLOYEES
 WHERE ROWID = 'AAASHDAAHAAAAF7AAE';
 
 
/*
    �ε���
    1. ���� ��ȸ�� �����ϴ� �����ͺ��̽� ��ü�̴�.
    2. � �����Ͱ� � ROWID�� ������ �ִ��� �˰� �ִ�.
    3. �⺻Ű(PK)�� �ߺ��� ���� Į��(UNIQUE)�� �ڵ����� �ε����� ���������.
    4. �ε����� ������ �������� ����/����/���� �� �ε����� �Բ� �����ؾ� �ϱ� ������ ��ü���� ������ ������ �� �ִ�.
*/


/*
    ������ ����
    1. Ư�� �������� ������ ��� �ִ� ��ü�̴�.
    2. �ý��� īŻ�α�, ��Ÿ �����Ͷ�� �Ѵ�.
    3. ���� �������� �����Ѵ�.
        1) DBA_
        2) USER_
        3) ALL_
*/

-- �ε��� ������ ����Ǿ� �ִ� ������ ����(�̹� ������� ���̺�)
-- DBA_INDEXES, USER_INDEXES, ALL_INDEXES
SELECT * FROM USER_INDEXES;

-- �ε����� ������ Į�� ������ ����Ǿ� �ִ� ������ ����
-- DBA_IND_COLUMNS, USER_IND_COLUMNS, ALL_IND_COLUMNS
SELECT * FROM USER_IND_COLUMNS;

SELECT * FROM USER_IND_COLUMNS WHERE TABLE_NAME = 'EMPLOYEES';

-- �μ� ���̺��� �μ���(DEPARTMENT_NAME) Į���� �ε��� �����ϱ�
CREATE INDEX DEPT_NAME_IX
    ON DEPARTMENTS(DEPARTMENT_NAME);

-- �ε��� DEPT_NAME_IX �����ϱ�
DROP INDEX DEPT_NAME_IX;