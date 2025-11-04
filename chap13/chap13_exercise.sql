/*

    13-1 데이터 사전

*/


/*

    13-2 인덱스

*/


--실습 13-10 EMP 테이블의 SAL 열에 인덱스 생성하기

CREATE INDEX IDX_EMP_SAL
    ON EMP(SAL);
    
--실습 13-11 생성된 인덱스 살펴보기(USER_IND_COLUMNS 사용)

SELECT * FROM USER_IND_COLUMNS;

--실습 13-12 인덱스 삭제하기

DROP INDEX IDX_EMP_SAL;

--실습 13-13 삭제한 인덱스 확인하기

SELECT * FROM USER_IND_COLUMNS;


/*

    13-3 뷰

*/


--실습 13-15 뷰 생성하기

CREATE VIEW VW_EMP20
    AS (SELECT EMPNO, ENAME, JOB, DEPTNO
            FROM EMP
            WHERE DEPTNO = 20);
            
--실습 13-16 생성한 뷰 확인하기

SELECT *
    FROM USER_VIEWS;
    
--실습 13-17 생성한 뷰 조회하기

SELECT *
    FROM VW_EMP20;
    
--실습 13-18 뷰 삭제하기

DROP VIEW VW_EMP20;

--실습 13-19 USER_VIEWS 데이터 사전 조회하기


SELECT *
    FROM USER_VIEWS;
    
--실습 13-20 ROWNUM을 추가로 조회하기

SELECT ROWNUM, E.*
    FROM EMP E;
    
--실습 13-21 EMP 테이블을 SAL 열 기준으로 정렬하기

SELECT ROWNUM, E.*
    FROM EMP E
    ORDER BY SAL DESC;
    
--실습 13-22 인라인 뷰(서브쿼리 사용)

SELECT ROWNUM, E.*
    FROM (SELECT *
            FROM EMP E
            ORDER BY SAL DESC) E;
            
--실습 13-23 인라인 뷰(WITH 절 사용)

WITH E AS (SELECT * FROM EMP ORDER BY SAL DESC)
SELECT ROWNUM, E.*
    FROM E;
    
--실습 13-24 인라인 뷰로 TOP-N 추출하기(서브쿼리 사용)

SELECT ROWNUM, E.*
    FROM (SELECT *
            FROM EMP E
            ORDER BY SAL DESC) E
    WHERE ROWNUM <= 3;
    
--실습 13-25 인라인 뷰로 TOP-N 추출하기(WITH절 사용)

WITH E AS (SELECT * FROM EMP ORDER BY SAL DESC)
SELECT ROWNUM, E.*
    FROM E
    WHERE ROWNUM <= 3;
    
    
/*

    13-4 시퀀스

*/


--실습 13-27 DEPT 테이블을 사용하여 DEPT_SEQUENCE 테이블 생성하기

CREATE TABLE DEPT_SEQUENCE
    AS SELECT *
        FROM DEPT
        WHERE 1 <> 1;
        
SELECT * FROM DEPT_SEQUENCE;

--실습 13-28 시퀀스 생성하기

CREATE SEQUENCE SEQ_DEPT_SEQUENCE
    INCREMENT BY 10
    START WITH 10
    MAXVALUE 90
    MINVALUE 0
    NOCYCLE
    CACHE 2;
    
--실습 13-29 생성한 시퀀스 확인하기

SELECT *
    FROM USER_SEQUENCES;
    
--실습 13-30 시퀀스에서 생성한 순번을 사용한 INSERT문 실행하기

INSERT INTO DEPT_SEQUENCE(DEPTNO, DNAME, LOC)
    VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');
    
SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;

--실습 13-31 가장 마지막으로 생성된 시퀀스 확인하기

SELECT SEQ_DEPT_SEQUENCE.CURRVAL
    FROM DUAL;
    
--실습 13-32 시퀀스에서 생성한 순번을 반복 사용하여 INSERT문 실행하기

INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
    VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');
    
SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;

--실습 13-33 시퀀스 옵션 수정하기

ALTER SEQUENCE SEQ_DEPT_SEQUENCE
    INCREMENT BY 3
    MAXVALUE 99
    CYCLE;
    
--실습 13-34 옵션을 수정한 시퀀스 조회하기

SELECT *
    FROM USER_SEQUENCES;
    
--실습 13-35 수정한 시퀀스를 사용하여 INSERT문 실행하기

INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
    VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');
    
SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;

--실습 13-36 CYCLE 옵션을 사용한 시퀀스의 최댓값 도달 후 수행 결과 확인하기

INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
    VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');
    
SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;

--실습 13-37 시퀀스 삭제 후 확인하기

DROP SEQUENCE SEQ_DEPT_SEQUENCE;

SELECT * FROM USER_SEQUENCES;


/*

    13-5 동의어

*/


--실습 13-39 EMP 테이블의 동의어 생성하기

CREATE SYNONYM E
    FOR EMP;
    
--실습 13-40 테이블 전체 내용 조회하기

SELECT * FROM E;

--실습 13-41 동의어 삭제하기

DROP SYNONYM E;