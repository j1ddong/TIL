# AJAX

> Asynchronous JavaScript And XML (비동기식 JavaScript와 XML)
>
> HTML, CSS, JavaScript, DOM 조작과 `XMLHttpRequest` object를 활용한 프로그래밍 방식
>
> AJAX를 사용하면 웹페이지 일부가 리로드 되는 동안에도 코드가 계속 실행되어 비동기식으로 작업할 수 있다

- 서버와 통신하기 위해 `XMLHttpRequest` 객체 활용

- 페이지 새로 고침 없이 서버에 요청 > 서버로부터 데이터를 받고 작업을 수행



## XMLHttpRequest 객체

> XMLHttpRequest(XHR) 객체는 서버와 상호작용하기 위하여 사용됩니다. 

- 전체 페이지 새로고침 없이도 URL로부터 데이터를 받아올 수 있다 > 이를 통해 사용자가 하고 있는 걸 방해하지 않으면서 페이지 일부를 업데이트 할 수 있다
- 모든 종류의 데이터를 받아오는데 사용할 수 있다.

- 생성자: `XMLHttpRequest()`

------

### 동기식

- 순차적, 직렬적 Task수행, 요청을 보낸 후에 응답을 받아야만 다음 동작이 이루어짐

### 비동기식

- 병렬적 Task 수행, 요청을 보낸 후 응답을 기다리지 않고 다음 동작이 이루어짐

**JavaScipt는 single threaded를 사용하기 때문이다**

**비동기식 코드라면 데이터를 요청하고 응답 받는 동안 앱 실행을 함께 진행한다 => 데이터를 불러오는 동안 지속적으로 응답하는 화면을 보여줌으로써 더욱 쾌적한 사용자 경험을 제공**

#### Concurrency model(동시성 모델)

1. Call stack
   1. 요청이 들어올 때마다 해당 요청을 순차적으로 처리하는 Stack(LIFO) 형태의 자료구조
2. Web API(Browser API)
   1. JavaScipt 엔진이 아닌 브라우저 영역에서 제공하는 API
   2. **setTimeout(), DOM events 그리고 AJAX로 데이터를 가져오는 시간이 소요되는 일들을 처리**
3. Task Queue
   1. 비동기 처리된 callback 함수가 대기하는 Queue(FIFO) 형태의 자료구조
   2. main thread가 끝난 후 실행되어 후속 JavaScript 코드가 차단되는 것을 방지
4. Event Loop
   1. Call stack이 비어 있는지 확인
   2. 비어 있는 경우 Task Queue에서 실행 대기 중인 callback 함수가 있는지 확인
   3. 가장 앞에 있는 callback 함수를 Call Stack으로 push 

- 일이 겹쳐서 진행될 수 있다. 하지만 **동시에** 실행되는 것은 아니다 == 많은 것들을 동시에 처리하는 것
- dealing with lots of things at once

##### 참고 Parallelism(병렬성)

- 일이 동시에 일어남 == 많을 것들을 동시에 하는 것
- doing lots of things at once

![image-20220503165540955](C:\Users\jiunHan\Desktop\Git hub\TIL\JS\image\image-20220503165540955.png)