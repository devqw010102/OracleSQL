/*

    7-1 다중행 함수

*/

--실습 7-1 SUM 함수를 사용하여 급여 합계 출력

SELECT SUM(SAL)
    FROM EMP;
    
--실습 7-2 SUM 함수를 사용하여 사원 이름과 급여 합계 출력

SELECT ENAME, SUM(SAL)
    FROM EMP;
    
--실습 7-3 추가 수당 합계 구하기

SELECT SUM(COMM)
    FROM EMP;
    
--실습 7-4 급여 합계 구하기(DISTINCT, ALL 사용)

SELECT SUM(DISTINCT SAL),
       SUM(ALL SAL),
       SUM(SAL)
    FROM EMP;
    
--실습 7-5 EMP 테이블의 데이터 개수 출력하기

SELECT COUNT(*)
    FROM EMP;
    
--실습 7-6 부서 번호가 30번인 직원 수 구하기

SELECT COUNT(*)
    FROM EMP
    WHERE DEPTNO = 30;
    
--실습 7-7 COUNT 함수를 사용하여 급여 개수 구하기(DISTINCT, ALL 사용)

SELECT COUNT(DISTINCT SAL),
       COUNT(ALL SAL),
       COUNT(SAL)
    FROM EMP;
    
--실습 7-8 COUNT 함수를 사용하여 추가 수당 열 개수 출력

SELECT COUNT(COMM)
    FROM EMP;
    
--실습 7-9 COUNT 함수와 IS NOT NULL을 사용하여 추가 수당 열 개수 출력

SELECT COUNT(COMM)
    FROM EMP
    WHERE COMM IS NOT NULL;
    
--실습 7-10 부서 번호가 10인 사원의 최대 급여 출력

SELECT MAX(SAL)
    FROM EMP
    WHERE DEPTNO = 10;
    
--실습 7-11 부서 번호가 10인 사원의 최소 급여 출력

SELECT MIN(SAL)
    FROM EMP
    WHERE DEPTNO = 10;
    
--실습 7-12 부서 번호가 20인 사원의 입사일 중 최근 입사일 출력

SELECT MAX(HIREDATE)
    FROM EMP
    WHERE DEPTNO = 20;
    
--실습 7-13 부서 번호가 20인 사원의 입사일 중 가장 오래된 입사일 출력

SELECT MIN(HIREDATE)
    FROM EMP
    WHERE DEPTNO = 20;
    
--실습 7-14 부서 번호가 30인 사원의 평균 급여 출력하기

SELECT AVG(SAL)
    FROM EMP
    WHERE DEPTNO = 30;
    
--실습 7-15 DISTINCT로 중복을 제거한 급여 열의 평균 급여 구하기

SELECT AVG(DISTINCT SAL)
    FROM EMP
    WHERE DEPTNO = 30;
    
--실습 7-16 집합 연산자를 사용하여 부서별 평균 급여 출력

SELECT AVG(SAL), '10' AS DEPTNO 
    FROM EMP 
    WHERE DEPTNO = 10
UNION ALL
SELECT AVG(SAL), '20' AS DEPTNO
    FROM EMP
    WHERE DEPTNO = 20
UNION ALL
SELECT AVG(SAL), '30' AS DEPTNO
    FROM EMP
    WHERE DEPTNO = 30;
    
--실습 7-17 GROUP BY를 사용하여 부서별 평균 급여 출력

SELECT AVG(SAL), DEPTNO
    FROM EMP
    GROUP BY DEPTNO;
    
--실습 7-18 부서 번호와 직책별 평균 급여로 정렬

SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
    GROUP BY DEPTNO, JOB
    ORDER BY DEPTNO, JOB;   

--실습 7-19 GROUP BY절에 없는 열을 SELECT절에 포함할 때

SELECT ENAME, DEPTNO, AVG(SAL)
    FROM EMP
    GROUP BY DEPTNO;

--실습 7-20 GROUP BY절과 HAVING절을 사용하여 출력

SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
    GROUP BY DEPTNO, JOB
        HAVING AVG(SAL) >= 2000
    ORDER BY DEPTNO, JOB;
    
--실습 7-21 HAVING절 대신 WHERE절을 잘못 사용할 때

SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
    WHERE AVG(SAL) >= 2000
    GROUP BY DEPTNO, JOB
    ORDER BY DEPTNO, JOB;

--실습 7-22 WHERE절을 사용하지 않고 HAVING절만 사용한 경우

SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
    GROUP BY DEPTNO, JOB
        HAVING AVG(SAL) >= 2000
    ORDER BY DEPTNO, JOB;
    
--실습 7-23 WHERE절과 HAVING절을 모두 사용한 경우

SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
    WHERE SAL <= 3000
    GROUP BY DEPTNO, JOB
        HAVING AVG(SAL) >= 2000
    ORDER BY DEPTNO, JOB;