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



## 3. 우선순위 큐

> 항목이 정렬된 상태로 유지되고(`heap`모듈을 사용) 가장 **낮은** 값을 갖는 항목이 먼저 꺼내진다

### 3-1 queue.PriorityQueue()

> queue.py 모듈을 통한 우선순위 큐 구현 [PriorityQueue](https://docs.python.org/ko/3.7/library/queue.html#queue.PriorityQueue)

#### Method

- `Queue.put`(*item*, *block=True*, *timeout=None*)

큐에 *item*을 넣습니다. [선택적 인자 *block*이 참이고 *timeout*이 `None`(기본값)이면, 사용 가능한 슬롯이 확보될 때까지 필요하면 블록합니다. *timeout*이 양수면, 최대 *timeout* 초 동안 블록하고 그 시간 내에 사용 가능한 슬롯이 없으면 `Full` 예외가 발생합니다. 그렇지 않으면 (*block*이 거짓), 빈 슬롯이 즉시 사용할 수 있으면 큐에 항목을 넣고, 그렇지 않으면 `Full`예외를 발생시킵니다 (이때 *timeout*은 무시됩니다).]

- `Queue.get`(*block=True*, *timeout=None*)

  큐에서 항목을 제거하고 반환합니다. 선택적 인자 *block*이 참이고 *timeout*이 `None`(기본값)이면, 항목이 사용 가능할 때까지 필요하면 블록합니다. *timeout*이 양수면, 최대 *timeout* 초 동안 블록하고 그 시간 내에 사용 가능한 항목이 없으면 `Empty`예외가 발생합니다. 그렇지 않으면 (*block*이 거짓), 즉시 사용할 수 있는 항목이 있으면 반환하고, 그렇지 않으면 `Empty` 예외를 발생시킵니다 (이때 *timeout*은 무시됩니다).

- 참고

[`collections.deque`](https://docs.python.org/ko/3.7/library/collections.html#collections.deque) is an alternative implementation of unbounded queues with fast atomic `append()` and `popleft()` operations that do not require locking.



### 3-2 heapq

> heapq.py 모듈을 통한 우선순위 큐 구현 [heaq](https://docs.python.org/ko/3.7/library/heapq.html#module-heapq)

- This implementation uses arrays for which `heap[k] <= heap[2*k+1]` and `heap[k] <= heap[2*k+2]` for all *k*, counting elements from zero. >> **min heap** 통해 구현
  - `zero-based indexing`  >> `heap[0]` is the smallest item ; 노드가 0부터 시작

#### 3-2-1. How to create heapq

> To create a heap, use a list initialized to `[]`, or you can transform a populated list into a heap via function [`heapify()`](https://docs.python.org/ko/3.7/library/heapq.html#heapq.heapify).

#### 3-2-2 Method

- `heapq.heappush`(*heap*, *item*)

  Push the value *item* onto the *heap*, maintaining the heap invariant.

- `heapq.heappop`(*heap*)

  Pop and return the smallest item from the *heap*, maintaining the heap invariant. If the heap is empty, `IndexError`is raised. To access the smallest item without popping it, use `heap[0]`

- `heapq.heappushpop`(*heap*, *item*)

  Push *item* on the heap, then pop and return the smallest item from the *heap*. The combined action runs more efficiently than `heappush()`followed by a separate call to `heappop()`.
