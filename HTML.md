[TOC]



# HTML

- Hyper Text Markup Language

## 1. 기본 구조

```html
<!DOCTYPE html> 
<html>
    <head>
        <meta>
        <title></title>
    </head>
    <body>
        
    </body>
</html>
```

- `html`: 문서 최상의 요소
- `head`: 문서 메타데이터 요소
  - 문서 제목, 인코딩, 스타일, 외부 파일 로딩 등
  - 일반적으로 브라우저에 나타나지 않는 내용
- `body`: 문서 본문 요소
  - 실제 화면 구성과 관련된 내용

### 1.1 `head` 예시

- `<title>` : 브라우저 상단 타이틀
- `<meta>` : 문서 레벨 메타데이터 요소
- `<link>` : 외부 리소스 연결 요소 (**css파일**, favicon 등)
- `<script>` : 스크립트 요소 (Javascript 파일/코드)
- `<style>` : CSS 직접 작성

### 1.2 요소(element)

- `HTML`의 요소는 태그와 내용(contents)으로 구성되어 있다. 

```html
<h1>contents</h1>
```

- 내용이 없는 태그들
  - `<br>` : 줄바꿈 요소
  - `<hr>` : 수평선, 가로줄
  - `<img>` : 이미지 삽입 `src` 특성은 필수이고 포함하고자 하는 이미지 경로 지정, `alt` 는 이미지를 표시할 수 없는 경우에 대신 보여주는 이미지 설명
  - `<input>` : 입력 요소
  - `<link>` : 외부 리소스 연결 요소 `href` 특성에 경로를 `rel` 특성에는 현제 문서와 연결한 아이템의 관계가 어떻게 되는지 설명
  - `<meta>` : 문서 레벨 메타데이터 요소
- 요소는 중첩될 수 있다.
- 태크별로 사용할 수 있는 속성이 다르다. 

```html
<a href="http://google.com"></a> 
```

- `href` : 속성명 `"http://google.com"` : 속성값

#### 1.2.1 시맨틱 태그

- HTML5에서 의미론적 요소를 담은 태그의 등장
  - `<header>` : 문서 전체나 섹션의 헤더 (머리말 부분)
  - `<nav>` : 내비게이션
  - `<aside>` : 사이드에 위치한 공간
  - `<section>` : 문서의 일반적인 구분, 컨텐츠의 그룹 표현
  - `<article>` : 문서, 페이지, 사이트 안에 독립적으로 구분되는 영역
  - `<footer>` : 문서 전체나 섹션의 푸터(마지막 부분)

#### 1.2.2 텍스트 요소

```html
<a></a> href 속성을 활용하여 다른 url로 연결하는 하이퍼링크 생성
<b></b> 굵은 글씨 요소
<strong></strong> 굵은 글씨 요소, 강조하고자 하는 요소
<i></i> 기울임 글씨 요소
<em></em> 기울임 글씨 요소, 강조하고자 하는 요소
<br> 텍스태 내에 줄 바꿈 생성
<img> src 속성을 활용하여 이미지 표현
<span></span> 의미 없는 인라인 컨테이너
```

#### 1.2.3 그룹 컨텐츠

```html
<p></p> 하나의 문단
<hr> 문단 레벨 요소에서의 주제 분리를 의미하며, 수평선으로 표현됨
<ol></ol> 순서가 있는 리스트
<ul></ul> 순서가 없는 리스트
<pre></pre> HTML에 작성한 내용을 그대로 표현, 보통 고정폭 글꼴이 사용되고 공백문자를 유지
<blockquote></blockquote> 텍스트가 긴 인용문, 주로 들여쓰기를 한 것으로 표현됨
<div></div> 의미 없는 블록 레벨 컨테이너
```

#### 1.2.4 인라인 VS 블록 레벨 요소

- 인라인 요소는 요소를 구성하는 태그에 할당된 공간만 차지합니다. 반면 블록 레벨 요소는 한 줄을 차지한다.
- `CSS display` 속성을 사용해 요소의 시각적 표현 레벨을 바꿀 수 있다. 이 방법을 사용해도 요소의 카테고리와 콘텐츠 모델을 바뀌지 않는다. `<span>` 요소의 `display` 를 `block` 으로 지정한다 해도, 그 안에 `<div>` 넣을 수는 없다. 
- <https://developer.mozilla.org/ko/docs/Web/HTML/Inline_elements>

#### 1.2.5 table

- table의 각 영역을 명시하기 위해 <thead>, <tbody>, <tfoot> 요소를 활용
- <tr>으로 가로 줄을 구성하고 내부에는 <th> 혹은 <td>로 셀을 구성
- `colspan, rowspan` 속성을 활용하여 셀 병합
- <caption>을 통해 표 설명 또는 제목을 나타냄

#### 1.2.6 form

- `<form>`은 정보(데이터)를 서버에 제출하기 위한 요소
  - action: form을 처리할 서버의 url
  - method: form을 제출할 때 사용할 HTTP 메서드 (GET 혹은 POST)
  - enctype: method가 post인 경우 데이터 유형

#### 1.2.7 input & label

- 다양한 타입을 가지는 입력 데이터 유형과 위젯이 제공된다.
  - type: text, password, email, number, file, checkbox(다중 선택), radio(단일 선택)
  - name: form control에 적용되는 이름
  - value: form control에 적용되는 값 (이름/값 페어로 전송됨)
  - required, autofocus, disables, placeholder
- label을 클릭하여 input 자체의 초점을 맞추거나 활성화 시킬 수 있다
  - `<input>` 에 id 속성을 `<label>` 에는 for 속성을 활용하여 상호 연관을 시킨다



