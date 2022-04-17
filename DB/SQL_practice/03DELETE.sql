DELETE FROM classmates WHERE rowid = 5;

INSERT INTO classmates VALUES('최전자', 28, '부산');

-- 기본적으로 sqlite id 재사용
SELECT rowid, * FROM classmates;
