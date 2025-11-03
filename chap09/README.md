## 서브쿼리

### 서브쿼리란
<pre>
  SQL 구문을 실행하는 데 필요한 데이터를 추가로 조회하고자 SQL 구문 내부에서 사용하는 SELECT 문을 의미함
</pre>

#### 1. WHERE 절에 SELECT  - 단일행, 다중행
<pre>
  <code>
    SELECT *
    FROM 테이블명
    WHERE 조건식 = (SELECT * FROM 테이블명...)
  </code>
</pre>

#### 2. SELECT 절에 SELECT  - SCALA SUBQUERY
<pre>
  <code>
    SELECT (SELECT * FROM 테이블명) AS 별명
    FROM 테이블명
  </code>
</pre>

#### 3. FROM 절에 SELECT    - 뷰
<pre>
  <code>
    SELECT *
    FROM (SELECT * FROM 테이블[가상테이블 = 뷰])
  </code>
</pre>
