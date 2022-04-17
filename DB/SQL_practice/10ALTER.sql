CREATE TABLE articles (
  title TEXT NOT NULL,
  content TEXT NOT NULL
);

INSERT INTO articles VALUES ('1번 제목', '1번 내용');


ALTER TABLE articles RENAME TO news;


-- 새로운 컬럼 추가 > 에러 발생 [기존 데이터 NULL]
ALTER TABLE news ADD COLUMN created_at TEXT NOT NULL;


-- NOT NULL 추가 설정 없이 추가하기
ALTER TABLE news ADD COLUMN created_at TEXT;


INSERT INTO news VALUES('제목', '내용', datetime('now'));

-- 기본 값 설정하기
ALTER TABLE news ADD COLUMN subtitle TEXT NOT NULL DEFAULT '소제목';


ALTER TABLE news RENAME COLUMN title TO main_title;


ALTER TABLE news DROP COLUMN subtitle;