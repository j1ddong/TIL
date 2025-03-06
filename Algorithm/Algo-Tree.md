[TOC]



# Tree

> 비선형 구조, 원소들 간에 1: n관계를 가지는 자료구조, 원소들 간에 계층 관계를 가지는 계층형 자료구조를 의미하며 상위 원소에서 하위 원소로 내려가면서 확장되는 트리 모양의 구조

- 용어 정리
  - 정점(node, vertax) ; 트리의 원소
    - 노드 중 최상의 노드를 `루트(root`)라고 한다.
    - 맨 마지막 노드를 `단말노드` 또는 `잎(leaf)노드` 라고 한다.
  - 간선(edge) : 노드를 연결하는 선
  - 차수(degree)
    - 노드의 차수: 노드에 연결된 자식 노드의 수 : `B`의 차수 : 2, `C`의 차수: 1
    - 트리의 차수: 트리에 있는 노드의 차수 중에서 가장 큰 값 : 트리 T의 차수 = 3
    - 단말 노드: 차수가 `0인` 노드, 자식 노드가 없는 노드
  - 높이, 레벨: 루트에서 노드에 이르는 간선의 수
    - `B`의 높이: 1, `F`의 높이: 2, 트리T의 높이: 3
- 형제 노드: 같은 부모 노드의 자식 노드들
  - `B, C, D` 는 형제 노드
- 조상 노드:  간선을 따라 루트 노드까지 이르는 경로에 있는 모든 노드들
  - `K` 의 조상 노드들: `F, B, A`
- 자손 노드: 서브 트리에 있는 하위 레벨의 노드들
  - `B`의 자손 노드들: `E, F, K` 
- 서브 트리(subtree): 부모 노드와 연결된 간선을 끊었을 때 생성되는 트리

![image-20220316222158816](C:\Users\jiunHan\Desktop\Git hub\TIL\Algorithm\Algo-imag\image-20220316222158816.png)

## 이진트리

> 모든 노드들이 자식 노드를 최대한 2개까지만 가질 수 있는 트리

### 1. 특징

- 높이가 `h`이면 노드의 최소 개수는 `h + 1` 개, 최대 개수는 `2 ^ (h + 1) - 1`
- 레벨 `i`에서의 노드의 최대 개수는 `2 ^ i` 



### 2. 종류

#### 2-1. 포화 이진 트리(Full Binary Tree)

> 높이가 `h`일 때 최대 노드 개수인 `2 ** (h + 1) - 1`  노드를 가진 이진 트리

![image-20220316224346926](C:\Users\jiunHan\Desktop\Git hub\TIL\Algorithm\Algo-imag\image-20220316224346926.png)

#### 2-2. 완전 이진 트리(Complete Binary Tree)

> 높이가 `h`이고 노드 수가 `n`일 때 `(2 ** h <= n <= 2 ** (h + 1) - 1)`, 포화 이전 트리의 노드 번호 1번부터 n번까지 빈 자리가 없는 이진 트리

![image-20220316225212417](C:\Users\jiunHan\Desktop\Git hub\TIL\Algorithm\Algo-imag\image-20220316225212417.png)

#### 2-3 편향 이진 트리(Skewed Binary Tree)

> 높이가 h에 대해 `h + 1` 인 최소 개수의 노드를 가지면서 한쪽 방향의 자식 노드만을 가진 이진 트리

![image-20220316225347969](C:\Users\jiunHan\Desktop\Git hub\TIL\Algorithm\Algo-imag\image-20220316225347969.png)

#### 2-4 정 이진 트리

> 루트 노드를 제외한 모든 노드가 자식노드를 2개 또는 0개 가지는 트리, 즉 차수가 0이거나 2인 트리

![image-20220319133944048](C:\Users\jiunHan\Desktop\Git hub\TIL\Algorithm\Algo-imag\image-20220319133944048.png)

#### 2-5 이진 탐색 트리

- 밑에서 자세하게 다룸

### 3. 순회

- 트리의 각 노드를 중복되지 않게 전부 방문하는 것을 의미한다. 트리는 비선형구조이기 때문에 선형구조에서와 같이 선후 연결 관계를 알 수 없다.
- 결국 `tree`는 `graph`이기 때문에 `DFS(혹은 BFS)`를 사용하여 탐색
  - 그래프는 방향성이 없는 경우도 있지만 트리는 위 > 아래 방향이 있기 때문에 방문 처리를 할 필요가 없다

#### 3-1 전위순회(preorder traversal)

- 부모 노드 방문 후, 자식 노드를 좌, 우 순서로 방문한다

```python
def pre_order(T):
    if T:
        visit(T)
        pre_order(T.left)
        pre_order(T.right)
```



#### 3-2 중위순회(inorder traversal)

- 왼쪽 자식노드, 부모 노드, 오른쪽 자식 노드 순으로 방문한다.

```python
def in_order(T):
    if T:
        in_order(T.left)
        visit(T)
        in_order(T.right)
```



#### 3-3 후위순회(postorder traversal)

- 자식 노드를 좌우 순서로 방문한 후, 부모 노드로 방문한다.

```python
def post_order(T):
    if T:
        post_order(T.left)
        post_order(T.right)
        visit(T)
```



### 4. 이진 트리의 표현

#### 4-1 배열

- 노드 번호의 성질
  - 노드 번호가 `i`일 때 부모 번호는 `i // 2`  왼쪽 자식 번호는 `2 * i` 오른쪽 자식 노드 번호는 `2 * i + 1` 
  - 레벨 `n`의 시작 노드 번호는 `2 ^ n`
- 배열을 통한 이진 트리 표현식의 단점
  - 편향 이진 트리의 경우 사용하지 않는 배열 원소에 대한 메모리 공간 낭비 발생
  - 트리 중간에 새로운 노드 삽입하거나 기존의 노드를 삭제할 경우 배열의 크기 변경이 어려워 비효율적

1. 배열 2개를 통한 표현

```python
N = int(input())  # N: 노드의 개수
numbers = list(map(int, input().split()))  # 간선 수 * 2 만큼 숫자 주어짐
ch1 = [0] * (N + 1)
ch2 = [0] * (N + 1)
for i in range(N - 1):
    if ch1[numbers[2 * i]] == 0:
        ch1[numbers[2 * i]] = numbers[2 * i + 1]
    else:
        ch2[numbers[2 * i]] = numbers[2 * i + 1]
```

2. 그래프를 통해 표현

```python
N = int(input())  # N: 노드의 개수
numbers = list(map(int, input().split()))  # 간선 수 * 2 만큼 숫자 주어짐
graph = [[] for _ in range(N + 1)]
for i in range(N - 1):
    graph[numbers[i * 2]].append(numbers[i * 2 + 1])
```

3. 자식 번호를 인덱스로 부모 번호를 저장

```python
N = int(input())  # N: 노드의 개수
numbers = list(map(int, input().split()))  # 간선 수 * 2 만큼 숫자 주어짐
par = [0] * (N + 1)
for i in range(N - 1):
    p, c = numbers[i * 2], numbers[i * 2 + 1]
    par[c] = p
    
ans = []  # 조상 목록
while par[c] != 0:
    c = par[c]
    anc.append(c)
root = c  # 부모가 없는 게 루트 노드 번호
```



### 5. 이진 탐색 트리 (Binary Search Tree)

> 왼쪽에 있는 노드는 반드시 부모 노드보다 값이 작아야하며, 오른쪽에 있는 노드는 반드시 부모 노드보다 값이 커야 한다.

- 왼쪽 서브트리와 오른쪽 서브트리도 이진 탐색 트리다.
- 중위 순회하면 오름차순으로 정렬된 값을 얻을 수 있다.
- 보통 `O(log(N))` 시간이 걸리지만 한쪽으로 쏠린 `unbalanced`한 트리인 경우 `O(N)` 걸리게 된다. 

```python
# 중위순회해서 나오는 노드번호랑 부여되는 번호 같다
def in_order(s):
    global num
    if s <= N:  # 있는 노드만 찾기 위함
        in_order(s * 2)
        nodes[s] = num
        num += 1
        in_order(s * 2 + 1)


for tc in range(1, T + 1):
    N = int(input())  # 1~N까지 노드에 저장할 숫자
    nodes = [0] * (N + 1)
    num = 1
    in_order(1)
    print(f'#{tc} {nodes[1]} {nodes[N//2]}')
```



## Heaps

> `완전 이진 트리`에 있는 노드 중에서 키값이 가장 큰 노드나 키값이 가장 작은 노드를 찾기 위해서 만든 자료구조

- 루트 노드는 항상 최대 또는 최소 값이 된다.
- 힙이 굳이 `BST`일 필요는 없다.

### 1. 종류

#### Max Heaps(최대 힙)

- 부모가 항상 자식보다 값이 커야하는 트리
- 키값이 가장 큰 노드를 찾기 위한 `완전 이진 트리` = 루트노드 : 키값이 가장 큰 노드

#### Min Heaps(최소 힙)

- 부모가 항상 자식보다 값이 작아야하는 트리
- 키값이 가장 작은 노드를 찾기 위한 `완전 이진 트리` = 루트 노드 : 키값이 가장 작은 노드

### 2. Heapify

> 히피파이는 힙에서 전체 트리를 `재정렬`하는 과정을 뜻한다.
>
> 요소를 추가하거나 꺼낼 때 사용

#### 2-1 Insert(삽입)

- 빈 자리를 찾아서 일단 새로운 요소 집어넣기
- 재정렬(heapify) 진행

```python
# Min Heaps
N = int(input())  # 노드 수
numbers = list(map(int, input().split()))  # 서로 다른 N개의 자연수
nodes = [0] * (N + 1)
n = 1
for i in numbers:
    nodes[n] = i  # 마지막 노드에 순서 일단 넣기
    k = n
    while k // 2 >= 1:  # 부모 노드와 자식 노드 크기 비교하기
        if nodes[k] < nodes[k // 2]:
            nodes[k], nodes[k // 2] = nodes[k // 2], nodes[k]
        k = k // 2
    n += 1
    
```

#### 2-2 Delete(꺼내기)

- 루트 노드의 값을 제거한다. (힙에서 값을 빼낼 때는 보통 루트 노드의 값을 빼낸다고 가정)
- 가장 하단 오른쪽에 있는 리프를 루트 노드로 가져온다
- 새로운 루트 노드가 힙의 조건을 만족하는지 체크하기 위해 재정렬(heapify) 진행

```python
# Max heaps
def deq():
    global last
		temp = tree[1]
		tree[1] = tree[last]  # 마지막 정점의 키를 루트에 복사
		last = -1  # 마지막 정점 삭제
		p = 1
		c = p * 2
		while c <= last:  # 왼쪽 자식이 있을 때까지
				if c + 1 <= last and tree[c] < tree[c + 1]:  # 오른쪽 자식도 확인
						c += 1  # 오른쪽 자식이 왼쪽 자식보다 크면 오른쪽 자식 선택
				if tree[p] < tree[c]:
						tree[p], tree[c] = tree[c], tree[p]
						p = c
						c = p * 2
				else:
						break
		return temp
```

### 3. Heap Implementation

- 배열을 이용해서 힙 구현

```python
# Min Heaps
N = 6  # 노드 수
data = [3, 6, 2, 1, 7, 9]

tree = [0 for _ in range(N + 1)]  # 배열 생성
last = 1

for i in range(len(data)):
    if not tree[i]:  # 마지막 노드가 차있으면
        tree[last] = data[i]
    else:
        last += 1
        child = last  # 새로 추가된 정점을 자식으로
        parent = child // 2  # 완전 이진트리에서의 부모 정점 번호

        tree[child] = data[i]
        """
        # 삽입 및 정렬 순서
        # tree / child_idx / parent_idx
        [0, 3, 6, 0, 0, 0, 0] 2 1
        [0, 3, 6, 2, 0, 0, 0] 3 1
        [0, 2, 6, 3, 1, 0, 0] 4 2
        [0, 1, 2, 3, 6, 7, 0] 5 2
        [0, 1, 2, 3, 6, 7, 9] 6 3
        """
        # 부모가 있고, 부모가 자식보다 큰 동안(부모가 작아질 때 까지)
        while parent >= 1 and tree[parent] > tree[child]:
            # 부모와 자식 위치 변경
            tree[parent], tree[child] = tree[child], tree[parent]
            # 자식 위치를 부모로 변경
            child = parent
            # 부모는 부모 // 2 => 조상 노드
            parent = parent // 2
print(tree)
```

