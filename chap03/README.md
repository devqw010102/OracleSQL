### Oracle 21c 

<pre>
  Oracle 21c 설치 후 CMD에서 아래 입력

  결과가 Oracle Database 21c Express Edition Releases... 이면 성공
</pre>
<pre>
<code>sqlplus sys/oracle as sysdba</code>  
</pre>
### 계정 생성을 위한 옵션
<pre>
  앞서 실행한 CMD 창에서 아래 입력

  결과가 `세션이 변경되었습니다.` 이면 성공
</pre>
<pre>
<code>ALTER SESSION SET = "_oracle_script"=true;</code>  
</pre>

### SCOTT 계정 생성
<pre>
  계속해서 CMD 창에서 아래 입력

  결과가 `사용자가 생성되었습니다.`
        `권한이 부여되었습니다.` 이면 성공
</pre>
<pre>
<code>
  create user scott
  identified by tiger
  default tablespace users quota umlimited on users;

  grant create session, create table to scott;
</code>
</pre>

### SCOTT 계정으로 접속하기
<pre>
  결과가 `연결되었습니다.`
        `USER은 "SCOTT"입니다.` 이면 성공
</pre>
<pre>
  <code>
    conn scott/tiger

    show user
  </code>
</pre>

### 실습 데이터 생성 옵션 실행하기
<pre>
  결과가 `세션이 변경되었습니다.` 이면 성공
</pre>
<pre>
  <code>
    ALTER SESSION SET "_oracle_script"=true;

    ALTER SESSION SET nls_date_language='american';

    ALTER SESSION SET nls_date_format='dd-MON-rr';
  </code>
</pre>

### 실습 데이터, 테이블 생성하기
<pre>
  doitoracle_scott.sql 다운받기
</pre>
<pre>
  <code>
    @파일경로\doitoracle_scott.sql
    ex) @C:\dotioracle_scott.sql
  </code>
</pre>

### 실습 데이터 확인하기
<pre>
  <code>
    desc emp;

    desc dept;
    
    desc salgrade;
  </code>
</pre>
