## 객체

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
