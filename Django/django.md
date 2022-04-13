[TOC]



### 0. git init / git ignore

```bash
$ git init
$ touch .gitignore
```



------

### 1. 가상환경 설정

```bash
$ python -m venv venv  # 가상환경 만들기
$ source venv/Scripts/activate  # 가상환경 켜기
$ pip list  # 리스트를 통해 가상환경 잘 만들어졌는지 확인
$ pip install -r requirements.txt  # 패키지 설치
```



### 2. Django 시작

#### 2-1. 프로젝트 시작

```bash
$ django-admin startproject pjt_name .
```

- 현재 위치에서 `pjt_name`으로 프로젝트 생성
- `pjt_name`은 `python`이나 `Django` 에서 사용중인 키워드 피해야 한다

#### 2-2. 서버 시작하기

```bash
$ python manage.py runserver
```

- 로켓 페이지 확인



### 3. 어플리케이션

#### 3-1 어플리케이션 설치

```bash
$ python manage.py startapp app_name
```

- `app_name`으로 어플리케이션 설치, 복수형으로 설정

#### 3-2 앱 등록

```python
# pjt_name을 crud, app_name을 articles라고 가정
# crud/settings.py
INSTALLED_APPS = [
    'articles',
     ....
]
```

- 프로젝트 포덜 안에 있는 `setting.py`에 앱 등록

#### 3-3 model 정의

[Django model field docs](https://docs.djangoproject.com/en/4.0/ref/models/fields/#textfield)

```python
from django.db import models

class Article(models.Model):
    title = models.CharField(max_length=10)
    content = models.Textfield()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
```

#### 3-4 URLs 분리

```python
# crud/urls.py
from django.contrib import admin
from django.urls import path, include  # include import 하기

urlpatterns = [
    path('admin/', admin.site.urls),
    path('articles/', include('articles.urls')),
]
```

- 프로젝트 내 `urls.py`에 `include` 임포트해서 `articles`로 시작하는 url을 `aritcles/urls.py`로 갈 수 있게 해줌

```python
# aritcles/urls.py
from django.urls import path

app_name = 'articles'
urlpatterns = [
    path('', views.index, name='index')
]
```

- 원래 생성되어 있던 파일이 아니라서 새로 생성해야 함
- `url` 태그에서 사용할 `name` 지정, `app_name`은 `urlnamespace` 문제 해결하기 위해 작성

#### 3-5 model 정의



```python

```











```python
def index(request):
    return render(request, 'articles/index.html')
```











