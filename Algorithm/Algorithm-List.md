[TOC]



# Algorithm - List

- 시간 복잡도(Time Complexity)
  - 실제 걸리는 시간을 측정, 실행되는 명령문의 개수로 계산
  - 빅-오 표기법(Big-Oh Notation) : 시간 복잡도 함수 중에서 가장 큰 영향력을 주는 최고차항 n만 표시 

## 1. 1차원 배열

- 1차원 배열 입력받기

```python
list = list(map(int, input().split()))
```



## 2. 2차원 배열

- 1차원 List를 묶어놓은 List => 세로의 길이(행), 가로의 길이(열) 필요함
- 2차원 배열 입력받기

```python
matrix = [list(map(int, input().split())) for _ in range(n)]
```

### 1. 행 우선 순회

```python
n*m 배열
for i in range(n):
    for j in range(m):
        arr[i][j]
```

### 2. 열 우선 순회

```python
n*m 배열
for j in range(m):
    for i in range(n):
        arr[i][j]
```

### 3. 역-행 우선순회

```python
n*m 배열
for i in range(n-1, -1, -1):
    for j in range(m):
        arr[i][j]
```

### 4. 역-열 우선순회

```python
n*m 배열
for j in range(m-1, -1, -1):
    for i in range(n):
        arr[i][j]
```

### 5. 지그재그 순회

```python
for i in range(n):
    for j in range(m):
        # 짝수열일 때는 왼-오 순회
        # 홀수일 때는 오-왼 순회 (시작이 m -1이 되게 코드 짜면 됨)
        arr[i][j + (m - 1 - j) * (i % 2)]
```

### 6. 델타

```python
가로 인덱스 i, 세로 인덱스 j
di = [-1, 1, 0, 0]
dj = [0, 0, -1, 1]  # 상 하 좌 우
```

- 벽에 제한을 두자
  - `if 0 <= i < n and 0 <= j < n: ` 
  - 다른 조건이랑 같이 있을 때 **무조건** 인덱스부터 쓰기

### 7. 전치 행렬

```python
#1
for i in range(n):
    for j in range(m):
        if i < j:
            lst[i][j], lst[j][i] = lst[j][i], lst[i][j]
#2
lst = list(map(list, zip(*lst)))
# map 안에 있는 list는 zip에서 나온 튜플을 리스토 변환하는 역할
```

### 8. 오른쪽 90도 회전

```python
lst = list(map(list, zip(*lst[::-1])))
#순서를 거꾸로 한 것을 인덱스 0, 1, ~끼리 합치기
```

### 9. 왼쪽으로 90도 회전

```python
lst = list(map(list, zip(*lst)))[::-1]
```

- 8, 9번은 정치행렬에서 순서 바꾸는 것으로 아이디어 얻기

### 10. 점 대칭

```python
lst = list(map(lst, zip(*lst[::-1])))[::-1]
```



## 3. 정렬의 종류

### 1. 버블 정렬(Bubble Sort)

- 인접한 두 개의 원소를 비교하며 자리를 계속 교환하는 방식
- 시간 복잡도 O(n**2)

```python
def bubble sort(numbers):
    for i in range(len(numbers)-1, 0, -1):
        for j in range(i):
            if numbers[j] > numbers[j + 1]:
                numbers[j], numbers[j + 1] = numbers[j + 1], numbers[j]
    return numbers
```



### 2. 카운팅 정렬(Counting Sort)

- 항목들의 순서를 결정하기 위해 집합에 각 항목이 몇 개씩 있는지 세는 작업을 한다.
- 시간 복자도 O(n + k) ; n은 리스트 길이, k는 정수의 최대값

```python
def counting sort(numbers, k):
    counting_arr = [0] * (k + 1)  # 카운트 공간을 할당하기 위해 제일 큰 정수 k라고 하자
    result = [-1] * len(numbers)
    for num in numbers:
        counting_arr[num] += 1  # num을 카운트 배열의 인덱스 위치에 하니씩 더한다
    for i in range(K):
        # 누적합 구하기
        counting_art[i + 1] = counting_arr[i] + counting_arr[i + 1]
    for j in range(len(numbers) - 1, -1, -1):
        counting_arr[numbers[j]] -= 1
        result[counting_arr[numbers[j]]] = numbers[j]
    return result
```



### 3. 선택 정렬(Selection Sort)

- 주어진 자료들 중 가장 작은 값의 원소부터 차례대로 선택하여 위치를 교환하는 방식
- 시간 복잡도: O(n ** 2)

```python
def selection_sort(arr):
    for i in range(len(arr) - 1):
        min_val = i
        for j in range(i + 1, len(arr)):
            if a[min_val] > a[j]:
                min_val = j
        arr[i], arr[min_val] = arr[min_val], arr[i]
```

### 3-1. 셀렉션 알고리즘(Selection Algorithm)

- 저장되어 있는 자료로부터 k번째 큰 혹은 작은 원소를 찾는 방법

```python
def select(arr, k):
    for i in range(k):
        min_val = i
        for j in range(i + 1, len(arr)):
            if arr[min_val] > arr[j]:
                min_val = j
        arr[i], arr[min_val] = arr[min_val], arr[i]
    return arr[k - 1]
```



### 4. 퀵 정렬(Quick Sort)

### 5. 삽입 정렬(Insertion Sort)

### 6. 병합 정렬(Merge Sort)



## 4. 부분집합 생성하기

- 집합의 원소가 n개 일 때 공집합을 포함한 부분집합의 수는 `2 ** n` 개

- 비트 연산자
  - `&` 비트 단위로 AND 연산을 한다.
  - `|` 비트 단위로 OR 연산을 한다.
  - `<<` 피연산자의 비트 열을 왼쪽으로 이동시킨다.
  - `>>` 피연산자의 비트 열을 오른쪽으로 이동시킨다.
- `1 << n` : 원소가 n개일 경우의 모든 부분집합의 수를 의미, `2 ** 0 = 1` 을 `n`번째로 옮김
  - `i & (1 << j)` : i의 j번째 비트가 1인지 아닌지 검사, j번 비트에만 1을 옮겨놓고 i번째에도 1이 있으면 1반환, i번째에 0이 없으면 0 반환

```python
n = len(arr)  # arr은 원소 리스트, n은 원소의 개수

for i in range(1 << n):  # 2 ** n
    for j in range(n):
        if i & (1 << j):
            print(arr[j], end=' ')
```



## 5. 검색(Search)

- 저장되어 있는 자료 중에서 원하는 항목을 찾는 작업

### 1. 순차 검색(sequential search)

- 일렬로 되어 있는 자료를 순서대로 검색하는 방법
- 시간 복잡도: O(n)

### 2. 이진 검색(binary search)

- 자료의기운데에 있는 항목의 키 값과 비교하여 다음 검색의 위치를 결정하고 검색을 계속 진행하는 방법
- **이진 검색을 하기 위해서는 자료가 정렬된 상태여야 한다.** 

```python
def binary_search(a, key):  # a는 리스트 key는 찾는 값
    start = 0
    end = len(a) - 1
    while start <= end:
        middle = (start + end) // 2
        if a[middle] == key:
            return middle
        elif a[middle] > key:  # 찾는 값이 중간값보다 작으면 end 인덱스 이동
            end = middle - 1
        else:  # 찾는 값이 중간값보다 크면 start 인덱스 이동
            start = middle + 1
    return -1  # while문 끝날 때까지 안나오면 없는 것
            
```

```python
def binary_search_recur(a, start, end, key):
    if start > end:
        return -1
    else:
        middle = (start + end) // 2
        if a[middle] == key:
            return middle
        elif a[middle] > key:
            return binary_search_recur(a, start, middle - 1, key)
        else:
            return binary_search_recur(a, middle + 1, end, key)
```



## 5. Linked List
