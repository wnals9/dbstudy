-- 1. ���� ��¥ �� �ð�

-- ����Ŭ�� ��ġ�� ���� ���� �ð�
SELECT SYSDATE       -- DATE ����
     , SYSTIMESTAMP  -- TIMESTAMP ����
  FROM DUAL;

-- ����Ÿ���� ���� �ð�
SELECT SESSIONTIMEZONE
     , CURRENT_DATE       -- DATE ����
     , CURRENT_TIMESTAMP  -- TIMESTAMP ����
  FROM DUAL;
  
-- 2. ��¥�� ���ϴ� �������� ��ȸ�ϱ�
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')
     , TO_CHAR(SYSDATE, 'YYYY-MM-DD AM HH:MI:SS')
     , TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')
     , TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD HH24:MI:SS.FF3')  -- �и���(õ���� 1��) ����
  FROM DUAL;
  
-- 3. DATE ������ ��¥ ����
--    1) 1���� ���� 1�� ó���Ѵ�.
--    2) 1=1��, 1/24 = 1�ð�, 1/24/60 = 1��
SELECT TO_CHAR(SYSDATE + 1,          'YYYY-MM-DD AM HH:MI:SS')  -- 1�� ��
     , TO_CHAR(SYSDATE + 1/24,       'YYYY-MM-DD AM HH:MI:SS')  -- 1�ð� ��
     , TO_CHAR(SYSDATE + 1/24/60,    'YYYY-MM-DD AM HH:MI:SS')  -- 1�� ��
     , TO_CHAR(SYSDATE + 1/24/60/60, 'YYYY-MM-DD AH HH:MI:SS')  -- 1�� ��
  FROM DUAL;

SELECT SYSDATE - TO_DATE('23/07/01', 'YY/MM/DD')
     , TRUNC(SYSDATE - TO_DATE('23/07/01', 'YY/MM/DD')) --����� �ϼ�
  FROM DUAL;

-- 4. TIMESTAMP ������ ��¥ ����
--    1) INTERVAL Ű���带 �̿��Ѵ�.
--    2) YEAR, MONTH, DAY, HOUR, MINUTE, SECOND ������ ����Ѵ�.
SELECT SYSTIMESTAMP + INTERVAL '1' YEAR   -- 1�� ��
     , SYSTIMESTAMP + INTERVAL '1' MONTH  -- 1���� ��
     , SYSTIMESTAMP + INTERVAL '1' DAY    -- 1�� ��
     , SYSTIMESTAMP + INTERVAL '1' HOUR   -- 1�ð� ��
     , SYSTIMESTAMP + INTERVAL '1' MINUTE -- 1�� ��
     , SYSTIMESTAMP + INTERVAL '1' SECOND -- 1�� ��
  FROM DUAL;
  
SELECT SYSTIMESTAMP - TO_TIMESTAMP('23/07/01', 'YY/MM/DD') -- ����� �Ⱓ�� TIMESTAMP �������� ��ȯ
     , EXTRACT(DAY FROM SYSTIMESTAMP - TO_TIMESTAMP('23/07/01', 'YY/MM/DD'))  -- ����� �Ⱓ���� �ϼ��� ����
  FROM DUAL;

  
  
     