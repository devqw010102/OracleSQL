/*

    11-1 트랜잭션

*/

/*

    11-2 트랜잭션 제어

*/

--실습 11-1 DEPT 테이블을 복사해서 DEPT_TCL 테이블 만들기

CREATE TABLE DEPT_TCL
    AS SELECT * 
    FROM DEPT;
    
SELECT * FROM DEPT_TCL;

--실습 11-2 DEPT_TCL 테이블에 데이터를 입력, 수정, 삭제하기

INSERT INTO DEPT_TCL
    VALUES(50, 'DATABASE', 'SEOUL');
    
UPDATE DEPT_TCL
    SET LOC = 'BUSAN'
    WHERE DEPTNO = 40;

DELETE FROM DEPT_TCL 
    WHERE DNAME = 'RESEARCH';

SELECT * FROM DEPT_TCL;

--실습 11-3 ROLLBACK으로 명령어 실행 취소하기

ROLLBACK;

SELECT * FROM DEPT_TCL;

--실습 11-4 DEPT_TCL 테이블에 데이터를 입력, 수정, 삭제하기

INSERT INTO DEPT_TCL
    VALUES(50, 'NETWORK', 'SEOUL');
    
UPDATE DEPT_TCL
    SET LOC = 'BUSAN'
    WHERE DEPTNO = 20;

DELETE FROM DEPT_TCL
    WHERE DEPTNO = 40;
    
SELECT * FROM DEPT_TCL;

--실습 11-5 COMMIT으로 명령어 반영하기

COMMIT;

SELECT * FROM DEPT_TCL;

ROLLBACK;

SELECT * FROM DEPT_TCL;


/*

    11-3 세션

*/

--실습 11-6 SQL DEVELOPER 와 SQL PLUS 로 세션 알아보기

SELECT * FROM DEPT_TCL;

--실습 11-7 SQL DEVELOPER 와 SQL PLUS 로 세션 알아보기

DELETE FROM DEPT_TCL
    WHERE DEPTNO = 50;
    
SELECT * FROM DEPT_TCL;

--실습 11-8 SQL DEVELOPER 와 SQL PLUS 로 세션 알아보기

COMMIT;

SELECT * FROM DEPT_TCL;


/*

    11-4 LOCK

*/


--실습 11-9 SQL DEVELOPER 와 SQL PLUS 로 LOCK 알아보기

SELECT * FROM DEPT_TCL;

--실습 11-10 SQL DEVELOPER 와 SQL PLUS 로 LOCK 알아보기

UPDATE DEPT_TCL
    SET LOC = 'SEOUL'
    WHERE DEPTNO = 30;
    
SELECT * FROM DEPT_TCL;

--실습 11-12 SQL DEVELOPER 와 SQL PLUS 로 LOCK 알아보기

COMMIT;

--실습 11-13 SQL DEVELOPER 와 SQL PLUS 로 LOCK 알아보기

SELECT * FROM DEPT_TCL;

--실습 11-15 SQL DEVELOPER 와 SQL PLUS 로 LOCK 알아보기

SELECT * FROM DEPT_TCL;

