# DOM

> 문서 조작
>
> 선택 (Select) > 변경(Manipulation)



## DOM 선택

- `document.querySelector(selector) `: 제공한 선택자와 일치하는 element 하나 선택
- `document.querySeletorAll(selector)`: 제공한 선택자와 일치하는 여러 element 선택
- `HTMLCollection`: name, id, index 속성으로 각 항목에 접근 가능
- `NodeList`: index로만 각 항목 접근 가능, `forEach`메서드 등 다양한 메서드 사용 가능
  - `document.querySeletorAll(selector)`에 의해 반환되는 `NodeList`는 `Static Collection`으로 실시간으로 반영되지 않음
- `Live Collection`: 문서가 바뀔 때 실시간으로 업데이트 됨, DOM 변경사항을 실시간으로 `collection`에 반영
  - `HTMLCollection`, `NodeList`
- `Static Collection [non-live]`: DOM이 변경되어도 collection 내용에는 영향을 주지 않음
  - `document.querySeletorAll(selector)`에 의해 반환되는 `NodeList`만 `Static Collection`



## DOM 조작

- `document.createElement()`: 작성한 태그 명의 HTML 요소를 생성하여 반환
- `Element.append()` : 특정 부모 `Node`의 자식 `NodeList`중 마지막 자식 다음에 `Node`객체나 `DOMString`을 삽입, 여러 개 추가 가능
- `Node.appendChild()` :  한  `Node`를 특정 부모  `Node`의 자식  `NodeList`중 마지막 자식을 삽입, 한번에 오직 하나의  `Node`만 추가 가능
-  `Node.innerText` :  `Node`객체와 그 자손의 텍스트 컨텐츠(`DOMString`)를 표현
-  `Element.innerHTML`: 요소 내 포함된 HTML 마크업을 반환, XSS 공격에 취약
- `childNode.remove()`:  `Node`가 속한 트리에서 해당  `Node`를 제거
- `Node.removeChild()`: DOM에서 자식  `Node`를 제거하고 제거된  `Node`를 반환,  `Node`는 인자로 들어가는 자식  `Node`의 부모  `Node`
- `Element.setAttribute(name, value)`: 지정된 요소의 값을 설정, 속성이 이미 존재하면 값을 갱신, 존재하지 않으면 지정된 이름과 값으로 새 속성을 추가
- `Element.getAttribute(attributeName)`: 해당 요소의 지정된 값(문자열) 번환



## Event

> 네트워크 활동이나 사용자와의 상호작용 같은 사건의 발생을 알리기 위한 객체

- `EventTarget.addEventListener(type, listener)`: 지정된 이벤트가 대상에 전달될 때마다 호출할 함수 설정
  - `type`: 반응할 이벤트 유형
  - `listener`: 지정된 타입의 이벤트가 발생했을 때 알림을 받는 객체

- `event.preventDefault()`: 현재 이벤트의 기본 동작 중단