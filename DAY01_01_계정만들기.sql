-- �� �� �ּ�(����)
/*
    ���� �� �ּ�(����)
*/

/*
    SQLDEVELOPER ������ �����ϴ� ���
    1. Ŀ���� �ΰ� CTRL + ENTER : Ŀ���� �ִ� �������� ����ȴ�.
    2. ����� ��� CTRL + ENTER : ����� ���� ��� �������� ����ȴ�.
    3. �׳� F5                  : ��ü ��ũ��Ʈ�� ����ȴ�.
*/

/*
    ������ ����
    1. SYS, SYSTEM �����̴�.
    2. ������ �������� �����ؼ� �������� ����� ���ο� ������ �����.
    3. ������ �������� �۾����� �ʵ��� �����Ѵ�.
*/

/*
    ���ο� ������ ����� ���
    1. CREATE USER ������ IDENTIFIED BY ��й�ȣ;
    2. GRANT ���� TO ������;
*/
-- CREATE USER C##GD IDENTIFIED BY 1111;
-- GRANT CONNECT TO C##GD;

/*
    ���� ������ �����ϴ� ���
    1. ������ ���� �����Ͱ� ���� �� : DROP USER ������;
    2. ������ ���� �����Ͱ� ���� �� : DROP USER ������ CASCADE;
*/
-- DROP USER C##GD;

-- ���ο� ������ ����� ��ü ��ũ��Ʈ
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
DROP USER GD CASCADE;
CREATE USER GD IDENTIFIED BY 1111;
GRANT DBA TO GD;
