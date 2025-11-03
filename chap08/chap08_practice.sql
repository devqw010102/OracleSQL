--되새김 문제
-- P 227

--1번 급여가 2000을 초과한 사원의 부서 정보, 사원 정보를 출력
--    1) SQL-99 이전 방식과 SQL-99 방식을 각각 사용하여 작성

--1-1 99 이전 방식
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
        AND E.SAL > 2000;

--1-2 99 방식
SELECT DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
    FROM EMP E NATURAL JOIN DEPT D
    WHERE E.SAL > 2000;

--2번 부서별 평균 급여, 최소 급여, 사원 수를 출력
--    1) SQL-99 이전 방식과 SQL-99 방식을 각각 사용하여 작성

--1-1 99 이전 방식
SELECT D.DEPTNO, D.DNAME,
       TRUNC(AVG(E.SAL)) AS AVG_SAL,
       MAX(E.SAL) AS MAX_SAL,
       MIN(E.SAL) AS MIN_SAL,
       COUNT(*) AS CNT
    FROM EMP E, DEPT D 
    WHERE E.DEPTNO = D.DEPTNO
    GROUP BY D.DEPTNO, D.DNAME;
    
--1-2 99 방식
SELECT DEPTNO, D.DNAME,
       TRUNC(AVG(E.SAL)) AS AVG_SAL,
       MAX(E.SAL) AS MAX_SAL,
       MIN(E.SAL) AS MIN_SAL,
       COUNT(*) AS CNT
    FROM EMP E NATURAL JOIN DEPT D
    GROUP BY DEPTNO, D.DNAME;
    
--3번 모든 부서 정보와 부서 번호, 사원 이름순으로 정렬하여 출력    
--    1) SQL-99 이전 방식과 SQL-99 방식을 각각 사용하여 작성

--1-1 99 이전 방식
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
    FROM DEPT D, EMP E
    WHERE E.DEPTNO(+) = D.DEPTNO
    ORDER BY D.DEPTNO, E.ENAME;
    
--1-2 99 방식

SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
    FROM EMP E RIGHT OUTER JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
    ORDER BY D.DEPTNO, E.ENAME;
    
--4번 모든 부서 정보, 사원 정보, 급여 등급 정보, 각 사원의 직속상관 정보를 부서 번호, 사원 번호 순서로 정렬하여 출력
--    1) SQL-99 이전 방식과 SQL-99 방식을 각각 사용하여 작성

--1-1 99 이전 방식
SELECT D.DEPTNO, D.DNAME, 
       E1.EMPNO, E1.ENAME, E1.MGR, E1.SAL, E1.DEPTNO, 
       S.LOSAL, S.HISAL, S.GRADE, 
       E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
    FROM DEPT D, EMP E1, SALGRADE S, EMP E2
    WHERE E1.DEPTNO(+) = D.DEPTNO
        AND E1.SAL BETWEEN S.LOSAL(+) AND S.HISAL(+)
        AND E1.MGR = E2.EMPNO(+)
    ORDER BY D.DEPTNO, E1.EMPNO;
    
--1-2 99 방식
SELECT D.DEPTNO, D.DNAME,
       E1.EMPNO, E1.ENAME, E1.MGR, E1.SAL, E1.DEPTNO,
       S.LOSAL, S.HISAL, S.GRADE,
       E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
    FROM DEPT D LEFT OUTER JOIN EMP E1 ON (D.DEPTNO = E1.DEPTNO)
         LEFT OUTER JOIN SALGRADE S ON (E1.SAL BETWEEN S.LOSAL AND S.HISAL)
         LEFT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
    ORDER BY D.DEPTNO, E1.EMPNO;