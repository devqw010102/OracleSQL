## 테이블 조회

<pre>
  Selection : 행 단위로 조회
  Projection : 열 단위로 조회
  Join : 두 개 이상의 테이블을 사용하여 조회
</pre>

### SELECT, FROM    // chap04-3
<pre>
  SELECT [조회할 열 1 이름], [열2 이름], ... [열 N 이름]
  
  FROM [조회할 테이블 이름]
  
  EX) <code>SELECT * FROM EMP;</code>
</pre>

### DISTINCT      // chap04-4
<pre>
  DISTINCT : 열 중복 제거하기

  EX) <code>SELECT DISTINCT DEPTNO FROM EMP;</code>
</pre>

### AS          // chap04-5
<pre>
  AS : 열 별칭 설정하기

  EX) <code>SELECT ENAME, SAL, SAL*12 + COOMM AS ANNSAL, COMM FROM EMP</code>
</pre>

### ORDER BY    // chap04-6
<pre>
  ORDER BY [정렬하려는 열 이름] [정렬 옵션]

    정렬 옵션 
    1. DESC : 내림차순
    2. ASC : 기본, 오름차순
  
  EX) <code>SELECT * FROM EMP ORDER BY SAL;</code>
</pre>
