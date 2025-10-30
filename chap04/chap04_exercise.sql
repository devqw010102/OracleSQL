/*

    4-1 실습용 테이블 살펴보기

*/

--실습 4-1

DESC EMP;

--실습 4-2

DESC DEPT;

--실습 4-3

DESC SALGRADE;



/*

    4-2 SELECT , FROM

*/



--실습 4-4 EMP 테이블 전체 열 조회하기

SELECT * FROM EMP;

--실습 4-5 열을 쉼표로 구분하여 출력하기

SELECT EMPNO, ENAME, DEPTNO 
    FROM EMP;

--실습 4-6 DISTINCT로 열 중복 제거하기

SELECT DISTINCT DEPTNO
    FROM EMP;
    
--실습 4-7 여러 개 열을 명시하여 중복 제거하기

SELECT DISTINCT JOB, DEPTNO
    FROM EMP;
    
--실습 4-8 직책, 부서 번호 출력하기(ALL 사용)

SELECT ALL JOB, DEPTNO
    FROM EMP;
    
--실습 4-9 열에 연산식을 사용하여 출력하기

SELECT ENAME, SAL, SAL * 12 + COMM, COMM
    FROM EMP;
    
--실습 4-10 곱하기를 사용하지 않고 사원의 연간 총수입 출력하기

SELECT ENAME, SAL, SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+COMM, COMM
    FROM EMP;

--실습 4-11 별칭을 사용하여 사원의 연간 총 수입 출력하기

SELECT ENAME, SAL, SAL*12 + COMM AS ANNSAL, COMM
    FROM EMP;
    
--실습 4-12 EMP 테이블의 모든 열을 급여 기준으로 오름차순 정렬하기

SELECT *
    FROM EMP
    ORDER BY SAL;
    
--실습 4-13 EMP 테이블의 모든 열을 급여 기준으로 내림차순 정렬하기

SELECT *
    FROM EMP
    ORDER BY SAL DESC;
    
--실습 4-14 EMP 테이블의 전체 열을 부서 번호(오름차순)와 급여(내림차순)로 정렬하기

SELECT *
    FROM EMP
    ORDER BY DEPTNO ASC, SAL DESC;