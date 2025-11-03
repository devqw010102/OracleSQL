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

##### 다중행 연산자
| 다중행 연산자 | 설명 |
| :---: | --- |
| IN | 메인쿼리의 데이터가 서브쿼리의 결과 중 하나라도 일치한 데이터가 있다면 TRUE를 반환 |
| ANY, SOME | 메인쿼리의 조건식을 만족하는 서브쿼리의 결과가 하나 이상이면 TRUE를 반환 |
| ALL | 메인쿼리의 조건식을 서브쿼리의 결과가 모두 만족하면 TRUE를 반환 |
| EXISTS | 서브쿼리의 결과가 있다면(즉, 행이 1개 이상이라면) TRUE를 반환 |


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
