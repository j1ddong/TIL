SELECT last_name, COUNT(*) FROM users GROUP BY last_name;

-- 출력될 때 이름 name_count로 바꾸기
SELECT last_name, COUNT(*) AS name_count FROM users GROUP BY last_name;