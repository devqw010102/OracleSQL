--되새김 문제
-- P 179

--1번 조건에 맞는 결과가 나오도록 구문 작성
--    1) EMPNO 열에는 EMP 테이블에서 사원 이름이 다섯 글자 이상이며, 6글자 미만인 사원 정보를 출력
--    2) MASKING_EMPNO 열에는 사원 번호 앞 두 자리 외 뒷자리를 * 기호로 출력
--    3) MASING_ENAME 열에는 사원 이름의 첫 글자만 보여 주고 나머지 글자 수만큼 * 기호로 출력

SELECT EMPNO, 
       RPAD(SUBSTR(EMPNO, 1, 2), 4, '*') AS MASKING_EMPNO, 
       ENAME,
       RPAD(SUBSTR(ENAME, 1, 1), LENGTH(ENAME), '*') AS MASKING_ENAME
    FROM EMP
    WHERE LENGTH(ENAME) = 5;
        
--2번 조건에 맞는 결과가 나오도록 구문 작성
--    1) EMP 테이블에서 사원의 월 평균 근무일 수는 21.5일이다. 하루 근무 시간을 8시간으로 볼 때 사원의 하루 급여와 시급을 계산하여 출력
--    2) 하루 급여는 소수 셋째 자리에서 버리고, 시급은 소수 둘째 자리에서 반올림

SELECT EMPNO, ENAME, SAL, 
       TRUNC(SAL / 21.5, 2) AS DAY_PAY,
       ROUND(SAL / 21.5 / 8, 1) AS TIME_PAY
    FROM EMP;
    
--3번 조건에 맞는 결과가 나오도록 구문 작성
--    1) EMP 테이블에서 입사일을 기준으로 3개월이 지난 후 첫 월요일에 정사원이 된다.
--    2) 사원이 정직원이 되는 날짜(R-JOB)을 YYYY-MM-DD 형식으로 출력
--    3) 단 추가 수당이 없는 사원의 추가수당은 N/A 로 출력

SELECT EMPNO, ENAME, HIREDATE,
       TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE, 3), '월요일'), 'YYYY-MM-DD') AS R_JOB,
       NVL(TO_CHAR(COMM), 'N/A') AS COMM
    FROM EMP;
    

--4번 EMP 테이블의 모든 사원을 대상으로 직속상관이 사원 번호를 조건을 기준으로 변환해서 CHG_MGR 열에 출력
--    1) 직속상관의 사원 번호가 없을 때 : 0000
--    2) 직속상관의 사원 번호 앞 두 자리가 75일 때 : 5555
--    3) 직속상관의 사원 번호 앞 두 자리가 76일 때 : 6666
--    4) 직속상관의 사원 번호 앞 두 자리가 77일 때 : 7777
--    5) 직속상관의 사원 번호 앞 두 자리가 78일 때 : 8888
--    6) 그 외 직속상관 사원 번호일 때 : 사원 번호 그대로 출력

SELECT EMPNO, ENAME, MGR,
       CASE
            WHEN MGR IS NULL THEN '0000'
            WHEN SUBSTR(MGR, 1, 2) = 75 THEN '5555'
            WHEN SUBSTR(MGR, 1, 2) = 76 THEN '6666'
            WHEN SUBSTR(MGR, 1, 2) = 77 THEN '7777'
            WHEN SUBSTR(MGR, 1, 2) = 78 THEN '8888'
            ELSE TO_CHAR(MGR)
       END AS CHG_MGR
    FROM EMP;