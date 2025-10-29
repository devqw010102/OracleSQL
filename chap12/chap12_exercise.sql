--실습 12-1   모든 열의 자료형을 정의해서 테이블 생성하기

Create Table emp_ddl (
    empno Number(4),
    Ename VARCHAR(10),
    job VARCHAR(9),
    mgr NUMBER(4),
    hiredate DATE,
    sal NUMBER(7, 2),
    comm NUMBER(7, 2),
    deptno NUMBER(2)
);

desc emp_ddl;

--실습 12-2   다른 테이블을 복사하여 테이블 생성하기

CREATE TABLE DEPT_DDL  
    AS SELECT * FROM DEPT;
    
DESC DEPT_DDL;

--실습 12-3   DEPT_DDL 테이블 전체 조회하기

SELECT * FROM DEPT_DDL;

--실습 12-4   다른 테이블 일부를 복사하여 테이블 생성하기

CREATE TABLE EMP_DDL_30
    AS SELECT * FROM EMP
        WHERE DEPTNO = 30;
    
SELECT * FROM EMP_DDL_30;

--실습 12-5   다른 테이블을 복사하여 테이블 생성하기

CREATE TABLE EMPDEPT_DDL
    AS SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE,
              E.SAL, E.COMM, D.DEPTNO, D.DNAME, D.LOC
        FROM EMP E, DEPT D
        WHERE 1 <> 1;
        
SELECT * FROM EMPDEPT_DDL;

--실습 12-6   EMP 테이블을 복사하여 EMP_ALTER 테이블 생성하기

CREATE TABLE EMP_ALTER
    AS SELECT * FROM EMP;
    
SELECT * FROM EMP_ALTER;

--실습 12-7   ALTER 명령어로 HP 열 추가하기

ALTER TABLE EMP_ALTER
    ADD HP VARCHAR(20);
    
SELECT * FROM EMP_ALTER;

--실습 12-8   ALTER 명령어로 HP 열 이름을 TEL로 변경하기

ALTER TABLE EMP_ALTER
    RENAME COLUMN HP TO TEL;
    
SELECT * FROM EMP_ALTER;

--실습 12-9   ALTER 명령어로 EMPNO 열 길이 변경하기

ALTER TABLE EMP_ALTER
MODIFY EMPNO NUMBER(5);

DESC EMP_ALTER;

--실습 12-10  ALTER 명령어로 TEL 열 삭제하기

ALTER TABLE EMP_ALTER
DROP COLUMN TEL;

SELECT * FROM EMP_ALTER;

--실습 12-11  테이블 이름 변경하기

RENAME EMP_ALTER TO EMP_RENAME;

--실습 12-12  바꾸기 전 이름으로 테이블 구성 살펴보기

DESC EMP_ALTER;

--실습 12-13  변경된 테이블 이름(EMP_RENAME)으로 조회하기

SELECT * FROM EMP_RENAME;

--실습 12-14    EMP_RENAME 테이블의 전체 데이터 삭제하기

TRUNCATE TABLE EMP_RENAME;

SELECT * FROM EMP_RENAME;

--실습 12-15    EMP_RENAME 테이블 삭제하기

DROP TABLE EMP_RENAME;

--실습 12-16    EMP_RENAME 테이블 구성 살펴보기

DESC EMP_RENAME;

--되새김 문제

--1번

CREATE TABLE EMP_HW (
    EMPNO NUMBER(4),
    ENAME VARCHAR(10),
    JOB VARCHAR(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7, 2),
    COMM NUMBER(7, 2),
    DEPTNO NUMBER(2)
);

--2번

ALTER TABLE EMP_HW
    ADD BIGO VARCHAR(20);
    
--3번

ALTER TABLE EMP_HW
    MODIFY BIGO VARCHAR(30);
    
--4번

ALTER TABLE EMP_HW
    RENAME COLUMN BIGO TO REMARK;

--5번

INSERT INTO EMP_HW
    SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, NULL
    FROM EMP;

--6번

DROP TABLE EMP_HW;

--되새김 문제 확인
SELECT * FROM EMP_HW;
DESC EMP_HW;

