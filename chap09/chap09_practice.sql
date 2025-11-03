--되새김 문제
-- P 249

--1번 전체 사원 중 ALLEN과 같은 직책인 사원의 사원 정보, 부서 정보를 출력

SELECT E.JOB, E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
        AND JOB = ANY (SELECT JOB
                    FROM EMP
                    WHERE ENAME = 'ALLEN');
                    
--2번 전체 사원의 평균 급여보다 많이 받는 사원의 사원 정보, 부서 정보, 급여 등급 정보를 출력
--    1) 급여가 많은 순으로 정렬하되 같다면 사원 번호를 기준으로 오름차순

SELECT E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC, E.SAL, S.GRADE
    FROM EMP E, DEPT D, SALGRADE S
    WHERE E.DEPTNO = D.DEPTNO
        AND E.SAL BETWEEN S.LOSAL AND S.HISAL
        AND E.SAL > (SELECT AVG(SAL) FROM EMP)
    ORDER BY E.SAL DESC, E.EMPNO;
    
--3번 10번 부서에 근무하는 사원 중 30번 부서에 없는 직책인 사원의 사원 정보, 부서 정보를 출력

SELECT E.EMPNO, E.ENAME, E.JOB, E.DEPTNO, D.DNAME, D.LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
        AND E.DEPTNO = 10
        AND JOB NOT IN (SELECT JOB FROM EMP WHERE DEPTNO = 30);
        
--4번 직책이 SALESMAN인 사람의 최고 급여보다 많이 받는 사원의 사원 정보, 급여 등급 정보를 출력
--    1) 다중행 함수를 사용하는 방법과 사용하지 않는 2가지 방법으로 작성
--    2) 사원 번호 기준 오름차순으로 정렬

--1. 다중행 함수 X
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
    FROM EMP E, SALGRADE S
    WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
        AND E.SAL > (SELECT MAX(SAL) FROM EMP WHERE JOB = 'SALESMAN');
        
--2. 다중행 사용 O
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
    FROM EMP E, SALGRADE S
    WHERE E.SAL > ALL (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN')
        AND E.SAL BETWEEN S.LOSAL AND S.HISAL
    ORDER BY E.EMPNO;