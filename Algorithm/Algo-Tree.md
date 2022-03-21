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

![image-20220316222158816](C:\Users\jiunHan\Desktop\TIL\Algorithm\Algo-imag\image-20220316222158816.png)

## 이진트리

> 모든 노드들이 자식 노드를 최대한 2개까지만 가질 수 있는 트리

### 1. 특징

- 높이가 `h`이면 노드의 최소 개수는 `h + 1` 개, 최대 개수는 `2 ^ (h + 1) - 1`
- 레벨 `i`에서의 노드의 최대 개수는 `2 ^ i` 



### 2. 종류

#### 2-1. 포화 이진 트리(Full Binary Tree)

> 높이가 `h`일 때 최대 노드 개수인 `2 ** (h + 1) - 1`  노드를 가진 이진 트리

<img src="C:\Users\jiunHan\Desktop\TIL\Algorithm\Algo-imag\image-20220316224346926.png" alt="image-20220316224346926" style="zoom:80%;" />

#### 2-2. 완전 이진 트리(Complete Binary Tree)

> 높이가 `h`이고 노드 수가 `n`일 때 `(2 ** h < n  < 2 ** (h + 1) - 1)`, 포화 이전 트리의 노드 번호 1번부터 n번까지 빈 자리가 없는 이진 트리

<img src="C:\Users\jiunHan\Desktop\TIL\Algorithm\Algo-imag\image-20220316225212417.png" alt="image-20220316225212417" style="zoom:80%;" />

#### 2-3 편향 이진 트리(Skewed Binary Tree)

> 높이가 h에 대해 `h + 1` 인 최소 개수의 노드를 가지면서 한쪽 방향의 자식 노드만을 가진 이진 트리

<img src="C:\Users\jiunHan\Desktop\TIL\Algorithm\Algo-imag\image-20220316225347969.png" alt="image-20220316225347969" style="zoom:80%;" />

#### 2-4 정 이진 트리

> 루트 노드를 제외한 모든 노드가 자식노드를 2개 또는 0개 가지는 트리, 즉 차수가 0이거나 2인 트리

<img src="C:\Users\jiunHan\Desktop\TIL\Algorithm\Algo-imag\image-20220319133944048.png" alt="image-20220319133944048" style="zoom:80%;" />

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