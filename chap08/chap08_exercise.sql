/*

    8-1 조인

*/

--실습 8-1 FROM 절에 여러 테이블 지정하기

SELECT *
    FROM EMP, DEPT
    ORDER BY EMPNO;
    
--실습 8-2 열 이름을 비교하는 조건식으로 조인하기

SELECT *
    FROM EMP, DEPT
    WHERE EMP.DEPTNO = DEPT.DEPTNO
    ORDER BY EMPNO;
    
--실습 8-3 테이블 이름을 별칭으로 표현하기

SELECT *
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    ORDER BY EMPNO;
  
    
/*

    8-2 조인 종류

*/
    
    
--실습 8-4 두 테이블의 부서 번호가 똑같은 열 이름일 때

SELECT EMPNO, ENAME, DEPTNO, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO;
    
--실습 8-5 열 이름에 각각의 테이블 이름도 함께 명시할 때

SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    ORDER BY D.DEPTNO, E.EMPNO;
    
--실습 8-6 WHERE 절에 추가로 조건식 넣어 출력하기

SELECT E.EMPNO, E.ENAME, E.SAL, D.DEPTNO, D.DNAME, D.LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
        AND SAL >= 3000;
        
--실습 8-7 급여 범위를 지정하는 조건식으로 조인하기

SELECT *
    FROM EMP E, SALGRADE S
    WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;
    
--실습 8-8 같은 테이블을 두번 사용하여 자체 조인하기

SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
    FROM EMP E1, EMP E2
    WHERE E1.MGR = E2.EMPNO;
    
--실습 8-9 왼쪽 외부 조인 사용하기

SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
    FROM EMP E1, EMP E2
    WHERE E1.MGR = E2.EMPNO(+)
    ORDER BY E1.EMPNO;
    
--실습 8-10 오른쪽 외부 조인 사용하기

SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
    FROM EMP E1, EMP E2
    WHERE E1.MGR(+) = E2.EMPNO
    ORDER BY E1.EMPNO;
    

/*

    8-3 표준 SQL 문법으로 배우는 JOIN

*/
    
    
    
--실습 8-11 NATURAL JOIN을 사용하여 조인하기

SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
       DEPTNO, D.DNAME, D.LOC
    FROM EMP E NATURAL JOIN DEPT D
    ORDER BY DEPTNO, E.EMPNO;

--실습 8-12 JOIN ~ USING을 사용하여 조인하기

SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
       DEPTNO, D.DNAME, D.LOC
    FROM EMP E JOIN DEPT D USING (DEPTNO)
    WHERE SAL >= 3000
    ORDER BY DEPTNO, E.EMPNO;
    
--실습 8-13 JOIN ~ ON으로 등가 조인하기

SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
       E.DEPTNO,
       D.DNAME, D.LOC
    FROM EMP E JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
    WHERE SAL <= 3000
    ORDER BY E.DEPTNO, EMPNO;
    
--실습 8-14 왼쪽 외부 조인을 표준 SQL로 작성하기

SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
    FROM EMP E1 LEFT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
    ORDER BY E1.EMPNO;

--실습 8-15 오른쪽 외부 조인을 표준 SQL로 작성하기

SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
    FROM EMP E1 RIGHT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
    ORDER BY E1.EMPNO, MGR_EMPNO;
    
--실습 8-16 전체 외부 조인을 표준 SQL로 작성하기

SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
    FROM EMP E1 FULL OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
    ORDER BY E1.EMPNO;