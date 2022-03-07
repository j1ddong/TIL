[TOC]



# Stack

> 물건을 쌓아 올리듯 자료를 쌓아 올린 형태의 자료구조

- 스택에 저장된 자료는 선형 구조를 갖는다. [선형구조: 자료 간의 관계가 1대 1]

- 마지막에 삽입한 자료를 가장 먼저 꺼낸다. **후입선출**

## 1. 연산

1. 삽입: 저장소에 자료를 저장한다. ; `push`
2. 삭제: 저장소에서 자료를 꺼낸다. ;`pop`
3. 스택의 top에  있는 `item`(원소)을 반환하는 연산 ; `peek` 



## 재귀호출

- 자기 자신을 호출하여 순환 수행되는 것

```python
def fibo(n):
    if n < 2:
        return n
    else:
        return fibo(n - 1) + fibo(n - 2)
```

- 문제점: 많은 중복 호출이 존재

 

## Memoization

> 컴퓨터 프로그램을 실행할 때 이전에 계산한 값을 메모리에 저장해서 매번 다시 계산하지 않도록 하여 전체적인 실행속도를 빠르게 하는 기술

- 동적 계획법의 핵심이 되는 기술

```python
# memo를 위한 배열을 할당하고, 모두 0으로 초기화 한다

def fibo_memo(n):
    global memo
    if n >= 2 and len(memo) <= n:
        memo.append(fibo(n - 1) + fibo(n - 2))
    return memo[n]
memo = [0, 1]
# DP recursive 방식
```



## Dynamic Programming

- 그리디 알고리즘과 같이 최적화 문제를 해결하는 알고리즘
- 동적 계획 알고리즘은 먼저 입력 크기가 작은 부분 문제들을 모두 해결한 후에 그 해들을 이용하여 보다 큰 크기의 부분 문제들을 해결하여 최종적으로 원래 주어진 입력의 문제를 해결하는 알고리즘
  - 문제를 부분 문제로 분할한다
  - 가장 작은 부분 문제부터 해를 구한다
  - 결과를 테이블에 저장하고, 테이블에 저장된 부분 문제의 해를 이용하여 상위 문제 해를 구한다.

```python
# 피보나치 수 DP 적용 (피보나치 수는 부분 문제의 답으로부터 본 문제의 답을 얻을 수 있으므로 최적 부분 구조로 이루어짐)
def fibo_dp(n):
    f = [0, 1]
    for i in range(2, n + 1):
        f.append(f[i - 1] + f[i - 2])
    return f[n]
# DP iterative(반복) 방식
```

- `memoization` 을 재귀적 구조로 사용하는 것보다 반복적 구조로 `DP`를 구현하는 것이 성능 면에서 효율적 : 재귀적 구조는 내부에 시스템 호출 스택을 사용하는 오버헤드가 발생하기 때문이다.

# DFS (Depth First Search)

>시작 정점의 한 방향으로 갈 수 있는 곳까지 깊이 탐색해 가다가 더 이상 갈 곳 이 없게 되면, 가장 마지막에 만났던 갈림길 간선이 있는 정점으로 되돌아와서 다른 방향의 정점으로 탐색을 계속 반복하여 **모든 정점을 순회하는 방법** 

- 가장 마지막에 만났던 갈림길의 정점으로 되돌아가서 다시 깊이 우선 탐색을 반복해야 하므로 후입선출 구조의 스택 사용

### 1. DFS 스택 구현

- 딕셔너리로 구현하기

```python
# 그래프 초기화

graph = {
    'A': ['B', 'C'],
 	'B': ['A', 'D'],
 	'C': ['A', 'G', 'H', 'I'],
 	'D': ['B', 'E', 'F'],
 	'E': ['D'],
 	'F': ['D'],
 	'G': ['C'],
 	'H': ['C'],
 	'I': ['C', 'J'],
 	'J': ['I']
}
```

```python
def dfs(graph, start):
    visited = []  # 방문한 정점
    stack = [start]  # 방문할 수 있는 정점
    # 방문할 수 있는 정점이 남아있을 때까지
    while stack:
        node = stack.pop()
        if node not in visited:
            visited.append(node)
            # stack.extend(graph[node])
            for w in graph[v]:
                stack.append(w)
    return visited

print(dfs(graph, 'A'))
# ['A', 'C', 'I', 'J', 'H', 'G', 'B', 'D', 'F', 'E']
```

- 리스트로 구현하기

```python
def dfs(graph, v, visited):
    visited[v] = True  # 노드 방문 처리
    print(v, end='')
    # 현재 노드와 연결된 다른 노드를 재귀적으로 방문
    for i in graph[v]:
        if not visited[i]:
            dfs(graph, i, visited)
            
graph = [
  	[],
  	[2, 3, 8],
  	[1, 7],
  	[1, 4, 5],
  	[3, 5],
  	[3, 4],
  	[7],
  	[2, 6, 8],
  	[1, 7]
]

visited = [False] * 9
dfs(graph, 1, visited)
```

- 입력값으로 인접행렬 만들기

```python
"""
7 8
1 2 1 3 2 4 2 5 4 6 5 6 6 7 3 7
"""
# V(정점), E(간선)
v, e = map(int, input().split())
data = list(map(int, input().split()))
arr = [[0] * (v + 1) for _ in range(v + 1)]
for i in range(e):
    n1, n2 = data[i * 2], data[i * 2 + 1]
    arr[n1][n2] = 1
    arr[n2][n1] = 1
```

