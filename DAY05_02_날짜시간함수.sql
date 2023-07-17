-- 1. 현재 날짜 및 시간

-- 오라클이 설치된 서버 기준 시간
SELECT SYSDATE       -- DATE 형식
     , SYSTIMESTAMP  -- TIMESTAMP 형식
  FROM DUAL;

-- 세션타임존 기준 시간
SELECT SESSIONTIMEZONE
     , CURRENT_DATE       -- DATE 형식
     , CURRENT_TIMESTAMP  -- TIMESTAMP 형식
  FROM DUAL;
  
-- 2. 날짜를 원하는 형식으로 조회하기
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')
     , TO_CHAR(SYSDATE, 'YYYY-MM-DD AM HH:MI:SS')
     , TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')
     , TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD HH24:MI:SS.FF3')  -- 밀리초(천분의 1초) 포함
  FROM DUAL;
  
-- 3. DATE 형식의 날짜 연산
--    1) 1일을 숫자 1로 처리한다.
--    2) 1=1일, 1/24 = 1시간, 1/24/60 = 1분
SELECT TO_CHAR(SYSDATE + 1,          'YYYY-MM-DD AM HH:MI:SS')  -- 1일 후
     , TO_CHAR(SYSDATE + 1/24,       'YYYY-MM-DD AM HH:MI:SS')  -- 1시간 후
     , TO_CHAR(SYSDATE + 1/24/60,    'YYYY-MM-DD AM HH:MI:SS')  -- 1분 후
     , TO_CHAR(SYSDATE + 1/24/60/60, 'YYYY-MM-DD AH HH:MI:SS')  -- 1초 후
  FROM DUAL;

SELECT SYSDATE - TO_DATE('23/07/01', 'YY/MM/DD')
     , TRUNC(SYSDATE - TO_DATE('23/07/01', 'YY/MM/DD')) --경과한 일수
  FROM DUAL;

-- 4. TIMESTAMP 형식의 날짜 연산
--    1) INTERVAL 키워드를 이용한다.
--    2) YEAR, MONTH, DAY, HOUR, MINUTE, SECOND 단위를 사용한다.
SELECT SYSTIMESTAMP + INTERVAL '1' YEAR   -- 1년 후
     , SYSTIMESTAMP + INTERVAL '1' MONTH  -- 1개월 후
     , SYSTIMESTAMP + INTERVAL '1' DAY    -- 1일 후
     , SYSTIMESTAMP + INTERVAL '1' HOUR   -- 1시간 후
     , SYSTIMESTAMP + INTERVAL '1' MINUTE -- 1분 후
     , SYSTIMESTAMP + INTERVAL '1' SECOND -- 1초 후
  FROM DUAL;
  
SELECT SYSTIMESTAMP - TO_TIMESTAMP('23/07/01', 'YY/MM/DD') -- 경과한 기간이 TIMESTAMP 형식으로 반환
     , EXTRACT(DAY FROM SYSTIMESTAMP - TO_TIMESTAMP('23/07/01', 'YY/MM/DD'))  -- 경과한 기간에서 일수를 추출
  FROM DUAL;

  
  
     