[TOC]



# Python 

## 1. 기초문법(Syntax)

### 1. 변수(Variable)

#### 1. 정의 및 사용 방법

- 컴퓨터 메모리에 저장되어 있는 객체를 참조하기 위해 사용되는 이름을 의미한다.
- 동일 변수에 다른 객체를 할당할 수 있다. 
- 할당연산자(Assignment Operator): `=`을 통해 할당된다.
- 변수의 데이터 타입을 확인하기 위해서는 `type()`, 메모리 주소를 확인하기 위해서는 `id()`를 활용한다.

#### 2. 식별자(Identifiers)

- 식별자는 변수, 함수, 모듈, 클래스 등을 식별하는데 사용되는 이름을 의미한다.
- 영문 알파벳(대문자와 소문자), 언더스커어(_), 숫자로 구성되고, 첫 글자에 숫자 올 수 없다.
- `import keyword``print(keyword.kwlist)` 파이썬이 가지고 있는 키워드, 예약어는 사용할 수 없다.

### 2. 사용자 입력(Input)

- 사용자로부터 값을 즉시 입력받을 수 있는 파이썬 내장함수 `input([prompt])`

### 3. 주석(Comment)

- 한 줄 주석은 `#`으로 표시하고, 여러 줄 주석은 `"""` 또는 `'''` (multiline string)으로 표현 가능



---

## 2. 자료형(Data Type)

### 1. 자료형 분류 

- Boolean Type, Numeric Type[int, float, complex], String Type, None



### 2. Boolean Type(불린형)

- `True` 와 `False`로 이루어진 `bool type`
- `bool()`함수는 특정 데이터가 `True`인지 `False`인지 검증한다.



### 3. Numeric Type(수치형)

#### 1. int(정수, integer)

- 모든 정수는 `int`로 표현 가능하고, 8진수는 `0o`, 2진수는 `0b`, 16진수는 `0x`로도 표현 가능
- 파이썬에서는 정수 자료형에서 임의 정밀도 산술(arbitrary-precision arithmetic)을 사용하기 때문에 오버플로우 발생하지 않는다.
  - `import sys``max_int = sys.maxsize`

#### 2. float(부동소수점, 실수, floating point number)

- 컴퓨터가 실수를 표현하는 과정에서 부동소수점을 사용하며, 항상 같은 값으로 일치되지 않는다.(floating point rounding error)
  - 컴퓨터식 지수 표현 방식: `e` 사용  `314e-2` == `3.14`
- 실수 연산 문제점 해결 방법
  - `abs(a - b) <= 1e -10` 
  - `import sys` `abs(a - b) <= sys.float_info.epsilon`
  - `import math` `math.isclose(a, b)`

#### 3. complex(복소수, complex number)

- `class complex([real[,imag]])` , `real + imag*1j`



### 3. String Type(문자열)

#### 1. 문자열 정의, 사용 방법

- 모든 문자는 `str`로 표현, Single quotes(`'`) 나 Double quotes(`"`)를 활용하여 표현 가능
- 중첩 따옴표(Nested Quotes)
  - `'문자열 안에 "따옴표" 사용 방법'` , `"문자열 안에 '따옴표' 사용 방법"` 
- 삼중 따옴표(Triple Quotes)
  - `"""`문자열 안에 작은 따옴표나 큰 따옴표 사용 가능하고, 개행 문자 없이 여러 줄 그대로 출력 가능

#### 2. Escape sequence(이스케이프 시퀀스)

|   \n    |  \t  |     \r     |    \0    | \\\  |     `\'`     |     `\"`     |
| :-----: | :--: | :--------: | :------: | :--: | :----------: | :----------: |
| 줄 바꿈 |  탭  | 캐리지리턴 | 널(Null) |  \   | 단일인용부호 | 이중인용부호 |

#### 3. String interpolation

##### 1. % - formatting

- `%d`: 정수 `%f`: 실수 `%s`: 문자열

```python
name = 'world'
print('hello %s' % name)
print('전화번호 %d' % number)
```

##### 2. str.foramt()

```python
print('hello {}'.format(name))
```

##### 3. f - strings

```python
print(f'hello {name}')
```

- f - strings에서는 형식을 지정할 수도 있고, 연산과 출력 형식 지정도 가능하다. 



### 4. None Type

- 값이 없음을 표현하기 위해 `None`타입 존재



## 3. 컨테이너 (Container)

- 여러 개의 값을 저장할 수 있는 객체를 의미하며, 서로 다른 자료형을 저장할 수 있다.
- 시퀀스(Sequence)형: 순서가 있는(ordered)데이터 ; `list, tuple, range, string`
  - 인덱스를 통해 접근 가능하다. 
- 비시퀀스(Non-sequence)형: 순서가 없는(unordered)데이터 ` set, dict`

### 1. List

- 대괄호`[]` 및 `list()`를 통해 생성 가능하고, 수정 가능`(mutable)`하다.
- 값에 접근 방법:  `list[i]`



### 2. Tuple

- `()` 로 묶어서 표현하고, 수정 불가능`(immutable)`하다.
- 하나의 항목으로 구성된 튜플을 생성 시 값 뒤에 쉼표를 붙인다. `a = 1, `



### 3. Range

- `range(n, m, s)`: n부터 m-1까지 +s만큼 증가한다.



### 4. Packing / Unpacking Operator

- 모든 시퀀스형은 패킹/언패킹 연산자 `*`를 사용하여 객체의 패킹 또는 언패킹이 가능하다.

#### 1. Packing

- 대입문의 좌변 변수에 위치, 우변의 객체 수가 좌변의 변수 수보다 많을 경우 객체를 순서대로 대입한다. 
- 나머지 항목들은 모두 별 기호 표시된 변수에 리스트로 대입한다. 

#### 2. Unpacking

- `argument(전달인자)`가 `*`로 시작하는 경우 argument unpacking이라고 부른다.
- 언패킹의 경우 튜플 형태로 대입한다.  



### 5. Set

- `set()`를 통해 빈세트 생성 가능하다.
- 순서가 없고 중복된 값이 없으며, 수정 가능(mutable)하다.
- 활용 가능한 연산자는 차집합(` - `), 합집합(`|`), 교집합(`&`)이다.



### 6. Dictionary

- `{}`나 `dict()`로 만들 수 있으며 `key`와 `value`가 쌍으로 이루어져있다. 
- `key`는 변경 불가능한(immutable)한 데이터만 가능하다.
  - immutable: string, integer, float, boolean, tuple, range
- `value`는 모든 객체가 가능하다.



## 4. 형 변환(Type conversion, Typecasting)

### 1. 암시적 형변환(Implicit Typecasting)

- 사용자가 의도하지 않았지만, 파이썬 내부적으로 자동으로 형변환하는 경우를 의미한다.
- `bool`, `Numeric Type(int, float, complex)`



### 2. 명시적 형변환(Explicit Typecasting)

- `int()`: string, float를 int로 변환
- `float()`: string, int를 float로 변환
- `str()`: int, float, list, tuple, dictionary를 문자열로 변환



### 3. 컨테이너형 형변환

- `list` => `str, tuple, set`
- `tuple` => `str, list, set`
- `range` => `str, list, set, tuple`
- `dictionary` => `str, list, tuple, set`
- `string` => `list, tuple, set`



## 5. 연산자(Operator)

### 1. 산술 연산자(Arithmetic Operator)

- `/`나눗셈, `//`몫, `%` 나머지, `**` 거듭제곱
- 나눗셈(`/`)은 항상 float를 돌려줘서 정수 결과를 얻으려면 `//` 연산자 이용



### 2. 비교 연산자, 식별 연산자

- `==` 값을 비교할 때 사용하고 `is`객체를 비교할 때 쓴다.



### 3. 논리 연산자, 복합 연산자, 멤버쉽 연산자

- `a and b`: `a와 b 모두 True시만 True`, `a or b`: `a와 b 모두 False시만 False`
- 복합 연산자는 연산과 할당이 함께 이루어진다.
- 요소가 시퀀스에 속해있는지 확인할 수 있다. `in`연산자, `not in` 연산자



### 4. 시퀀스형 연산자(Sqeuence Type Operator)

- 산술 연산자(`+`): 시퀀스를 연결할 수 있다.(`range`제외)
- 반복 연산자(`*`): 시퀀스를 반복할 수 있다. (`range`제외)



### 5. 인덱싱/ 슬라이싱(Indexing/Slicing)

- 인덱싱: 시퀀스의 특정 인덱스 값에 접근할 수 있다. 
- 슬라이싱: `Sequence[start:end[:step]]