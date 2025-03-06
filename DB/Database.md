[TOC]

# Database

> 체계회된 데이터 모임

- 데이터베이스를 통해 얻는 장점
  - 데이터 중복 최소화, 데이터 무결성, 데이터 일관성, 데이터 독립성, 데이터 표준화, 데이터 보안 유지

## 1. RDB

> Relational Database, key와 value들의 간단한 관계를 표 형태로 정리한 데이터베이스

- 스키마(schema) : 데이터베이스에서 자료의 구조, 표현방법, 관계 등 전반적인 명세를 기술한 것
  
  

![image-20220417154838689.png](C:\Users\jiunHan\Desktop\Git%20hub\TIL\DB\image\image-20220417154838689.png)



![image-20220417155031453.png](C:\Users\jiunHan\Desktop\Git%20hub\TIL\DB\image\image-20220417155031453.png)

- 열(column): 각 열에는 고유한 데이터 형식이 지정
  - name이란 필드에 고객의 이름 (TEXT) 정보가 저장된다.
- 행(row): 실제 데이터가 저장되는 형태
  - 위의 예시에는 총 3명의 고객 정보가 저장되어 있다.
- 기본키(Primary key): 각 행(레코드)의 고유 값

## 2. RDBMS

> Relational Database Management System, 관계형 모델을 기반으로 하는 데이터베이스 관리시스템을 의미

- MySQL, SQLite, ORACLE, PostgreSQL

### 1. Sqlite Data type

1. NULL
2. INTEGER : 크기에 따라 0, 1, 2, 3, 4, 6 또는 8바이트에 저장된 부호 있는 정수
3. REAL : 8바이트 부동 소수점 숫자로 저장된 부동 소수점 값
4. TEXT : 문자열
5. BLOB : 입력된 그대로 정확히 저장된 데이터

### 2. Sqlite Type Affinity

> 특정 컬럼에 저장하도록 권장하는 데이터 타입



![image-20220417160225823.png](C:\Users\jiunHan\Desktop\Git%20hub\TIL\DB\image\image-20220417160225823.png)