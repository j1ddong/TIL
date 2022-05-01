[TOC]



# Browser

### 브라우저가 할 수 있는 일

- DOM(Document Object Model) 조작 : 문서 (HTML) 조작
  - 문서를 구조화하고, 구조화된 구성 요소를 하나의 객체로 취급하여 다루는 논리적 **트리** 모델
  - 주요 객체: window, document, navigator, history
- BOM(Browser Object Model) 조작 : navigator, screen, location, frames, history
  - 브라우저의 창이나 프레임을 추상화해서 프로그래밍적으로 제어할 수 있도록 제공하는 수단
  - 버튼, URL 입력창, 타이틀 바 등 브라우저 윈도우 및 페이지 일부분을 제어 가능
- JavaScript Core (ECMAScript)



# JavaScript

## 변수

- 식별자는 변수를 구분할 수 있는 변수명을 말함 [카멜 케이스로 작성]

### let

- 재할당 할 예정인 변수 선언 시 사용
- 변수 재선언 불가능
- 블록 스코프

### const

- 재할당 할 예정이 없는 변수 선언 시 사용
- 변수 재선언 불가능
- 블록 스코프

**블록 스코프**

-  if, for, 함수 등의 중괄호 내부를 가리킴, 블록 스코프를 가지는 변수는 블록 바깥에서 접근 불가능

### var

- 재선언 재할당 모두 가능
- **호이스팅**되는 특성으로 인해 예기치 못한 문제 발생 가능 
  - 변수를 선언 이전에 참조할 수 있는 현상, 변수 선언 이전의 위치에서 접근 시 **undefined**반환 
- 함수 스코프



## 데이터 타입

![image-20220430154454030](C:\Users\jiunHan\Desktop\Git hub\TIL\JS\image\image-20220430154454030.png)

### 원시 타입(Primitive type)

- 객체가 아닌 기본 타입, 변수에 해당 타입의 값이 담김, 다른 변수에 복사할 때 실제 값이 복사됨

#### 1. 숫자(Number) 타입

- 부동소수점 형식을 따름, `NaN`: 계산 불가능한 경우 반환되는 값

#### 2. 문자열(string) 타입

- 텍스트 데이터를 나타내는 타입
- 템플릿 리터럴(Template Literal) : backtick(`)으로 표현하며, ${expression} 형태로 표현식 삽입 가능

#### 3. undefined

- 변수의 값이 없음을 나타내는 데이터 타입, 변수 선언 이후 직접 값을 할당하지 않으면 자동으로 undefined가 할당

#### 4. null

- 변수의 값이 없음을 의도적으로 표현할 때 사용하는 데이터 타입
- type of 연산자의 결과 object로 표현됨

#### 5. Boolean 

- 논리적 참, 거짓을 나타내는 타입

![image-20220430155619813](C:\Users\jiunHan\Desktop\Git hub\TIL\JS\image\image-20220430155619813.png)

### 참조 타입(Reference type)

- 객체 타입의 자료형, 변수에 해당 객체의 참조 값이 담김, 다른 변수에 복사할 때 참조 값이 복사됨

#### 1. 함수(Functions)

> 함수 선언식: `function name (args) {}`, 호이스팅 가능
>
> 함수 표현식: `const name = function (arga) {}` ; 함수 이름 생략하고 익명 함수로 정의 가능

- 매개변수와 인자의 개수 불일치 허용
- `rest operator(...)`
  - 만약 `rest operator`로 처리한 매개변수에 인자가 넘어오지 않을 경우에는 빈 **배열**로 처리
- `spread operator(...)`: 배열 인자를 전개하여 전달 가능

##### 참고

- 함수 표현식을 `var`키워드로 작성한 경우, 변수 선언 전 `undefined`로 초기화 되어 함수가 아니라는 `TypeError` 발생

##### 화살표 함수(Arrow Function)

> `function` 키워드 생략 가능
>
> 함수의 매개변수가 하나뿐이라면 `()`도 생략 가능
>
> 함수 몸통이 표현식 하나라면 `{}`과 `return` 생략 가능

```javascript
const arrow1 = function (name) {
    return `hello, ${name}`
}
const arrow2 = (name) => { return `hello, ${name}`}
const arrow3 = name => { return `hello, ${name}`}
const arrow4 = name => `hello, ${name}`
```



#### 2. 배열(Arrays)

> 키와 속성들을 담고 있는 참조 타입의 `객체(object)`

- 순서를 보장하고, 0을 포함한 양의 정수 인덱스로 특정 값에 접근 가능
- 메서드 호출 시 인자로 `callback`함수를 받는다 [`callback`함수는 어떤 함수 내부에서 실행될 목적으로 인자를 넘겨받는 함수를 말한다]

**forEach**

> arr.forEach(callback(element[ , index[, array]]))

#### 3. 객체(Objects)

> 객체는 속성(property)의 집합이며, 중괄호 내부 key와 value 쌍으로 표현

- `key`는 문자열 타입만 가능, `value`는 모든 타입(**함수** 포함) 가능
- 객체 요소 접근은 점 또는 대괄호 가능

**메서드**

- 메서드는 어떤 객체의 속성이 참조하는 함수

**ES6 문법**

1. 속성명 축약: 객체를 정의할 때 `key`와 할당하는 변수의 이름이 같으면 축약 가능
2. 메서드 축약: 메서드 선언 시 `function` 키워드 생략 가능
3. 계산된 속성: 객체를 정의할 때 `key` 이름을 표현식으로 이용하여 동적으로 생성 가능
4. 구조 분해 할당: 배열 또는 객체를 분해하여 속성을 변수에 쉽게 할당할 수 있는 문법
5. `spread operator`: 객체 내부에서 객체 전개 가능

## 연산자

#### 1. 할당 연산자

- 오른쪽에 있는 피연산자의 평가 결과를 왼쪽 피연산자에 할당하는 연산자

#### 2. 비교 연산자

- 피연사나자들을 비교하고 결과값을 boolean으로 반환하는 연산자

#### 3. 동등 비교 연산 (==)

- 두 피연산자가 같은 값으로 평가되는지 비교 후 boolean 값 반환
- 비교할 때 암묵적 타입 변환을 통해 타입을 일치시킨 후 같은 값인지 비교

#### 4. 일치 비교 연산자 (===)

- 두 피연산자가 같은 값으로 평가되는지 비교 후 boolean 값 반환
- 엄격한 비교가 이루어지며 암묵적 타입 변환이 발생하지 않음

#### 5. 논리 연산자

- `&&` : and 연산
- `||`: or 연산
- `!`: not 연산

#### 6. 삼항 연산자

- 세 개의 피연산자를 사용하여 조건에 따라 값을 반환하는 연산자
- `const result =  true ? 1 : 2`  // 1



## 조건문

### if

```javascript
if (condition) {
    // do something
} else if {
    // do something
} else {
    // do something
}
```

### switch

- 조건 표현식의 결과값이 어느 값(case)에 해당하는지 판별
- `break` 및 `default`문은 선택적으로 사용 가능하나, `break`문이 없을 경우 `default`문을 실행할 때까지 다음 조건문 실행

```javascript
switch (expression) {
    case 'first value': {
        // do something
        break
    }
    case 'second value': {
        // do something
        break
    } 
    default: {
        // do something
    }
}
```



## 반복문

### 1. while

```javascript
while (condition) {
    // do something
}

let i = 0
while (i < 6) {
    console.log(i)
    i += 1
}
```

### 2. for

```javascript
for (initialization; condition; expression) {
    // do something
}
```

- `initialization` : 최초 반복문 진입 시 1회만 실행되는 부분
- `condition` : 매 반복 시행 전 평가되는 부분
- `expression` : 매 반복 시행 후 평가되는 부분

### 3. for ... in

- 객체(object)의 속성(key)들을 순회할 때 사용

```javascript
for (variable in object) {
    // do something
}
```

### 4. for ... of

- 반복 가능한(iterable) 객체를 순회하며 값을 꺼낼 때 사용

```javascript
for (variable of iterables) {
    // do something
}
```

![image-20220430163827605](C:\Users\jiunHan\Desktop\Git hub\TIL\JS\image\image-20220430163827605.png)

## this

> JS의 this는 실행 문맥에 따라 다른 대상을 가리킨다. 
>
> class 내부 생성자 함수에서 `this`는 생성되는 객체를 가리킴
>
> 메서드 `this`는 해당 메서드가 소속된 객체를 가리킴
>
> 위의 두가지 경우를 제외하면 모두 최상의 객체를 가리킴