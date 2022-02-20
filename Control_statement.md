[TOC]



# Control statement(제어문)

## 1. Conditional Statement(조건문)

- `if`문은 반드시 참/거짓을 판단할 수 있는 조건과 함께 사용한다.

### 1. 문법

```python
if <expression>:
    <코드 블럭>
else:
    <코드 블럭>
```

- `else`는 선택적으로 사용한다. 



### 2. `elif` 복수 조건

- 2개 이상의 조건을 활용할 경우 `elif<조건>:`을 활용한다.



### 3. 조건 표현식(Conditional Expression)

- 삼항 연산자(Ternary Operator)

```python
true_value if <조건식> else false_value
```

```python
num = int(input('숫자를 입력해주세요: '))
value = num if num >= 0 else -num
print(value)
```



## 2. Loop Statement(반복문)

### 1. While 반복문

- While문은 조건식이 참인 경우 반복적으로 코드를 실행한다.
- 반드시 종료조건을 설정해야한다.

```python
while <조건식>:
    <코드 블럭>
```



### 2. For 반복문

- for문은 시퀀스(string, tuple, list, range)를 포함한 순회가능한 객체(iterable)의 요소들을 순회한다. 

```python
for <임시변수> in <순회가능한 데이터(iterable)>:
    <코드 블럭>
```

- dictionary에서 `for`문을 활용하는 4가지 방법

```python
#0 
for key in dict:
    print(key)
    print(dict[key])
    
#1
for key in dict.keys():
    print(key)
    print(dict[key])
    
#2
for val in dict.values():
    print(val)
    
#3
for key, value in dict.items():
    print(key, value)
```

#### 1. List Comprehension

```python
[expression for 변수 in iterable]
list(expression for 변수 in iterable)
```

```python
list_a = []
for number in range(1, 4):
    list.append(number ** 3)
    
list_b = [number ** 3 for number in range(1, 4)]
```

#### 2. Dictionary Comprehension

```python
{key: value for 요소 in iterable}
dict({key: value for 요소 in iterable})
```

```python
dict_a = {}
for number in range(1, 4):
    dict_a[number] = number ** 3
    
dict_b = {number: number**3 for number in range(1, 4)}
```



### 3. break, continue, for-else ; 반복문 제어

- break문은 반복문을 종료한다. (for나 while문에서 빠져나간다.)

- continue문은 continue 이후의 코드를 수행하지 않고, **다음 요소**부터 계속하여 반복을 수행한다.
- pass문은 들여쓰기 이후 문장이 필요하지만, 프로그램이 특별히 할 일이 없을 때 자리를 채우는 용도로 사용할 수 있다.
- for-else문은 끝까지 반복문을 실행한 이후에 실행된다. 단, 반복문이 break문으로 종료될 때는 실행되지 않는다.

