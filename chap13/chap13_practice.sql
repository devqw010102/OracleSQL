--되새김 문제
-- P 347

--1번 조건에 맞게 작성
--    1-1 EMP 테이블과 같은 구조의 데이터를 저장하는 EMPIDX 테이블 만들기

CREATE TABLE EMPIDX
    AS SELECT * FROM EMP;
    
--    1-2 EMPIDX 테이블의 EMPNO 열에 IDX_EMPIDX_EMPNO 인덱스 만들기

CREATE INDEX IDX_EMPIDX_EMPNO
    ON EMPIDX(EMPNO);
    
--    1-3 데이터 사전 뷰로 확인

SELECT * 
    FROM USER_IND_COLUMNS
    WHERE INDEX_NAME = 'IDX_EMPIDX_EMPNO';
