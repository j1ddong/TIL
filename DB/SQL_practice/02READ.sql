SELECT rowid, name FROM classmates;


-- 조회하는 행 수 제한
SELECT rowid, name FROM classmates LIMIT 1;


-- 특정 행부터 시작해서 조회하는 행 수 제한
SELECT rowid, name FROM classmates LIMIT 1 OFFSET 2;


SELECT rowid, name FROM classmates WHERE address = '서울';


-- age 컬럼에서 중복 제거하고 조회
SELECT DISTINCT age FROM classmates;
