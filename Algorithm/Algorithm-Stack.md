[TOC]



# Stack

- 물건을 쌓아 올리듯 자료를 쌓아 올린 형태의 자료구조
- 마지막에 삽입한 자료를 가장 먼저 꺼낸다. **후입선출**

## 1. 연산

1. 삽입: 저장소에 자료를 저장한다, ; `push`
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



## Memoization

- 컴퓨터 프로그램을 실행할 때 이전에 계산한 값을 메모리에 저장해서 매번 다시 계산하지 않도록 하여 전체적인 실행속도를 빠르게 하는 기술
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
# DP iterative 방식
```

