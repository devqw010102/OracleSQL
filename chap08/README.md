## 여러 테이블을 하나처럼 사용하는 조인

### 조인이란
<pre>
  조인(JOIN) : 2개 이상의 테이블을 연결하여 하나의 테이블처럼 출력
</pre>

#### 테이블 별칭 지정
<pre>
  <code>
    FROM 테이블 이름1 별칭1, 테이블 이름2 별칭2...
  </code>
</pre>

### 등가 조인
<pre>
  테이블을 연결한 후에 각 테이블의 특정 열과 <b>일치하는</b> 데이터를 기준으로 출력 행을 선정하는 방식
    = 내부 조인(INNER JOIN), 단순 조인(SIMPLE JOIN)
</pre>

### 비등가 조인
<pre>
  등가 조인 외의 방식을 의미
</pre>

### 자체 조인
<pre>
  하나의 테이블을 여러 개의 테이블처럼 활용하여 조인하는 방식을 의미
    = SELF JOIN
</pre>

### 외부 조인
<pre>
  두 테이블 간 조인 수행에서 조인 기준 열의 한쪽이 NULL이어도 강제로 출력하는 방식을 의미함
    = OUTER JOIN
</pre>

###### 오라클에서의 외부 조인
| 외부 조인 | 사용법 |
| ---- | ---- |
| 왼쪽 외부 조인(LEFT OUTER JOIN) | WHERE TABLE1.COL1 = TABLE2.COL1(+) |
| 오른쪽 외부 조인(RIGHT OUTER JOIN) | WHERE TABLE1.COL1(+) = TABLE2.COL1 |


### 표준 SQL 문법

##### NATURAL JOIN
<pre>
  등가 조인을 대신해 사용할 수 있는 조인 방식, 
  조인 대상인 두 테이블에서 이름과 자료형이 같은 열을 찾은 후 그 열을 기분으로 등가 조인을 하는 방식
</pre>
##### JOIN ~ USING
<pre>
  등가 조인을 대신하는 방식, USING 키워드로 조인 기준으로 사용할 열 지정
</pre>
<pre>
  <code>
    FROM TABLE1 JOIN TABLE2 USING (조인에 사용할 기준 열)
  </code>
</pre>
##### JOIN ~ ON
<pre>
  WHERE절에 있는 조인 조건식을 ON 키워드 옆에 작성,
  조인 기준 조건식은 ON에 명시함
</pre>
<pre>
  <code>
    FROM TABLE1 JOIN TABLE2 ON (조인 조건식)
  </code>
</pre>
##### OUTER JOIN
| 조인명 | 버전 | 사용법 |
| ------ | :---: | ----- |
| 왼쪽 외부 조인 | 기존 | WHERE TABLE1.COL1 = TABLE2.COL1(+) |
| = LEFT OUTER JOIN | SQL-99 | FROM TABLE1 LEFT OUTER JOIN TABLE2 ON(조인 조건식) |
| 오른쪽 외부 조인 | 기준 | WHERE TABLE1.COL1(+) = TABLE2.COL1 |
| = RIGHT OUTER JOIN | SQL-99 | FROM TABLE1 RIGHT OUTER JOIN TABLE2 ON(조인 조건식) |
| 전체 외부 조인 | 기준 | 기본 문법은 없음(UNION 집합 연산자를 활용) |
| FULL OUTER JOIN | SQL-99 | FROM TABLE1 FULL OUTER JOIN TABLE2 ON(조인 조건식) |

