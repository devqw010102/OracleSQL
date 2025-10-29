--되새김 문제
-- P 311

--1번    EMP_HW 테이블 만들기
-- COLUMN_NAME TYPE [기본값 또는 제약조건]

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

--2번    EMP_HW 테이블에 BIGO 열 추가
--(한번 CREATE TABLE 한 테이블의 추가 변경사항은 CREATE TABLE로 할 수 없음)
--(CREATE TABLE 한 테이블의 추가 변경사항은 ALTER TABLE 로 변경할 수 있음)

ALTER TABLE EMP_HW
    ADD BIGO VARCHAR(20);
    
--3번    EMP_HW 테이블에 BIGO 열 크기를 30으로 변경

ALTER TABLE EMP_HW
    MODIFY BIGO VARCHAR(30);
    
--4번    EMP_HW 테이블의 BIGO 열 이름을 REMARK 로 변경

ALTER TABLE EMP_HW
    RENAME COLUMN BIGO TO REMARK;

--5번    EMP_HW 테이블에 EMP 테이블의 데이터를 모두 저장하기, REMARK 열은 NULL로 삽입

INSERT INTO EMP_HW
    SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, NULL
    FROM EMP;
    
--INSERT INTO EMP_HW
--    (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, REMARK)
--    SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, NULL
--    FROM EMP;

--6번    EMP_HW 테이블을 삭제

DROP TABLE EMP_HW;

--되새김 문제 테이블 확인
SELECT * FROM EMP_HW;
DESC EMP_HW;

