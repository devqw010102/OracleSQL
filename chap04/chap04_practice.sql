--되새김 문제
-- P 97

--2번    EMP 테이블의 JOB 열 데이터를 중복없이 출력

SELECT DISTINCT JOB
    FROM EMP;
    
--3번    조건을 만족하는 구문 작성
/*
    1) 조회할 테이블명은 EMP 이며 모든 열을 출력합니다.
    2) 출력되는 열의 별칭은 다음과 같습니다.
        EMPNO -> EMPLOYEE_NO
        ENAME -> EMPLOYEE_NAME
        MGR -> MANAGER
        SAL -> SALARY
        COMM -> COMMISSION
        DEPTNO -> DEPARTMENT_NO
    3) 부서 번호를 기준으로 내림차순으로 정렬하되 부서 번호가 같다면 사원 이름을 기준으로 오름차순 정렬합니다.
*/
SELECT EMPNO AS EMPLOYEE_NO, ENAME AS EMPLOYEE_NAME, MGR AS MANAGER, SAL AS SALARY, COMM AS COMMISSION, DEPTNO AS DEPARTMENT_NO
    FROM EMP
    ORDER BY DEPTNO DESC, ENAME;
    