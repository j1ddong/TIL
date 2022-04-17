-- INSERT INTO 테이블 이름 (컬럼1, 컬럼2, ...) VALUES (값1, 값2, ..)
INSERT INTO classmates (name, age) VALUES ('홍길동', 23);


-- 모든 열에 데이터가 있는 경우 column을 명시하지 않아도 된다
INSERT INTO classmates VALUES ('홍길동', 30, '서울');


-- classmates에 있는 모든 열(컬럼) 조회
SELECT * FROM classmates;


-- pk를 조회하라면 rowid 컬럼 포함해서 조회해야 된다
SELECT rowid, * FROM classmates;


-- NOTNULL을 안해줬기 때문에 테이블 삭제
DROP TABLE classmates;


-- PK를 지정할 때는 무조건 INTEGER 데이터 타입으로 지정
CREATE TABLE classmates (
  id INTEGER  PRIMARY KEY,
  name TEXT NOT NULL,
  age INT NOT NULL,
  address TEXT NOT NULL
  );


-- Parse error near line 4: table classmates has 4 columns but 3 values were supplied
INSERT INTO classmates VALUES ('홍길동', 30, '서울');


-- 해결방법: 1. 모든 칼럼 값 작성 2. 각 value에 맞는 컬럼 지정
INSERT INTO classmates VALUES (1, '홍길동', 30, '서울');
INSERT INTO classmates (name, age, address) VALUES('홍길동', 30, '서울');


-- 실습을 위해 rowid 사용
DROP TABLE classmates;

CREATE TABLE classmates (
  name TEXT NOT NULL,
  age INT NOT NULL,
  address TEXT NOT NULL
  );


INSERT INTO classmates VALUES 
  ('홍길동', 30, '서울'),
  ('김철수', 30, '대전'),
  ('이싸피', 26, '광주'),
  ('박삼성', 29, '구미'),
  ('최전자', 28, '부산');
