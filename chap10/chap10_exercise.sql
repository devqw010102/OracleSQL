/*

    10-1 INSERT

*/

--실습 10-1 DEPT 테이블을 복사해서 DEPT_TEMP 테이블 만들기

CREATE TABLE DEPT_TEMP
    AS SELECT * FROM DEPT;
    
--실습 10-2 DEPT_TEMP 테이블 전체 열 조회하기

SELECT * FROM DEPT_TEMP;

--실습 10-3 DEPT_TEMP 테이블에 데이터 추가하기

INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
                VALUES (50, 'DATABASE', 'SEOUL');
                
SELECT * FROM DEPT_TEMP;

--실습 10-4 INSERT문에 열을 지정하지 않고 데이터 추가하기

INSERT INTO DEPT_TEMP
        VALUES (60, 'NETWORK', 'BUSAN');
        
SELECT * FROM DEPT_TEMP;

--실습 10-5 NULL을 지정하여 입력하기

INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
                VALUES(70, 'WEB', NULL);
                
SELECT * FROM DEPT_TEMP;

--실습 10-6 빈 공백 문자열로 NULL 입력하기

INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
                VALUES(80, 'MOBILE', '');
                
SELECT * FROM DEPT_TEMP;

--실습 10-7 열 데이터를 넣지 않는 방식으로 NULL 데이터 입력하기

INSERT INTO DEPT_TEMP (DEPTNO, LOC)
                VALUES(90, 'INCHEON');
                
SELECT * FROM DEPT_TEMP;

--실습 10-8 EMP 테이블을 복사해서 EMP_TEMP 테이블 만들기

CREATE TABLE EMP_TEMP
        AS SELECT *
            FROM EMP
            WHERE 1 <> 1;
            
SELECT * FROM EMP_TEMP;

--실습 10-9 INSERT 문으로 날짜 데이터 입력하기(날짜 사이에 / 입력)

INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
            VALUES (9999, '홍길동', 'PRESIDENT', NULL, '2001/01/01', 5000, 1000, 10);
            
SELECT * FROM EMP_TEMP;

--실습 10-10 INSERT 문으로 날짜 데이터 입력하기(날짜 사이에 - 입력)

INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
            VALUES (1111, '성춘향', 'MANAGER', 9999, '2001-01-05', 4000, NULL, 20);
            
SELECT * FROM EMP_TEMP;

--실습 10-11 날짜 데이터 형식을 반대로 했을 때

INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
                VALUES(2111, '이순신', 'MANAGER', 9999, '07/01/2001', 4000, NULL, 20);
                
--실습 10-12 TO_DATE 함수를 사용하여 날짜 데이터 입력하기

INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
            VALUES (2111, '이순신', 'MANAGER', 9999, TO_DATE('07/01/2001', 'DD/MM/YYYY'), 4000, NULL, 20);
            
SELECT * FROM EMP_TEMP;

--실습 10-13 SYSDATE를 사용하여 날짜 데이터 입력하기

INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
            VALUES (3111, '심청이', 'MANAGER', 9999, SYSDATE, 4000, NULL, 30);
            
SELECT * FROM EMP_TEMP;

--실습 10-14 서브쿼리로 여러 데이터 추가하기

INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO
        FROM EMP E, SALGRADE S
        WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
            AND S.GRADE = 1;
            
SELECT * FROM EMP_TEMP;


/*

    10-2 UPDATE

*/


--실습 10-15 DEPT 테이블을 복사해서 DEPT_TEMP2 테이블 만들기

CREATE TABLE DEPT_TEMP2
    AS SELECT * FROM DEPT;
    
SELECT * FROM DEPT_TEMP2;

--실습 10-16 DEPT_TEMP2 테이블 업데이트하기

UPDATE DEPT_TEMP2
    SET LOC = 'SEOUL';

SELECT * FROM DEPT_TEMP2;

--실습 10-17 ROLLBACK 으로 테이블 내용을 이전 상태로 되돌리기

ROLLBACK;

--실습 10-18 테이블 데이터 일부만 수정하기

UPDATE DEPT_TEMP2
    SET DNAME = 'DATABASE',
        LOC = 'SEOUL'
    WHERE DEPTNO = 40;
    
SELECT * FROM DEPT_TEMP2;

--실습 10-19 서브쿼리로 데이터 한번에 수정하기

UPDATE DEPT_TEMP2
    SET (DNAME, LOC) = (SELECT DNAME, LOC
                            FROM DEPT
                            WHERE DEPTNO = 40)
    WHERE DEPTNO = 40;
    
SELECT * FROM DEPT_TEMP2;

--실습 10-20 서브쿼리로 데이터 일부 수정하기

UPDATE DEPT_TEMP2
    SET DNAME = (SELECT DNAME
                    FROM DEPT
                    WHERE DEPTNO = 40),
        LOC = (SELECT LOC
                    FROM DEPT
                    WHERE DEPTNO = 40)
    WHERE DEPTNO = 40;
    
--실습 10-21 UPDATE 문의 WHERE 절에 서브쿼리 사용하기

UPDATE DEPT_TEMP2
    SET LOC = 'SEOUL'
    WHERE DEPTNO = (SELECT DEPTNO
                        FROM DEPT_TEMP2
                        WHERE DNAME = 'OPERATIONS');
                        
SELECT * FROM DEPT_TEMP2;


/*

    10-3 DELETE

*/
-- DELETE TRUNCATE DROP : P 309



--실습 10-22 EMP 테이블을 복사해서 EMP_TEMP2 테이블 만들기

CREATE TABLE EMP_TEMP2
    AS SELECT * FROM EMP;
    
SELECT * FROM EMP_TEMP2;

--실습 10-23 WHERE 절을 사용하여 데이터 일부만 삭제하기

DELETE FROM EMP_TEMP2
    WHERE JOB = 'MANAGER';
    
SELECT * FROM EMP_TEMP2;

--실습 10-24 WHERE 절에 서브쿼리를 사용하여 데이터 일부만 삭제하기

DELETE FROM EMP_TEMP2
    WHERE EMPNO IN (SELECT E.EMPNO
                        FROM EMP_TEMP2 E, SALGRADE S
                        WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
                            AND S.GRADE = 3
                            AND DEPTNO = 30);
                            
SELECT * FROM EMP_TEMP2;

--실습 10-25 테이블에 있는 전체 데이터 삭제하기

DELETE FROM EMP_TEMP2;

SELECT * FROM EMP_TEMP2;