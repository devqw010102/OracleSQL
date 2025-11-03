--되새김 문제
-- P 200

--1번 조건에 맞는 결과가 나오도록 구문 작성
--    1) EMP 테이블을 이용하여 부서 번호, 평균 급여, 최고 급여, 최저 급여, 사원 수를 출력
--    2) 평균 급여를 출력할 때 소수는 제외하고 부서 번호별로 출력

SELECT DEPTNO,
       TRUNC(AVG(SAL)) AS AVG_SAL,
       MAX(SAL) AS MAX_SAL,
       MIN(SAL) AS MIN_SAL,
       COUNT(*) AS CNT
    FROM EMP
    GROUP BY DEPTNO;
    
--2번 같은 직책에 종사하는 사원이 3명 이상인 직책과 인원수를 출력

SELECT JOB, COUNT(*)
    FROM EMP
    GROUP BY JOB
        HAVING COUNT(*) >= 3;
        
--3번 사원의 입사 연도를 기준으로 부서별로 몇 명씩 입사했는지 출력

SELECT TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR, DEPTNO, COUNT(*) AS CNT
    FROM EMP
    GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO;
    
--4번 추가 수당을 받는 사원 수와 받지 않는 사원 수를 출력

SELECT NVL2(COMM, 'O', 'X') AS EXIST_COMM,
       COUNT(*) AS CNT
    FROM EMP
    GROUP BY NVL2(COMM, 'O', 'X');