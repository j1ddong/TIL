## 1. 순열 구현

- 순서가 있는 비복원 추출

```python
# lst: 추출할 리스트, s: 추출한 값이 들어갈 인덱스 r: 추출할 개수
def permutations(lst, s, r):
    if s == r:  # 종료 조건
        print(result)
        return
    for i in range(len(lst)):
        if not used[i]:  # 또 사용하지 않기 위함
            result[s] = lst[i]
            used[i] = 1
            permutations(lst, s + 1, r)
            used[i] = 0

arr = ['A', 'B', 'C', 'D']
used = [0] * len(arr)  # 비복원을 하기 위함
result = [None] * 2  # 추출한 결과가 들어갈 리스트
permutations(arr, 0, 2)

"""
['A', 'B']
['A', 'C']
['A', 'D']
['B', 'A']
['B', 'C']
['B', 'D']
['C', 'A']
['C', 'B']
['C', 'D']
['D', 'A']
['D', 'B']
['D', 'C']
"""
```

- 순서가 있는 복원 추출

```python
# lst: 추출할 리스트, s: 추출한 값이 들어갈 인덱스 r: 추출할 개수
def permutations(lst, s, r):
    if s == r:  # 종료 조건
        print(result)
        return
    for i in range(len(lst)):
        result[s] = lst[i]
        used[i] = 1
        permutations(lst, s + 1, r)
        used[i] = 0

arr = ['A', 'B', 'C', 'D']
used = [0] * len(arr)  # 비복원을 하기 위함
result = [None] * 2  # 추출한 결과가 들어갈 리스트
permutations(arr, 0, 2)

"""
['A', 'A']
['A', 'B']
['A', 'C']
['A', 'D']
['B', 'A']
['B', 'B']
['B', 'C']
['B', 'D']
['C', 'A']
['C', 'B']
['C', 'C']
['C', 'D']
['D', 'A']
['D', 'B']
['D', 'C']
['D', 'D']
"""
```

## 2. 조합 구현

- 순서가 없는 비복원 추출

```python
# lst: 추출할 리스트, s: 추출한 값이 들어갈 인덱스 r: 추출할 개수 idx: 이미 만들어진 조합을 피하기 위한 인덱스
def combinations(lst, s, r, idx):
    if s == r:  # 종료 조건
        print(result)
        return
    for i in range(idx, len(lst)):  # idx 안해주면 ['A', 'B'] 생긴 다음 ['B', 'A'] 생김
        if not used[i]:  # 또 사용하지 않기 위함
            result[s] = lst[i]
            used[i] = 1
            combinations(lst, s + 1, r, i)
            used[i] = 0

arr = ['A', 'B', 'C', 'D']
used = [0] * len(arr)  # 비복원을 하기 위함
result = [None] * 2  # 추출한 결과가 들어갈 리스트
combinations(arr, 0, 2, 0)

"""
['A', 'B']
['A', 'C']
['A', 'D']
['B', 'C']
['B', 'D']
['C', 'D']
"""
```

- 순서가 없는 복원 추출

```python
# lst: 추출할 리스트, s: 추출한 값이 들어갈 인덱스 r: 추출할 개수
def combinations(lst, s, r, idx):
    if s == r:  # 종료 조건
        print(result)
        return
    for i in range(idx, len(lst)):  # idx 안해주면 ['A', 'B'] 생긴 다음 ['B', 'A'] 생김
        result[s] = lst[i]
        used[i] = 1
        combinations(lst, s + 1, r, i)
        used[i] = 0

arr = ['A', 'B', 'C', 'D']
used = [0] * len(arr)  # 비복원을 하기 위함
result = [None] * 2  # 추출한 결과가 들어갈 리스트
combinations(arr, 0, 2, 0)

"""
['A', 'A']
['A', 'B']
['A', 'C']
['A', 'D']
['B', 'B']
['B', 'C']
['B', 'D']
['C', 'C']
['C', 'D']
['D', 'D']
"""
```