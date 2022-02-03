[TOC]



# OOP

- Object Oriented Programming(객체 지향 프로그래밍)
- 장점: 코드의 직관성, 활용의 용이성, 변경의 유연성

## 1. 객체(Object)

- 모든 객체는 타입(type), 속성(attribute), 조작법(method)을 가진다.

## 2. OOP  기초

```python
class Myclass:
    pass
----------------
my_instance = Myclass() #인스턴스 생성
my_instance.my_attribute #속성 접근
my_instance.my_method() #메서드 호출
```

- `instance`는 특정 클래스의 실제 데이터 예시
- `instance method`: 메서드 호출시, 첫번째 인자로 인스턴스 자기자신에 해당하는 `self`가 전달된다.

```python
class nameclass:
    def my_method(self):
        pass
```

### 1. 생성자 메서드

- `__init__`: 생성자를 활용하면 인스턴스가 생성될 때 인스턴스의 속성을 정의할 수 있다.

## 2. Class

- 객체들의 분류(class)를 정의할 때 쓰이는 키워드이다.

```python
class <클래스 이름>:
    <statement>
```

### 1. 클래스 변수

- 클래스의 속성이자, 모든 인스턴스가 공유한다. 
- 클래스 선언 내부에서 정의하고 `클래스.변수명`으로 접근 및 할당한다.

### 2. 클래스 메서드

- `@classmethod`데코레이터를 사용하여 정의한다.
- 메서드 호출시, 첫 번째 인자로 클래스 `cls`가 전달된다.

### 3. 스태틱 메서드

- 인스턴스와 클래스 속성과 무관한 매서드이고, 호출시 자동적으로 전달되는 인자가 없다.
- `@staticmethod`데코레이터를 사용하여 정의한다.



## 3. 상속

- `issubclass(class, classinfo)`

- `isinstance(object, classinfo)` 

- `super()`

  - ```python
    class ChildClass(ParentClass):
        def method(self, arg):
            super().method(arg)
    ```

  - 