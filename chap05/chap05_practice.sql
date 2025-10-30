--되새김 문제
-- P 130

--1번 ENAME 이 S 로 끝나는 사원 데이터를 모두 출력

SELECT *
    FROM EMP
    WHERE ENAME LIKE '%S';
    
--2번 30번 부서에서 근무하는 사원 중에 직책이 SALESMAN인 사원의 사원 번호, 이름, 직책, 급여, 부서 번호를 출력

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 30
        AND JOB = 'SALESMAN';
        
--3번 EMP 테이블에서 20, 30번 부서에 근무하는 사원 중 급여가 2000초과인 사원을 두 방식의 SELECT 문을 사용하여 사원 번호, 이름, 직책, 급여, 부서 번호를 출력

--1) 집합 연산자를 사용하지 않은 방식
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
    WHERE (DEPTNO = 20 OR DEPTNO = 30)
        AND SAL > 2000;
        
--2) 집합 연산자를 사용한 방식
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 20
        OR DEPTNO = 30
INTERSECT
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
    WHERE SAL > 2000;
    
--4번 NOT BETWEEN A AND B 연산자를 쓰지 않고 급여가 2000 이상, 3000이하의 범위 이외의 값을 가진 데이터만 출력

SELECT *
    FROM EMP
    WHERE NOT SAL >= 2000
UNION
SELECT *
    FROM EMP
    WHERE NOT SAL <= 3000;
    
--5번 사원 이름에 E가 포함된 30번 부서의 사원 중 급여가 1000 ~ 2000 사이가 아닌 사원 이름, 사원 번호, 급여, 부서 번호를 출력

SELECT ENAME, EMPNO, SAL, DEPTNO
    FROM EMP
    WHERE ENAME LIKE ('%E%')
        AND DEPTNO = 30
        AND NOT (SAL >= 1000 AND SAL <= 2000);
        
--6번 추가 수당이 없고 상급자가 있고 직책이 MANAGER, CLERK인 사원 중에서 사원 이름의 두번째 글자가 L이 아닌 사원의 정보를 출력

SELECT *
    FROM EMP
    WHERE COMM IS NULL
        AND ENAME NOT LIKE ('_L%')
INTERSECT
SELECT *
    FROM EMP
    WHERE JOB = 'MANAGER'
        OR JOB = 'CLERK';
