[TOC]



# Algorithm-string

## 1. Brute Force(고지식한 알고리즘)

```python
p = 'string1'  # 패턴
t = 'string2'  # 전체 텍스트
M = len(p)  # 찾을 패턴의 길이
N = len(t)  # 전체 텍스트의 길이
def BruteForce(p, t):
    i = j = 0  # i는 t의 인덱스 j는 p의 인덱스
    while j < M and i < N:
        if t[i] != p[j]:  # 문자열이 같지 않으면
            i = i - j  # 시작점으로 되돌아기 위한 작업 
            j = -1  # j가 0이 되기 위한 밑밥
        i += 1  # 한칸씩 오른쪽으로 이동
        j += 1  
```

## 2. KMP 알고리즘