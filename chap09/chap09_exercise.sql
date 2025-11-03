/*

    9-1 서브 쿼리

*/

--실습 9-1 이름이 JONES인 사원의 급여 출력하기

SELECT SAL
    FROM EMP
    WHERE ENAME = 'JONES';
    
--실습 9-2 급여가 2975보다 높은 사원 정보 출력하기

SELECT *
    FROM EMP
    WHERE SAL > 2975;
    
--실습 9-3 서브쿼리로 JONES의 급여보다 높은 급여를 받는 사원 정보 출력하기

SELECT *
    FROM EMP
    WHERE SAL > (SELECT SAL
                    FROM EMP
                    WHERE ENAME = 'JONES');                    
                    
    
/*

    9-2 단일행 서브쿼리

*/


--실습 9-4 서브쿼리의 결괏값이 날짜형인 경우

SELECT *
    FROM EMP
    WHERE HIREDATE < (SELECT HIREDATE
                        FROM EMP
                        WHERE ENAME = 'SCOTT');
                        
--실습 9-5 서브쿼리 안에서 함수를 사용한 경우

SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
        AND E.DEPTNO = 20
        AND E.SAL > (SELECT AVG(SAL) 
                        FROM EMP);


/*

    9-3 다중행 서브쿼리

*/


--실습 9-6 IN 연산자 사용하기

SELECT *
    FROM EMP
    WHERE DEPTNO IN (20, 30);

--실습 9-7 부서별 최고 급여와 같은 급여를 받는 사원 정보 출력하기

SELECT *
    FROM EMP
    WHERE SAL IN (SELECT MAX(SAL)
                    FROM EMP
                    GROUP BY DEPTNO);
                    
--실습 9-8 부서 번호별로 최대 급여 출력하기

SELECT MAX(SAL)
    FROM EMP
    GROUP BY DEPTNO;
    
--실습 9-9 ANY 연산자 사용하기

SELECT *
    FROM EMP
    WHERE SAL = ANY (SELECT MAX(SAL)
                        FROM EMP
                        GROUP BY DEPTNO);
                        
--실습 9-10 SOME 연산자 사용하기

SELECT *
    FROM EMP
    WHERE SAL = SOME (SELECT MAX(SAL)
                        FROM EMP
                        GROUP BY DEPTNO);
                        
--실습 9-11 30번 부서 사원의 최대 급여보다 적은 급여를 받는 사원 정보 출력하기

SELECT *
    FROM EMP
    WHERE SAL < ANY (SELECT SAL
                        FROM EMP
                        WHERE DEPTNO = 30)
    ORDER BY SAL, EMPNO;
    
--실습 9-12 부서 번호가 30인 사원의 급여 출력하기

SELECT SAL
    FROM EMP
    WHERE DEPTNO = 30;
    
--실습 9-13 30번 부서 사원의 최소 급여보다 많은 급여를 받는 사원 정보 출력하기

SELECT *
    FROM EMP
    WHERE SAL > ANY (SELECT SAL
                        FROM EMP
                        WHERE DEPTNO = 30);
        
--실습 9-14 부서 번호가 30번인 사원의 최소 급여보다 더 적은 급여를 받는 사원 출력하기

SELECT *
    FROM EMP
    WHERE SAL < ALL (SELECT SAL
                        FROM EMP
                        WHERE DEPTNO = 30);
                        
--실습 9-15 부서 번호가 30번인 사원의 최대 급여보다 더 많은 급여를 받는 사원 출력하기

SELECT *
    FROM EMP
    WHERE SAL > ALL (SELECT SAL
                        FROM EMP
                        WHERE DEPTNO = 30);
                        
--실습 9-16 서브쿼리에 결괏값이 있을 때

SELECT *
    FROM EMP
    WHERE EXISTS (SELECT DNAME
                    FROM DEPT
                    WHERE DEPTNO = 10);
                    
--실습 9-17 서브쿼리에 결괏값이 없을 때

SELECT *
    FROM EMP
    WHERE EXISTS (SELECT DNAME
                    FROM DEPT
                    WHERE DEPTNO = 50);
                    
                    
/*

    9-4 다중열 서브쿼리

*/                
                

--실습 9-18 다중열 서브쿼리 사용하기

SELECT *
    FROM EMP
    WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL)
                            FROM EMP
                            GROUP BY DEPTNO);
                            
                            
/*

    9-5 FROM 절에 사용하는 서브쿼리, WITH 절

*/

--실습 9-19 인라인 뷰 사용하기

SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
    FROM (SELECT * FROM EMP WHERE DEPTNO = 10) E10,
         (SELECT * FROM DEPT) D
    WHERE E10.DEPTNO = D.DEPTNO;
    
--실습 9-20 WITH절 사용하기

WITH
E10 AS (SELECT * FROM EMP WHERE DEPTNO = 10),
D   AS (SELECT * FROM DEPT)
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
    FROM E10, D
    WHERE E10.DEPTNO = D.DEPTNO;
    
/*

    9-6 SELECT 절에 사용하는 서브쿼리

*/


--실습 9-21 SELECT 절에 서브쿼리 사용하기

SELECT EMPNO, ENAME, JOB, SAL,
       (SELECT GRADE
            FROM SALGRADE
            WHERE E.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE,
       DEPTNO,
       (SELECT DNAME
            FROM DEPT
            WHERE E.DEPTNO = DEPT.DEPTNO) AS DNAME
    FROM EMP E;