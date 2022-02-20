[TOC]



# CSS Layout

## 1. Float

- 박스를 왼쪽 혹은 오른쪽으로 이동시켜 텍스트를 포함 인라인 요소들이 주변을 `wrapping` 하도록 한다.

- `Float` 는 `normal flow` 에서 벗어나 부동 상태이므로 이후 요소에 대하여 `Float` 속성이 적용되지 않도록 `Clearing` 필수

  ```css
  .clearfix::after {
      content: "";
      display: block;
      clear: both;
  }
  ```

- 부모 요소에 반드시 `Clearing Float` 를 하여 이후 요소부터 `Normal Flow` 가지도록 지정



## 2. Flexbox

- 축
  - `main axis`  (메인 축) / `cross axis` (교차 축)
- 구성 요소
  - `Flex Container` (부모 요소)  : `display: flex 혹은 inline-flex`로 지정 
  -  `Flex Item` (자식 요소)

### 2.1 배치 설정

- `flex-direction` : `main axis` 기준 방향 설정
  - `row` , `row-reverse` , `column`, `column-reverse` 
- `flex-wrap` : 요소들이 강제로 한 줄로 배치되게 할 것인지 여부 설정, 아이템이 컨테이너를 벗어나는 경우 해당 영역 내에 배치되도록 설정
  - `wrap`, `nowrap` (기본 값)
- `flex-flow` :`flex-direction`과 `flex-wrap`의 `shorthand` 
  - ex) `flex-flow: row nowrap` 

### 2.2 공간 나누기

- `justify-content` : `main axis` 를 기준으로 공간 배분
- `align-content` : `cross axis` 를 기준으로 공간 배분 (거의 활용되지 않음)

### 2.3 정렬

- `align-items` : 모든 아이템을 `cross axis` 기준으로 정렬
- `align-self` : 개별 아이템을 정렬

## 3. Bootstrap

### 3.1 Grid system

- Bootstrap Grid system 은 flexbox로 제작됨

- Column : 실제 컨텐츠를 포함하는 부분
- Gutter : 칼럼과 칼럼 사이의 공간 (사이 간격)
- Container : Column들을 담고 있는 공간

```html
<div class="container">
    <div class="row">
        <div class="col"></div>
        <div class="col"></div>
        <div class="col"></div>
    </div>
</div>
```

