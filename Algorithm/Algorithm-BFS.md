# BFS

> Breadth First Search(너비 우선 탐색)
>
> 탐색 시작점의 인접한 정점들을 먼저 모두 차례대로 방문한 후, 방문했던 정점을 시작점으로 하여 다시 인접한 정점들을 차례로 방문하는 방식

- 인접한 정점들에 대해 탐색을 한 후, 차례로 다시 너비우선탐색을 진행해야 하므로 선입선출 형태의 자료구조인 `Queue` 를 활용

**1. 방문했을 때 방문 표시하기**   

```python
# 그래프 G, 탐색 시작점 v
def BFS(G, v):
    visited = [None] * (n + 1)  # n : 정점의 개수
    queue = []
    queue.append(v)  # 시작점 v를 큐에 삽입
    while queue:  # 갈 곳이 남아있다면
        t = queue.pop(0)
        if not visited[t]:  # 방문하지 않은 곳이라면
            visited[t] = True  # 방문 표시
            visit(t)  # 정점 t에서 할 일
        for i in G[t]:  # t와 연결된 모든 정점 중에
            if not visited[i]:  # 방문하지 않은 곳이면
                queue.append(i)  # 갈 수 있는 곳에 추가
```

**2. 큐에 넣을 때 방문 표시하기**

```python
def BFS(G, v, n):
    visited = [None] * (n + 1):
        queue = []
        queue.append(v)
        visited[v] = 1
        while queue:
            t = queue.pop(0)
            visit(t)  # 정점 t에서 할 일
            for i in G[t]:
                if not visited[i]:
                    queue.append(i)
                    visited[i] = visited[t] + 1  # 방문 표시 먼저 하기
```

- 앞으로 갈 수 있는 정점들이 중복으로 큐에 들어가지 않음