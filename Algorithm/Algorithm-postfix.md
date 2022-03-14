[TOC]

# 후위 표현식

- 중위 표현식 : 일반적으로 알고있는 산술 방식
- 후위 표현식: 컴퓨터가 이헤하는 산술 방식

>Stack 내부의 왼쪽 괄호는 우선 순위가 가장 낮으며 Stack 외부의 왼쪽 괄호는 우선 순위가 가장 높다. 
>
>비교했을 때 외부 우선순위가 높으면 스택에 `push`하고 반대로 내부의 우선순위가 높거나 같으면 `pop`한 것을 결과에 `push`한다. 

- Stack 내부와 외부의 연산자 우선순위

| 토큰 | isp (stack top, 내부) 비교대상 | icp (자신, 외부) |
| :--: | :----------------------------: | :--------------: |
|  )   |               -                |        -         |
| *, / |               2                |        2         |
| +, - |               1                |        1         |
|  (   |               0                |        3         |

```python
infix = '(3+5)*(4+2)'
stack = []  # 피연산자와 괄호를 모아둘 스택
result = ''  # 후위 표현식으로 바꾼 최종 값

for token in inflix:  # 중위 표현식을 순회하면서
    if token.isdecimal():  # 토근이 피연산자일 경우 바로 결과
        result += token
    else:  # 토근이 연산자나 괄호일 경우
        if not stack:  # if len(stack) == 0:
            stack.append(token)
        else:
            if token == '(':  # 외부 우선순위가 높기 때문에 무조건 append
                stack.append(token)
            elif token == ')'
               while stack[-1] != '(':
                    result += stack.pop()
                stack.pop()  # 괄호는 후위표현식에 없기 때문에 버리기
            elif token == '*' or token == '/':
			# 내부에는 */보다 높은 순위가 없기 때문에 자기 자신만 아니면 append
                while stack and (stack[-1] == '*' or stack[-1] == '/'):
        			result += stack.pop()
            	stack.append(token)
            elif token == '+' or token == '-':
            # 플마보다 낮은 우선순위는 괄호뿐이기 때문에 괄호가 나올 때까지 pop 
                while stack and stack[-1] != '(':
                    result += stack.pop()
                stack.append(token)
while stack:
    result += stack.pop()
                
```

- 후위 표기법 계산하기

```python
stack = []

for token in result:
    if token.isdecimal():
        stack.append(int(token))
    else:
        p1 = stack.pop()
        p2 = stack.pop()
        if token == '+':
            stack.append(p2 + p1)
        elif token == '-':
            stack.append(p2 - p1)
        elif token == '*':
            stack.append(p2 * p1)
        elif token == '/':
            stack.append(p2 / p1)
    ans = stack.pop() 
```

