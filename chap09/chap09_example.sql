--급여가 2500 이상인 데이터를 조회

SELECT *
    FROM EMP
    WHERE SAL >= 2500;
    
--급여가 사원의 평균급여 이상인 데이터를 조회

SELECT *
    FROM EMP
    WHERE SAL > AVG(SAL);       // ERROR
    
SELECT AVG(SAL) FROM EMP ;      // 2개를 합쳐 서브쿼리 작성

SELECT *
    FROM EMP
    WHERE SAL > (SELECT AVG(SAL) FROM EMP);
    
------------

SELECT *
    FROM EMP
    WHERE SAL >= (SELECT AVG(SAL) 
                    FROM EMP 
                    GROUP BY DEPTNO         // ERROR
                );
                
SELECT AVG(SAL) 
    FROM EMP 
    GROUP BY DEPTNO;            
    
    
SELECT *
    FROM EMP
    WHERE SAL >= ALL (SELECT AVG(SAL) 
                    FROM EMP 
                    GROUP BY DEPTNO
                );