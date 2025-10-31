## WHERE 절 과 연산자

### WHERE       // chap05-1
<pre>
  WHERE [조회할 행을 선별하는 조건식]

  EX) <code>SELECT * FROM EMP WHERE DEPTNO = 30;</code>
</pre>

### AND, OR     // chap05-2
<pre>
  AND : 여러 개의 조건 모두 만족해야 참
  OR : 여러 개의 조건 중 하나라도 만족하면 참
</pre>
##### AND 연산자의 결과
| 피연산자 | TRUE | FALSE |
| --------| ----- |------ |
| TRUE | true | false |
| FALSE | false | false |


##### OR 연산자의 결과
| 피연산자 | TRUE | FALSE |
| --------| ----- |------ |
| TRUE | true | true |
| FALSE | true | false |

### 여러 연산자

##### 비교 연산자
| 연산자 | 사용법 | 설명 |
| ----- | ------ | ----- |
| > | A > B | A값이 B값을 초과하면 TRUE 를 반환|
| >= | A >= B | A값이 B값 이상이면 TRUE 를 반환 |
| < | A < B | A값이 B값 미만이면 TRUE 를 반환 |
| <= | A <= B| A값이 B값 이하라면 TRUE 를 반환|

##### 등가 비교 연산자
| 연산자 | 사용법 | 의미 |
| ----- | ------ | ----- |
| = | A = B | A값이 B값이 같을 때 TRUE, 다를 때 FALSE를 반환|
| != | A != B | A값이 B값이 다를 때 TRUE, 같을 때 FALSE를 반환 |
| <> | A <> B | A값이 B값이 다를 때 TRUE, 같을 때 FALSE를 반환 |
| ^= | A ^= B| A값이 B값이 다를 때 TRUE, 같을 때 FALSE를 반환 |

##### IN 연산자
<pre>
  WHERE 열 이름 IN (데이터1, 데이터2, 데이터3..., 데이터 N)

  EX) <code>SELECT * FROM EMP WHERE JOB IN ('MANAGER', 'SALESMAN');</code>
</pre>

##### NOT 연산자
<pre>
    EX) <code>SELECT * FROM EMP WHERE NOT SAL = 3000;</code>
</pre>

##### BETWEEN A AND B 연산자
<pre>
  WHERE 열 이름 BETWEEN 최소값 AND 최대값;

  EX) <code>SELECT * FROM EMP WHERE SAL BETWEEN 2000 AND 3000;</code>
</pre>

##### LIKE 연산자, 와일드 카드
| 종류 | 설명 |
| ---- | ---- |
| _ | 어떤 값이든 상관없이 한 개의 문자열 데이터를 의미 |
| % | 길이와 상관없이(문자가 없는 경우도 포함) 모든 문자열 데이터를 의미 |

<pre>
  _ : 하나의 문자
  
  _자바 : 자바로 끝나는 문자(총 3글자)
  EX) 첫자바
  
  자바_ : 자바로 시작하는 문자(총 3글자)
  EX) 자바끝
  
  _자바_ : 자바라는 단어가 포함된 문자(총 4글자)
  EX) 첫자바끝
  
  % : 모든 문자(wild card)
  
  %자바 : 자바로 끝나는 문자(글자수 제한 없음)
  EX) 혼자 공부하는 자바
  
  자바% : 자바로 시작하는 문자(글자수 제한 없음)
  EX) 자바는 쉽다.
  
  %자바% : 자바라는 단어가 포함된 문자(글자수 제한 없음)
  EX) 오라클자바교육


  
  EX) <code>SELECT * FROM EMP WHERE ENAME LIKE '_L%';</code>
</pre>

##### IS NULL 연산자
<pre>
  IS NULL : NULL 인지 확인하는 연산자

  EX) <code>SELECT * FROM EMP WHERE COMM IS NULL</code>
</pre>

| 의미 | 예 |
| --- | --- |
| 값이 없음 | 통장을 개설한 적 없는 은행 고객의 계좌 번호 |
| 해당 사항 없음 | 미혼인 고객의 결혼기념일 |
| 노출할 수 없는 값 | 고객 비밀번호 찾기 같은 열람을 제한해야 하는 특정 개인 정보 |
| 확정되지 않은 값 | 미성년자의 출신 대학 |

##### and 연산자의 NULL 결과
| 피연산자 | TRUE | FALSE | NULL |
| --------| ----- |------ | ---- |
| TRUE | true | false | null |
| FALSE | false | false | false |
| NULL | null | false | null |


##### OR 연산자의 NULL 결과
| 피연산자 | TRUE | FALSE | NULL |
| --------| ----- |------ | ---- |
| TRUE | true | true | true |
| FALSE | true | false | null |
| NULL | true | null | null |


### 집합 연산자
| 종류 | 설명 |
| --- | --- |
| UNION | 연결된 SELECT 문의 결과를 합집합으로 묶고 중복은 제거 |
| UNION ALL | 연결된 SELECT 문의 결과를 합집합으로 묶고 중복 출력 |
| MINUS | 먼저 작성한 SELECT 문의 결과에서 다음 SELECT 문의 결과값을 차집합 처리 |
| INTERSECT | 먼저 작성한 SELECT 문의 결과와 다음 SELECT 문의 결과 중 교집합 처리 |
