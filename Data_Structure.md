[TOC]

# Data Structure

- 데이터 구조 혹은 자료구조란 데이터에 효율적인 접근 및 수정을 가능케 하는 데이터의 구성, 관리 및 저장형식을 의미한다.
- 데이터 값들, 해당 값들의 관계, 그리고 해당 데이터들에게 적용할 수 있는 함수와 명령어들의 모음을 총칭하는 단어이다.

## 1. 문자열(String)

- 변경할 수 없고(immutable), 순서가 있고(ordered), 순회 가능한(iterable)

### 1. `str.find(sub[,start[,end]])` vs `str.index(sub[,start[,end]])`

-  `str.find(sub[,start[,end]])` x의 첫 번째 위치를 반환한다. 만일 리스트 내에 x가 없으면 `-1`을 반환한다. 

- `str.index(sub[,start[,end]])` x의 첫 번째 위치를 반환한다. 만일 x가 리스트 내에 없으면, 오류가 발생한다.

### 2. 문자열 검증 메서드 `str.isspace()`, `str.istitle()`

- `str.isspace()`: 문자열 내에 공백 문자만 있고, 적어도 하나의 문자가 존재하는 경우 `True`를 돌려주고, 그렇지 않으면 `False`를 반환
-  `str.istitle()`: 문자열이 제목 케이스 문자열이고 하나 이상의 문자가 있는 경우 `True` 반환

### 3. `'separator'.join(iterable)`

- `iterable`의 문자열들을 `separator(구분자)`로 이어 붙인 문자열을 반환한다. 

### 4. `str.split(sep=None, maxsplit=-1)` 

- sep를 구분자 문자열로 사용하여 문자열에 있는 단어들의 리스트를 돌려준다.



## 2. 리스트(List)

- 변경 가능하고(mutable), 순서가 있고(ordered),  순회 가능한(iterable)

### 1. `list.append(x)` vs `list.extend(iterable)`

-  `list.append(x)`리스트 끝에 항목을 더한다. `a[len(a):] = [x]`
  - `a.insert(len(a), x)` 와 같음 `insert()`에서 리스트 길이를 넘어서는 인덱스는 마지막에 추가된다.)
-  `list.extend(iterable)`리스트 끝에 이터러블의 모든 항목을 덧붙여서 확장한다. `a[len(a):] = iterable`

### 2. `list.remove(x)` vs `list.pop([i])`

- `list.remove(x)` 리스트에서 첫번째 x값 삭제한다. 없으면 `ValueError` 발생
-  `list.pop([i])` 리스트에서 주어진 위치에 있는 항목을 삭제하고 그 항목을 돌려준다. 인데스를 지정하지 않으면 `a.pop()`은 리스트 마지막 항목을 삭제하고 돌려준다.

### 3. `list.sort(*, key=None, reverse=False)`

- 내장함수 `sorted()`와는 다르게 원본 list를 변형시키고, None을 반환한다.
- reverse = False ; 오름차순 / reverse = True ; 내림차순
- key는 하나의 인자를 받는 함수를 지정하는데, iterable의 각 요소들로부터 비교 키를 추출하는데 사용된다. 

## 3. 튜플(tuple)

- 변경할 수 없는 불변(immutable)하고, 순서가 있고(ordered), 순회 가능한(iterable)

## 4. 셋(set)

- 변경 가능하고(mutable), 순서가 없고(unordered), 순회 가능한(iterable)

### 1. `.add(elem)` vs `.update(*others)`

-  `.add(elem)` elem을 셋(set)에 추가한다.
- `.update(*others)` 반드시 iterable 데이터 구조를 전달해야합니다.

### 2. `.remove(elem)` vs `.discard(elem)`

- elem을 셋(set)에서 삭제한다.
- `.remove(elem)`은 셋내에 존재하지 않으면 `KeyError` 발생, `.discard(elem)`에러 발생하지 않는다.

## 5. 딕셔너리(Dictionary)

- 변경 가능하고(mutable), 순서가 없고(unordered), 순회 가능한(iterable) `Key: Value` 페어의 자료구조

### 1. `.get(key[, default])`

- key를 통해 value를 가져온다. key가 존재하지 않을 경우 default = None을 반환한다.

### 2. `.setdefault(key[, default])`

- key가 딕셔너리에 없을 경우, default 값을 갖는 key를 삽입한 후 default = None 을 반환한다.

### 3. `.pop(key[,default])`

- key가 딕셔너리에 있으면 제거하고 그 값을 돌려준다. 그렇지 않으면 default를 반환한다.
- default가 없는 상태에서 해당 key가 딕셔너리에 없는 경우, `KeyError` 발생한다.



## 6. 얕은 복사와 깊은 복사

- 변경 가능한(mutable) 데이터 [`list`, `dict`, `set`]
- 복사하는 방법: 할당, 얕은 복사, 깊은 복사

- 할당(Assignment): 동일한 객체 참조한다.

### 1. 얕은 복사(Shallow Copy)

- `slice 연산자 [:]`
- `list()`활용 

### 2. 깊은 복사(Deep Copy)

- `import copy` `copy.deepcopy()`   