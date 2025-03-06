[TOC]

# 1. SQL

> Structured Query Language, 관계형 데이터베이스 관리시스템의 데이터 관리를 위해 특수 목적으로 설계된 프로그래밍 언어

- 데이터베이스 스키마 생성 및 수정, 자료 검색 및 관리, 데이터베이스 객체 접근 조정 관리

| 분류              | 개념                                   | 예시                              |
|:---------------:|:------------------------------------:|:-------------------------------:|
| DDL - 데이터 정의 언어 | 관계형 데이터베이스 구조(테이블, 스키마)를 정의하기 위한 명령어 | CREATE, DROP, ALTER             |
| DML - 데이터 조작 언어 | 데이터를 저장, 조회, 수정, 삭제 등을 하기 위한 명령어     | INSERT, SELECT, UPDATE, DELETE  |
| DCL - 데이터 제어 언어 | 데이터베이스 사용자의 권한 제어를 위해 사용하는 명령어       | GRANT, REVOKE, COMMIT, ROLLBACK |

## SQL 실습하기

- Start the **sqlite3** program by typing "sqlite3" at the command prompt, optionally followed by the name the file that holds the SQLite database (or ZIP archive)

```bash
For example, to create a new SQLite database named "ex1" 
$ sqlite3 ex1
```

- `.databases` : List names and files of attached databases

- `.import FILE TABLE`:  Import data from FILE into TABLE

- `.tables ?TABLE?` :  List names of tables matching LIKE pattern TABLE

- Use ".open FILENAME" to reopen on a persistent database.

```sqlite
sqlite> .open ex1.db
```

## 테이블 생성 및 삭제

- 테이블 생성

```sqlite
CREATE TABLE tablename (
    컬럼1 데이터 타입 NOT NULL
    컬럼2 데이터 타입 NOT NULL
    ...);
```

- 테이블 삭제

```sqlite
DROP TABLE tablename;
```

## DML - Data Manipulation Language

### INSERT

> Insert a single row into a table, 테이블에 단일 행 삽입

```sqlite
INSERT INTO tablename (column1, column2, ...) VALUES (value1, value2, ...)
```

- 모든 열 데이터를 작성할 경우 `column` 명시하지 않아도 된다
- `SQLite`는 따로`PRIMARY KEY` 속성 컬럼을 작성하지 않으면 값이 자동으로 증가하는 `rowid` 컬럼 지정

```sqlite
INSERT INTO tablename (column1, column2, ...) VALUES
    (value11, value12, ...)
    (value21, value22, ...)
    (value31, value32, ...);
```

- 한 번에 여러 행 삽입 가능

### SELECT

> Query data from a table, 테이블에서 데이터를 조회

- ORDER BY, DISTINCT, WHERE, LIMIT, GROUP BY, ...
1. LIMIT : constrain the number of rows returned by a query
   1. 쿼리에서 반환되는 행 수를 제한, 특정 행부터 시작해서 조회하기 위해 **OFFSET**키워드와 함께 사용되기도 한다
2. WHERE : specify the search condition for rows returned by the query
   1. 쿼리에서 반환된 행에 대한 특정 검색 조건을 지정
3. DISTINCT : remove duplicate rows in the result set
   1. 조회 결과에서 중복 제거, **DISTINCT 절은 SELECT 키워드 바로 뒤에 작성해야 함**

```sqlite
SELECT column1, colum2 FROM tablename;
```

#### Aggregate function

> 여러 행으로부터 하나의 결과값을 반환하는 함수

- **COUNT** : 그룹의 항목 수를 가져옴
- **AVG**: 모든 값의 평균을 계산
- **MAX**: 그룹에 있는 모든 값의 최대값 가져옴
- **MIN**: 그룹에 있는 모든 값의 최대값 가져옴
- **SUM**: 모든 값의 합 계산

```sqlite
SELECT COUNT(column) FROM tablename
```

### LIKE operator

> query data based on pattern matching, 패턴 일치를 기반으로 데이터를 조회하는 방법

#### % (percent sign)

- 0개 이상의 문자 => 이 자리에 문자열이 있을 수도 없을 수도 있다

#### _(underscore)

- 임의의 단일 문자: 반드시 이 자리에 한 개의 문자가 존재해야 한다

<img src="C:\Users\jiunHan\Desktop\Git hub\TIL\DB\image\image-20220417235457754.png" alt="image-20220417235457754" style="zoom:67%;" />

#### ORDER BY

> sort a result set of a query, 조회 결과 집합 정렬 

- 정렬 순서를 위한 2개의 keyword 제공
  - ASC - 오름차순 (default)
  - DESC - 내림차순

#### GROUP BY

> make a set of summary rows from a set of rows, 행 집합에서 요약 행 집합을 만든다

- 문장에서 **WHERE**절이 포함된 경우 반드시 **WHERE**절 뒤에 작성해야 한다

### DELETE

> Remove rows from a table, 테이블에서 행 제거

- 중복 불가능한 값인 `pk` 값으로 삭제

```sqlite
DELETE FROM classmates WHERE rowid = 5;
```

- 장고에서는 `AUTOINCREMENT`을 통해 `PK`를 재활용하지 않음

```sqlite
CREATE TABLE tablename (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    ....);
```

### UPDATE

> update data of existing rows in the table, 기존 행의 데이터를 수정

```sqlite
UPDATE classmates SET name='홍길동', address='제주도' WHERE rowid = 5;
```

### ALTER TABLE

#### 1. Table 이름 변경

```sqlite
ALTER TABLE 기존테이블 이름 RENAME TO 새로운 테이블 이름;
```

#### 2. 테이블 새로운 column 추가

```sqlite
ALTER TABLE news ADD COLUMN created_at TEXT;

ALTER TABLE news ADD COLUMN subtitle TEXT NOT NULL DEFAULT '소제목';
```
