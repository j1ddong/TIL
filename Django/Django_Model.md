[TOC]

# Django Model

## 1. Model

> 저장된 데이터베이스의 구조(layout)

- 각각의 `model`은 하나의 데이터베이스 테이블에 매핑된다.
- `Django`는 `model`을 통해 데이터에 접속하고 관리한다.

### Database

1. 데이터베이스 (DB): 체계화된 데이터의 모임 
2. 쿼리(Query): 데이터를 조회, 추출, 조작하기 위한 명령어
3. 스키마(Schema): 데이터베이스에서 자료의 구조, 표현방법, 관계 등을 정의한 구조

![image-20220312143732078](C:\Users\jiunHan\Desktop\TIL\Django\md-images\image-20220312143732078.png)

4. 테이블(Table): 열과 행의 모델을 사용해 조직된 데이터 요소들의 집합
   1. 열(column): 필드(field) 또는 속성 ; 각 열에는 고유한 데이터 형식이 지정된다.
   2. 행(row): 레코드(record) 또는 튜플 ; 테이블 데이터는 행에 저장된다.
   3. `PK`: 각 행(레코드)의 고유값으로 Primary Key로 불린다. 

![image-20220312145543785](C:\Users\jiunHan\Desktop\TIL\Django\md-images\image-20220312145543785.png)



### ORM

> Object-Relational-Mapping, 객체 지향 프로그래밍 언어를 사용하여 호환되지 않는 유형의 시스템 간에 데이터를 변환하는 프로그래밍 기술(Django - SQL)

- DB를 객체(object)로 조작하기 위해 ORM 사용한다



### models.py 작성

- 각 모델은 `django.models.Model` 클래스의 서브 클래스로 표현된다.
- `models` 모듈을 통해 어떠한 타입의 DB 컬럼(열)을 정의할 것인지 정의한다.
- 각 필드(열)는 클래스 속성으로 지정되어 있으며, 각 속성은 각 데이터베이스 열에 매핑된다.

```python
# articles/models.py

class Article(models.Model):
    title = models.charField(max_length=10)  # 필드
```



### Migrations

> Django가 model에 생긴 변화를 반영하는 방법

1. `python manage.py makemigrations`
   1. `model`을 변경한 것에 기반한 새로운 마이그레이션(설계도)을 만들 때 사용한다.
2. `python manage.py migrate`
   1. 마이그레이션을 `DB`에 반영하기 위해 사용, 모델에서의 변경 사항들과 DB 스키마가 동기화를 이루게 되는 과정
3. `python manage.py sqlmigrate`
   1. 마이그레이션에 대한 `SQL`구문을 보기 위해 사용
4. `python manage.py showmigrations` 
   1. 프로젝트 전체의 마이그레이션 상태를 확인하기 위해 사용한다.
   2. 마이그레이션 파일들이 `migrate` 됐는지 안됐는지 여부를 확인할 수 있다.

#### model 수정

- 추가 모델 필드 작성 후 `makemigrations` 진행
- `default` 값 설정한 후 `migrate`을 통해 `models.py` 수정사항 반영

- DateField's options
  - `auto_now_add`: 최초 생성 일자
  - `auto_now` : 최종 수정 일자



## 2. DB API

> DB를 조작하기 위한 도구, Model을 만들면 Django는 객체들을 만들고 읽고 수정하고 지울 수 있는 database-abstract API를 자동으로 만든다.

**Class Name.Manager.Queryset API**

1. `Manager` 
   1. Django 모델에 데이버베이스 query 작업이 제공되는 인터페이스
   2. 기본적으로 모든 Django 모델 클래스에 `objects`라는 `Manager` 추가
2. `QuerySet`
   1. 데이터베이스로부터 전달받은 객체 목록
   2. 데이터베이스로부터 조회, 필터, 정렬 등을 수행할 수 있다.

### Django shell

- 라이브러리 설치: `pip install ipython` & `pip install django-extensions` 
- 앱 등록하기: `settings.py` `INSTALLED_APPS`에 `django_extensions` 
- 실행: `python manage.py shell_plus` 



## 3. CRUD

> 기본적인 데이터 처리 기능인 Create(생성), Read(읽기), Update(갱신), Delete(삭제)를 묶어서 일컫는 말

`article/views.py`에서 `from .models import Article` 해야 사용 가능

### CREATE

```python
# 1 인스턴스 생성 후 속성값 지정
article = Article()  # 인스턴스 생성
article.title = 'first'
article.content = 'django!'
article.save()

# 2 인스턴스 생성 시 속성값 지정 ; 이 방식이 선호됨
article = Article(title='second', content='django!!')
article.save()

# 3 QuerySet API create()사용
Article.objects.create(title='thrid', content='django!')
```

- `save() method` : 객체를 데이터베이스에 저장
- `def __str__(self)`: 각각의 `object`가 사람이 읽을 수 있는 문자열을 반환할 수 있도록 함



### READ

```python
# 모든 DB 조회하기
Article.objects.all()

# 뒤에서부터 조회하기
Article.objects.order_by('-pk')

# pk 값으로 조회: 존재하지 않는 값이나 중복되는 값 조회시 오류
Article.objects.get(pk=상수)

# filter로 중복되는 값 조회 가능
Article.objects.filter(name='홍길동')  # 홍길동이 두명 있어도 오류 안남
```

- `all()` : 현재 `QuerySet`의 복사본을 반환
- `get()` : 객체를 찾을 수 없으면 `DoesNotExist` 예외 발생, 둘 이상의 객체를 찾으면 `MultipleObjectsReturned`예외 발생하기 때문에 고유성이 보장되는 `pk` 값을 통해 조회
- `filter()`: 주어진 lookup 매개변수와 일치하는 객체를 포함하는 새 QuerySet 반환



### UPDATE

```python
# 조회 > 수정 > 저장
article = Article.objects.get(pk=1)
article.title = 'byebye'
article.save()
```



### DELETE

```python
# 조회 > 삭제
article = Article.objects.get(pk=1)
article.delete()
```



## Admin Site

> 사용자가 아닌 서버의 관리자가 활용하기 위한 페이지

1. `python manage.py createsuperuser` : 관리자 계정 생성 후 서버를 실행한 다음 `/admin` 에서 관리자 페이지 로그인
2. `admin` 등록

```python
# articles/admin.py
from django.contrib import admin
from .models import Article

class ArticleAdmin(admin.ModelAdmin):
    list_display = ('pk', 'title', 'content',)

# admin 사이트에 register 하겠다.
admin.site.register(Article)
```

