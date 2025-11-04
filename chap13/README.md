## 객체

### 데이터 사전

#### 데이터 사전이란
<pre>
  데이터베이스를 구성하고 운영하는 데 필요한 모든 정보를 저장하는 특수한 테이블을 뜻함

  데이터 사전 정보에 직접 접근, 작업은 허용하지 않음.
  대신 테이터 사전 뷰(Data Dictionary View)를 제공함
</pre>
###### 데이터 사전 뷰 접두어
| 접두어 | 설명 |
| ----- | ---- |
| USER_XXXX | 현재 데이터베이스에 접속한 사용자가 소유한 객체 정보 |
| ALL_XXXX | 현재 데이터베이스에 접속한 사용자가 소유한 객체 또는 다른 사용자가 소유한 객체 중 사용 허가를 받은 객체, 즉 사용할 수 있는 모든 객체 정보 |
| DBA_XXXX | 데이터베이스 관리를 위한 정보(SYSTEM, SYS 사용자만 열람 가능) |
| V$_XXXX | 데이터베이스 성능 관련 정보 |

### 인덱스

#### 인덱스란
<pre>
  데이터 검색 성능 향상을 위해 테이블 열에 사용하는 객체
</pre>
###### 인덱스의 종류
| 방식 | 설명 |
| --- | ----- |
| 일반 인덱스(Normal Indexes) | 오라클 데이터베이스의 기본 인덱스인 B-Tree 인덱스 |
| 비트맵 인덱스(Bitmap Indexes) | 키(Key)와 관련한 rowid를 비트맵으로 저장한 인덱스 |
| 분할 인덱스(Partitioned Indexes) | 테이블 내 인덱스 처리된 열의 값 항목을 파티션으로 구성하는 인덱스 |
| 함수 기반 인덱스(Function-based Indexes) | 특정 표현식을 기반으로 반환된 값에 따라 구성하는 인덱스, 오라클 기본 함수나 사용자 정의 함수를 사용할 수 있음 |
| 도메인 인덱스(Domain Indexes) | 인덱스 유형과 애플리케이션별로 구성되는 인덱스 |

### 뷰

#### 뷰란
<pre>
  가상 테이블이라 부름, 하나 이상의 테이블을 조회하는 SELECT 문을 저장한 객체를 뜻함

  1) CREATE VIEW 뷰이름() -- 뷰 생성
  2) FROM 절에 SELECT - 서브쿼리 - 뷰
        SELECT * FROM ( SELECT * FROM EMP)
</pre>

#### 뷰의 사용 목적
<pre>
  1. 편리성 : SELECT 문의 복잡를 완화 할 수 있음
  2. 보안성 : 테이블의 특정 열을 노출하고 싶지 않을 때 사용
</pre>

#### 뷰 생성
<pre>
  <code>
    CREATE [OR REPLACE] [FORCE | MPFPRCE] VIEW 뷰 이름(열 이름1, 열 이름2, ...)
      AS (저장할 SELECT 문)
    [WITH CHECK OPTION [CONSTRAINT 제약 조건]]
    [WIDTH READ ONLY [CONSTRAINT 제약 조건]];
  </code>
</pre>
| 요소 | 설명 |
| ---- | ---- |
| OR REPLACE | 이름이 같은 뷰가 이미 있다면 현재 생성할 뷰로 대체하여 생성(선택) |
| FORCE | 뷰가 저장할 SELECT문 기반 테이블이 없어도 강제로 생성(선택) |
| NOFORCE | 뷰가 저장할 SELECT문 기반 테이블이 있을 때만 생성(기본값)(선택) |
| 뷰 이름 | 생성할 뷰 이름을 지정(필수) |
| 열 이름 | SELECT문에 지정한 이름 대신 사용할 열 이름을 지정(선택) |
| 저장할 SELECT 문 | 생성할 뷰에 저장할 SELECT문을 지정(필수) |
| WITH CHECK OPTION | 지정한 제약 조건을 만족하는 데이터에 한해 DML 작업을 할 수 있는 뷰를 생성 |
| WITH READ ONLY | 뷰의 열람, 즉 SELECT만 할 수 있는 뷰를 생성 |


### 시퀀스

#### 시퀀스란
<pre>
  오라클 데이터베이스에서 특정 규칙에 따른 연속 숫자를 생성하는 객체
</pre>

#### 시퀀스 생성
<pre>
  <code>
    CREATE SEQUENCE 시퀀스 이름        -- 1
    [INCREMENT BY n]                  -- 2
    [START WITDH n]                   -- 3
    [MAXVALUE n | NOMAXVALUE]         -- 4
    [MINVALUE n | NOMINVALUE]         -- 5
    [CYCLE | NOCYCLE]                 -- 6
    [CACHE n | NOCACHE]               -- 7
  </code>
</pre>
| 번호 | 설명 |
| :----: | -----|
| 1 | 생성할 시퀀스 이름을 지정(2 ~ 7 지정하지 않으면 1부터 시작하여 1만크 계속 증가하는 시퀀스 생성)(필수) |
| 2 | 시퀀스에서 생성할 번호의 증갓값(기본값은 1)(선택) |
| 3 | 시퀀스에서 생성할 번호의 시작값(기본값은 1)(선택) |
| 4 | 시퀀스에서 생성할 번호의 최대값 지정, START WITH 이상, MINVALUE 초과값으로 지정 (선택) |
| 5 | 시퀀스에서 생성할 번호의 최소값 지정, START WITH 이하, MAXVALUE 미만값으로 지정 (선택) |
| 6 | 시퀀스에서 생성한 번호가 최댓값에 도달했을 때 CYCLE 이면 START WITH에서 다시 시작, NOCYCLE이면 번호 생성을 중단하고 추가 번호 생성을 요청하면 오류 발생(선택) |
| 7 | 시퀀스가 생성할 번호를 메모리에 미리 할당해 놓을 개수를 지정, NOCACHE는 미리 생성하지 않도록 설정, 기본값은 20(선택) |
