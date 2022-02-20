[TOC]



# CSS

- Cascading Style Sheets
- **선택하고** 스타일을 지정하다 [선택자, 선언(속성: 값)]

## 1. 정의 방법

- 인라인(inline)

```html
<body>
    <h1 style="color: blue; font-size: 100px;">Hello</h1>
</body>
```

- 내부 참조(embedding) - `<style>` 

```html
<head>
    <title>html</title>
    <style>
        h1 {color: blue; font-size: 100px;}
    </style>
</head>
```

- 외부 참조(link file) - 분리된 CSS 파일

```html
<head>
    <link href="mystyle.css" rel="stylesheet">
</head>
```

## 2. Selectors (선택자)

### 2.1 선택자 유형

- 기본 선택자
  - 전체 선택자, 요소 선택자
  - 클래스 선택자, 아이디 선택자, 속성 선택자
- 결합자(Combinators)
  - 자손 결합자, 자식 결합자
  - 일반 형제 결합자, 인접 형제 결합자
- 의사 클래스/ 요소(Pseudo Class)
  - 링크, 동적 의사 클래스
  - 구조적 의사 클래스, 기타 의사 클래스, 의사 엘리먼트, 속성 선택자

```html
  <style>
    * {color: red;} ; 전체 선택자
    h2 {color: black;} ; 요소 선택자
    h3, h4 {font-size: 10px;} ; 요소 선택자
    .green {color: green;} ; 클래스 선택자
    #purple {color: purple;} ; id 선택자
    .box > p {font-size: 20px;} ; 자식 결합자
    .box p {color: blue;} ; 자손 결합자
  </style>
```

### 2.2 CSS 적용 우선순위

1. `!important`
2. 인라인 > id > class, 속성, pseudo-class > 요소, pseudo-element
3. CSS 파일 로딩 순서

### 2.3 Selectors 심화

1. 자손 결합자 : selector A 하위의 모든 selector B 요소
2. 자식 결합자 `>`: selector A 바로 아래의 selector B 요소
3. 일반 형제 결합자`~`: selector A의 형제 요소 중 뒤에 위치하는 selector B  요소를 모두 선택
4. 인접 형제 결합자`+`: selector A의 형제 요소 중 바로 뒤에 위치하는 selector B 요소를 선택

## 3. CSS 상속

- CSS는 상속을 통해 부모 요소의 속성을 자식에게 상속한다.
  - 상속되는 것: Text 관련 요소 등
  - 상속되지 않는 것: Box model 관련 요소, position 관련 요소

## 4. CSS 기본 스타일

### 4.1 크기 단위

- px(픽셀) : 고정적인 단위
- % : 백분율 단위, 가변적인 레이아웃에서 자주 사용
- em : **상속의 영향을 받음**, 배수 단위, 요소에 지정된 사이즈에 상대적인 사이즈를 가짐
- rem : **상속의 영향을 받지 않음**, 최상위 요소(html)의 사이즈를 기준으로 배수 단위를 가짐
- viewport : 디바이스의 viewport를 기준으로 상대적인 사이즈 결정됨
  - vw, vh, vmin, vmax

### 4.2 색상 단위

- 색상 키워드: 대소문자 구분하지 않음, 특정 색을 글자로 나타냄
- RGB 색상: 16진수 표기법 혹은 함수형 표기법을 사용해서 특정 색을 표현하는 방식
- HSL 색상: 색상, 채도, 명도를 통해 특정 색을 표현하는 방식

## 5. CSS Box model

- 모든 요소는 네모(박스 모델)이고 **위에서부터 아래로(Block Direction)**, **왼쪽에서 오른쪽으로(Inline Direction)** 쌓인다.
- 하나의 박스는 `content, padding, border, margin`으로 이루어진다.

1. `content` : 글이나 이미지 등 요소의 실제 내용

2. `padding` : 테두리 안쪽의 내부 여백, 요소에 적용된 배경색, 이미지는 padding까지 적용

3. `border` : 테두리 영역

   1. shorthand : `border: 2px dashed black` 

4. `margin` : 테두리 바깥의 외부 여백 배경색을 지정할 수 없다.

   1. shorthand

   ```css
   margin: 10px; 상하좌우 margin: 10px 20px; 상하/좌우 
   margin: 10px 20px 30px; 상/좌우/하 margin: 10px 20px 30px 40px; 상우하좌
   ```

### 5.1 box-sizing

- 기본적으로 모든 요소의 box-sizing은 content-box
- border까지의 너비를 박스 사이즈로 보고싶어서 `box-sizing: border-box` 로 설정

## 6. CSS Display

- display에 따라 크기와 배치가 달라진다.

1. display: block
   1. 줄 바꿈이 일어나는 요소, 화면 크기 전체의 가로 폭을 차지한다.
   2. 블록 레벨 요소 안에 인라인 레벨 요소가 들어갈 수 있다.
   3. `div / ul, ol, li / p / hr / form` 등
2. display: inline
   1. 줄 바꿈이 일어나지 않는 행의 일부 요소, content 너비만큼 가로 폭을 차지한다.
   2. width, height, margin-top, margin-bottom을 지정할 수 없다.
   3. 상하 여백은 line-height로 지정한다.
   4. `span / a / img / input, label / b, em, i, strong` 등
3. display: inline-block
   1. block과 inline 레벨 요소의 특징을 모두 가진다.
   2. inline처럼 한 줄에 표시 가능하고, block처럼 width, height, margin 속성을 모두 저장할 수 있다. 

4. display: none
   1. 해당 요소를 화면에 표시하지 않고, 공간조차 부여되지 않는다.
   2. visibility: hidden은 해당 요소가 공간은 차지하나 화면에 표시만 하지 않는다.


### 6.1 속성에 따른 수평 정렬

- `margin-right: auto;` , `text-align: left;` 
- `margin-left: auot;` ,`text-align: right;`
- `margin-right: auto; margin-left: auto` , `text-align: center` 

## 7. CSS position

- 문서 상에서 요소 위치를 지정
- `static` : 모든 태그의 기본 값(기준 위치)
  - 부모 요소 내에서 배치될 때는 부모 요소의 위치를 기준으로 배치된다.
- `relative` : 상대 위치
  - 자기 자신의 `static` 위치를 기준으로 이동해서 레이아웃에서 요소가 차지하는 공간은 `static`일 때와 같다.
- `absolute` : 절대 위치
  - 요소를 일반적인 문서 흐름에서 제거 후 레이아웃에 공간을 차지하지 않는다.
  - `static` 이 아닌 가장 가까이 있는 부모/조상 요소를 기준으로 이동 
- `fixed` : 고정 위치
  - 요스를 일반적인 문서 흐름에서 제거 후 레이아웃에 공간을 차지하지 않는다. 
  - 부모 요소와 관계 없이 `viewport` 를 기준으로 이동 => 스크롤 시에도 항상 같은 위치에 있는다.