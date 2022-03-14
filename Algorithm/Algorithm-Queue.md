[TOC]

# Queue

> 선입선출구조: 큐에 삽입한 순서대로 원소가 저장되어, 가장 먼저 삽입된 원소가 가장 먼저 삭제된다.



## 1. 선형 큐

- 1차원 배열을 이용한 큐
  - `front` : 저장된 첫번째 원소의 인덱스
  - `rear` : 저장된 마지막 원소의 인덱스
- 상태 표현
  - 초기 상태: `front = rear = -1`
  - 공백 상태: `front == rear `
  - 포화 상태: `rear == n - 1` (n은 배열의 크기)

### 선형 큐 주요 연산

1. `enQueue(item)` : `rear = rear + 1, Q[rear] = item`  
2. `deQueue()` :  `front = front + 1, return Q[front]`
3. `Qpeek()` : `return Q[front + 1]` 

### 선형 큐 이용시 문제점

- 선형 큐를 이용하여 원소의 삽입과 삭제를 계속할 경우, 배열의 앞부분에 활용할 수 있는 공간이 있음에도 불구하고 `rear = n - 1` 인 상태, 포화 상태로 인식하여 더 이상 삽입 불가능



## 2. 원형 큐

> 선형 큐 문제점 해결방법: 1차원 배열을 사용하지만 논리적으로 배열의 처음과 끝이 연결되어 원형 형태를 이룬다고 가정

- 상태 표현
  - 초기 상태: `front = rear = 0`
  - 공백 상태: `front = rear` 
  - 포화 상태: `front == (rear + 1) / n`   

### 원형 큐 주요 연산

1. `enQueue(item)` : `rear = (rear + 1) / n, Q[rear] = item` 
2. `deQueue()`: `front = (front + 1) / n, return Q[front]`
3. `Qpeek()`: `return Q[front + 1 / n]` 

 ```python
 # 파이썬 리스트를 이용하여 원형 큐 구현
 
 def isEmpty():
     return len(queue) == 0
 
 def enQueue(item):
     queue.append(item)
     
 def deQueue():
     if isEmpty():
         print('Empty')
     else:
         return queue.pop(0)
     
 def Qpeek():
     if isEmpty():
         print('Empty')
     else:
         return queue[0]
 ```

