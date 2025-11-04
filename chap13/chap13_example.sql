CREATE TABLE BOARD (
    BOARD_ID     NUMBER(10)      CONSTRAINT PK_BOARD PRIMARY KEY,  -- 게시글 번호 (기본키)
    TITLE        VARCHAR2(200)   NOT NULL,                         -- 제목
    CONTENT      CLOB            NOT NULL,                         -- 내용 (긴 텍스트)
    WRITER       VARCHAR2(50)    NOT NULL,                         -- 작성자
    HIT          NUMBER(6)       DEFAULT 0,                        -- 조회수
    CREATED_AT   DATE            DEFAULT SYSDATE,                  -- 작성일
    UPDATED_AT   DATE,                                              -- 수정일
    DELETE_YN    CHAR(1)         DEFAULT 'N' CHECK (DELETE_YN IN ('Y','N')) -- 삭제여부
);


-- 시퀀스 생성
CREATE SEQUENCE SEQ_BOARD
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

INSERT INTO BOARD (BOARD_ID, TITLE, CONTENT, WRITER)
VALUES (SEQ_BOARD.NEXTVAL, '첫 번째 게시글', '안녕하세요! 게시판 테스트입니다.', '관리자');

INSERT INTO BOARD (BOARD_ID, TITLE, CONTENT, WRITER)
VALUES (SEQ_BOARD.NEXTVAL, '두 번째 게시글', 'ROWNUM 페이징 연습용 데이터입니다.', '홍길동');


COMMIT;

SELECT *
FROM (
  SELECT B_INNER.*, ROWNUM AS RNUM
  FROM (
            SELECT
            BOARD_ID, TITLE, WRITER, HIT, CREATED_AT, UPDATED_AT
            FROM BOARD
            WHERE DELETE_YN = 'N'
            ORDER BY BOARD_ID DESC                       -- 정렬은 가장 안쪽에서
         ) B_INNER
);


DELETE BOARD
    WHERE BOARD_ID = 20;