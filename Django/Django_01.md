[TOC]

# Django 요청과 응답

## URLs.py

- HTTP 요청(request)을 알맞은 view로 전달

1. 모든 URL을 프로젝트 `urls.py`에 작성

```python
from articles import views

urlpatterns = [
	path('admin/', admin.site.urls),
	path('index/', views.index),
]
```

### 1. Variable Routing

> URL 주소를 변수로 사용하는 것, URL의 일부를 변수로 지정하여 view 함수의 인자로 넘길 수 있다.

```python
path('hello/<str:name>/<int:number>', views.hello)
```

```python
def hello(request, name, number):
    context = {
        'name': name
        'number': number
    }
    return render(request, 'hello.html', context)
```

### 2. App URL mapping

- app이 많이지면서 urls을 프로젝트 `urls.py`에서 모두 관리하는 것은 프로젝트 유지보수에 좋지 않아졌다.
- 해결방법: 각 app에 urls.py를 작성하기

1. `app/urls.py` 파일 생성
2. 모듈 불러오고 urlpatterns 작성
3. 프로젝트 `urls.py`에서 `include` 함수 호출하고 경로 작성하기

```python
# firstpjt/urls.py
from django.contrib import admin
from django.urls import path, include
urlpatterns = [
    path('admin/', admin.site.urls),
    path('articles/', include('articles.urls'))
]
```

```python
#atricles/urls.py 
from django.urls import path
from . import views

urlpatterns = [
    path('index/', views.index)
]
```

### 3. Naming URL patterns

- 링크에 url을 직접 작성하는 것이 아니라 `path()` 함수의 name 인자를 정의해서 사용
- Django Template Tag 중 하나인 url 태그를 사용해서 `path()` 함수에 작성한 name을 사용할 수 있다.
- 이를 통해 url 설정에 정의된 특정한 경로들의 의존성을 제거할 수 있다.

```django
<a href="{% url 'index' %}">뒤로</a>
```



## View

- HTTP 요청을 수신하고 HTTP 응답을 반환하는 `함수` 작성

```python
def index(request):
	return render(request, 'index.html')
```

## Templates

- 실제 내용을 보여주는데 사용되는 파일
- Templates 의 기본 경로는 `app/templates`로 저장되어 있다.

### 1. Django Template Language (DTL)

- Django template에서 사용하는 built-in template system
- 조건, 반복, 변수 치환, 필터 등의 기능을 제공

#### 1. Variable

- `view.py` 에서 정의한 변수를 `render()`를 사용하여 `template` 파일로 넘겨 사용하는 것
- `render()`의 세번째 인자로 `{key: value}` 와 같이 딕셔너리 형태로 넘겨주며, 여기서 정의한 key에 해당되는 문자열이 template에서 사용 가능한 변수명이 된다.
- `dot(.)`를 사용하여 변수 속성에 접근할 수 있다.
- 변수명은 영어, 숫자와 밑줄(_)의 조합으로 구성될 수 있으나 밑줄로는 시작할 수 없다

#### 2. Filters

- 표시할 변수를 수정할 때 사용한다.
- 60개의 `built-in template filters` 제공

#### 3. Tags `{% tag %}` 

- 출력 텍스트를 만들거나, 반복 또는 논리를 수행하여 제어 흐름을 만드는 등 변수보다 복잡한 일을 수행한다.
- 약 24개의 `built-in template tags` 제공

#### 4. Comments

- `{# #}` 으로 주석을 표현하기 위해 사용한다.
- 한 줄 주석에만 사용할 수 있으며, 줄 바꿈이 허용되지 않는다.

### 2. Template inheritance (템플릿 상속)

- 템플릿 상속은 기본적으로 코드 재사용성에 초점이 있다.
- `{% extends '' %}` : 자식(하위) 템플릿이 부모 템플릿을 확장한다는 것을 알린다.
  - 반드시 템플릿 최상단에 작성되어야 한다.
- `{% block content %} {% endblock %}`
  - 하위 템플릿에서 재지정(overriden)할 수 있는 블록을 정의
  - 프로젝트 `settings.py` `TEMPLATES` 리스트 `'DIRS'`에 `[BASE_DIR / 'templates' ]` 디렉토리 외 템플릿 추가 경로 설정해야 한다.
- `{% include '' %}` : 템플릿 내에 다른 템플릿을 포함하는 방법



## HTML FORM

### 1. form element

- 웹에서 사용자 정보를 입력하는 여러 방식을 제공하고, 사용자로부터 할당된 데이터를 서버로 전송하는 역할을 담당한다.
- 핵심 속성(attribute)
  - `action`: 입력 데이터가 전송될 URL 지정
  - `method`: 입력 데이터 전달 방식 지정

### 2. input element

- 사용자로부터 데이터를 입력 받기 위해 사용한다.
- `type` 속성에 따라 동작 방식이 달라진다.
- 핵심 속성(attribute)
  - `name` : name은 key, value는 value로 매핑하게 된다

### 3. label element

- 사용자 인터페이스 항목에 대한 설명을 나타낸다
- label을 input 요소와 연결하기
  - input에 id 속성 부여
  - label에는 input의 id와 동일한 값의 for 속성이 필요



## HTTP request methods

### 1. GET

- 서버로부터 정보를 조회하는데 사용한다. 데이터를 가져올 때만 사용해야 한다.

```django
{% block content %}
<h1>THROW</h1>
<form action="{% url 'catch' %}" method="GET">
  <label for="message">Throw</label>
  <input type="text" id="message" name="message">
  <input type="submit">
</form>
<a href="{% url 'index' %}">뒤로</a>
{% endblock content %}
```

```python
def catch(request):
    message = request.GET.get('message')
    context = {
        'message': message,
    }
    return render(request, 'catch.html', context)
```

```django
{% block content %}
<h1>CATCH</h1>
<h2>여기서 {{ message }}를 받았다!!</h2>
<a href="{% url 'throw' %}">뒤로</a>
{% endblock content %}
```



## Namespace

> 객체를 구분할 수 있는 범위를 나타내는 namespace

```python
# pages/urls.py

from django.urls import path
from . import views

urlpatterns = [
    path('index/', views.index, name='index'),
]
```

```python
# pages/views.py

def index(request):
    return render(request, 'index.html')
```

- 2가지 문제 발생

1. `URL namespace` : articles 안에 있는 인덱스 url 이름과 pages 안에 있는 인덱스 url 이름이 같다.
2. `Template namespace` : 템플릿 이름이 같아서 먼저 등록된 앱 안에 있는 템플릿이 출력된다.

### URL namespace

> app_name attribute 작성

```python
# pages/urls.py

app_name = 'pages'
urlpatterns = [
    path('index/', views.index, name='index'),
]
```

```python
# atricles/urls.py

app_name = 'articles'
urlpatterns = [
    path('index/', views.index, name='index'),
]
```

```django
<!-- articles/templates/greeting.html -->
<a href="{% url 'articles:index' %}">뒤로</a>
```

- `:` 연산자를 사용하여 지정한다.



### Template namespace

>  임의로 templates의 폴더 구조를 `app_name/templates/app_name` 형태로 변경해 임의로 이름 공간 생성 후 변경된 추가 경로 작성

- Django는 기본적으로 `app_name/templates/` 경로에 있는 templates 파일들만 찾을 수 있고, INSTALLED_APPS에 작성한 app 순서대로 template을 검색 후 렌더링

```python
# articles/views.py

def index(request):
    return render(request, 'atricles/index.html')
```

