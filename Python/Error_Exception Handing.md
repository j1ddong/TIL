[TOC]



# Error & Exception Handing

## 1. Error

### 1. Syntax Error(문법 에러)

- invalid syntax
- EOL (end of line) / EOF(end of file)

### 2. Exception(예외)

- 문법적으로는 옳지만, 실행 시 발생하는 에러이다.
  - `ZeroDivisionError`: 0으로 나누었을 때 발생하는 에러
  - `NameError`: 지역 혹은 전역 이름 공간 내에서 정의되지 않은 변수를 호출하였을 경우 발생하는 에러
  - `TypeError`: 자료형이 올바르지 못한 경우, 힘수 호출 과정에서 필수 매개변수가 누락된 경우
  - `ValueError`: 자료형은 올바르나 값이 적절하지 않은 경우, 존재하지 않는 값을 찾고자 할 경우
  - `IndexError`: 존재하지 않는 index로 조회할 경우
  - `KeyError`: 존재하지 않는 key로 접근하는 경우
  - `ModuleNotFoundError`: 존재하지 않는 Module을 `import`하는 경우
  - `ImportError`: Module은 찾았으나 존재하지 않는 클래스/함수를 가져오는 경우
  - `KeyboardInterrupt`: 사용자가 임의로 실행을 중단한 경우
  - `IndentationError`: 들여 쓰기가 적절하지 않은 경우



## 2. Exception Handling(예외 처리)

### 1. try & except

```python
try:
    <code block 1>
except 예외 1:
    <code block 2>
except 예외 2:
    <code block 3>
else:
    <code block 4>
finally:
    <code block 5>
```

- `else`는 `try`절이 예외를 일으키지 않을 때 실행된다.
- 예외 2는 예외 1보다 더 지엽적이어야 한다.
- `finally`는 예외 발생 여부와 관계없이 `try`문을 떠날 때 항상 실행된다.

### 2. raise & assert

- `raise <에러>('메세지')`
- `assert Boolean experssion, error message` , 무조건 `AssertionError`가 발생