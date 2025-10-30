/*

    5-1 WHERE 

*/


--실습 5-1 EMP 테이블의 모든 열 출력

SELECT *
    FROM EMP;
    
--실습 5-2 부서 번호가 30인 데이터만 출력하기

SELECT *
    FROM EMP
    WHERE DEPTNO = 30;
    
    
/*

    5-2 AND, OR

*/



--실습 5-3 AND 연산자로 여러 개 조건식 사용하기

SELECT *    
    FROM EMP
    WHERE DEPTNO = 30
        AND JOB = 'SALESMAN';
        
--실습 5-4 OR 연산자로 여러 개의 출력 조건 사용하기

SELECT *
    FROM EMP
    WHERE DEPTNO = 30
        OR JOB = 'CLERK';
        
        
/*

    5-3 연산자

*/        


--실습 5-5 곱셈 산술 연사자를 사용한 예

SELECT *
    FROM EMP
    WHERE SAL*12 = 36000;
    
--실습 5-6 대소 비교 연산자를 사용하여 출력하기

SELECT *
    FROM EMP
    WHERE SAL >= 3000;
    
--실습 5-7 문자를 대소 비교 연산자로 비교하기(비교 문자열이 문자 하나일 때)

SELECT *
    FROM EMP
    WHERE ENAME >= 'F';
    
--실습 5-8 문자열을 대소 비교 연산자로 비교하기(비교 문자열이 문자 여러 개일 때)

SELECT *
    FROM EMP
    WHERE ENAME <= 'FORZ';
    
--실습 5-9 등가 비교 연산자를 사용하여 출력하기

SELECT *    
    FROM EMP
    WHERE SAL != 3000;
    
--실습 5-10 등가 비교 연산자를 사용하여 출력하기

SELECT *
    FROM EMP
    WHERE SAL <> 3000;
    
--실습 5-11 등가 비교 연산자를 사용하여 출력하기

SELECT *
    FROM EMP
    WHERE SAL ^= 3000;
    
--실습 5-12 NOT 연산자를 사용하여 출력하기

SELECT *
    FROM EMP
    WHERE NOT SAL = 3000;
    
--실습 5-13 OR 연산자를 사용하여 여러 조건을 만족하는 데이터 출력하기

SELECT *
    FROM EMP
    WHERE JOB = 'MANAGER'
        OR JOB = 'SALESMAN'
        OR JOB = 'CLERK';
        
--실습 5-14 IN 연산자를 사용하여 출력하기

SELECT *
    FROM EMP
    WHERE JOB IN('MANAGER', 'SALESMAN', 'CLERK');
    
--실습 5-15 등가 비교 연산자와 AND 연산자를 사용하여 출력하기

SELECT *
    FROM EMP
    WHERE JOB != 'MANAGER'
        AND JOB <> 'SALESMAN'
        AND JOB ^= 'CLERK';
        
--실습 5-16 IN 연산자와 논리 부정 연산자를 사용하여 출력하기

SELECT *    
    FROM EMP
    WHERE JOB NOT IN('MANAGER', 'SALESMAN', 'CLERK');
    
--실습 5-17 대소 비교 연산자와 AND 연산자를 사용하여 출력하기

SELECT *
    FROM EMP
    WHERE SAL >= 2000
        AND SAL <= 3000;
        
--실습 5-18 BETWEEN A AND B 연산자를 사용하여 출력하기

SELECT *
    FROM EMP
    WHERE SAL BETWEEN 2000 AND 3000;

--실습 5-19 BETWEEN A AND B 연산자와 NOT 연산자를 사용하여 출력하기

SELECT *
    FROM EMP
    WHERE SAL NOT BETWEEN 2000 AND 3000;
    
--실습 5-20 LIKE 연산자 사용하여 출력하기

SELECT *
    FROM EMP
    WHERE ENAME LIKE 'S%';

--실습 5-21 사원 이름의 두 번째 글자가 L인 데이터만 출력하기

SELECT *
    FROM EMP
    WHERE ENAME LIKE '_L%';
    
--실습 5-22 사원 이름에 AM이 포함된 사원 데이터만 출력하기

SELECT *
    FROM EMP
    WHERE ENAME LIKE '%AM%';
    
--실습 5-23 사원 이름에 AM을 포함하지 않은 사원 데이터 출력하기

SELECT *
    FROM EMP
    WHERE ENAME NOT LIKE '%AM%';
    
--실습 5-24 별칭을 사용하여 열 이름 출력하기

SELECT ENAME, SAL, SAL*12 + COMM AS ANNSAL, COMM
    FROM EMP;
    
--실습 5-25 등가 비교 연산자로 NULL 비교하기

SELECT *
    FROM EMP
    WHERE COMM = NULL;
    
--실습 5-26 IS NULL 연산자를 사용하여 출력하기

SELECT *
    FROM EMP
    WHERE COMM IS NULL;
    
--실습 5-27 직속상관이 있는 사원 데이터만 출력하기

SELECT *
    FROM EMP
    WHERE MGR IS NOT NULL;
    
--실습 5-28 AND 연산자와 IS NULL 연산자 사용하기

SELECT *
    FROM EMP
    WHERE SAL > NULL
        AND COMM IS NULL;
        
--실습 5-29 OR 연산자와 IS NULL 연산자 사용하기

SELECT *
    FROM EMP
    WHERE SAL > NULL
        OR COMM IS NULL;
        
--실습 5-30 집합 연산자를 사용하여 출력하기

SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP    
    WHERE DEPTNO = 20;
    
--실습 5-31 집합 연산자를 사용하여 출력하기(출력할 열 개수가 다를 때)

SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE DEPTNO = 20;
    
--실습 5-32 집합 연산자를 사용하여 출력하기(출력할 열 자료형이 다를 때)

SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, DEPTNO, SAL
    FROM EMP
    WHERE DEPTNO = 20;
    
--실습 5-33 집합 연산자를 사용하여 출력하기(출력할 열 개수와 자료형이 같을 때_)

SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
UNION
SELECT SAL, JOB, DEPTNO, SAL
    FROM EMP
    WHERE DEPTNO = 20;
    
--실습 5-34 집합 연산자를 사용하여 출력하기(출력 결과 데이터가 같을 때)

SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10;
        
--실습 5-35 집합 연산자를 사용하여 출력하기(출력 결과 데이터가 같을 때)

SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
UNION ALL
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10;
    
--실습 5-36 집합 연산자를 사용하여 출력하기

SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
MINUS
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10;
    
--실습 5-37 집합 연산자를 사용하여 출력하기

SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
INTERSECT
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10;

/*

직업이 SALESMAN 인것만 출력
SELECT * FROM EMP WHERE JOB LIKE '%SALE%';

_ : 하나의 문자

_자바 : 자바로 끝나는 문자(총 3글자)
EX) 첫자바

자바_ : 자바로 시작하는 문자(총 3글자)
EX) 자바끝

_자바_ : 자바라는 단어가 포함된 문자(총 4글자)
EX) 첫자바끝

% : 모든 문자

%자바 : 자바로 끝나는 문자(글자수 제한 없음)
EX) 혼자 공부하는 자바

자바% : 자바로 시작하는 문자(글자수 제한 없음)
EX) 자바는 쉽다.

%자바% : 자바라는 단어가 포함된 문자(글자수 제한 없음)
EX) 오라클자바교육
*/