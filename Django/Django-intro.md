[TOC]

# Django

## 1. Web

- `static web page` (정적 웹 페이지) (flat page)
  - 서버가 정적 웹 페이지에 대한 요청을 받은 경우 서버는 추가적인 처리 과정 없이 클라이언트에게 응답을 보낸다. => 모든 상황에서 모든 사용자에게 동일한 정보 표시
  - 일반적으로 `HTML` , `css` `JavaScript`로 작성된다.
- `Dynamic web page` (동적 웹 페이지)
  - 웹 페이지에 대한 요청을 받은 경우 서버는 추가적인 처리 과정 이후 클라이언트에게 응답을 보낸다. => 페이지 내용은 그때마다 달라진다.
  - 서버 사이드 프로그래밍 언어`(Python, Java, c++)`등 사용되며, 파일을 처리하고 데이터베이스와의 상호작용이 이루어진다.

## 2. Framework

- 프로그래밍에서 특정 운영 체제를 위한 응용 프로그램 표준 구조를 구현하는 클래스와 라이브러리 모임
- `Framework Architecture` 
  - `MVC Pattern`인데 Django에서는 `MTV Pattern`이라고 한다.    

| Pattern  |                           하는 일                            |
| :------: | :----------------------------------------------------------: |
|  Model   | 응용프로그램의 데이터 구조를 정의하고 데이터베이스의 기록을 관리(추가, 수정, 삭제) |
| Template |  파일의 구조나 레이아웃을 정의, 실제 내용을 보여주는데 사용  |
|   View   | HTTP 요청을 수신하고 HTTP 응답을 반환, Model을 통해 요청을 충족시키는데 필요한 데이터 접근, Template에게 응답 서식 설정을 맡긴다. |

## 3. Django Intro

1. Django 설치 전 가상환경 생성 및 활성화

   1. `python -m venv venv`
   2.  `source venv\Scripts\activate` 
2. Django 설치

   1. `pip install django==3.2.12`
3. 프로젝트 생성
   1. `django-admin startproject [프로젝트 이름] . ` 
   2. 프로젝트 이름에는 `python, Django`에서 사용중인 키워드를 피해야 한다
4. Django 서버 시작하기
   1. `python manage.py runserver`
   2. 메인 페이지 로켓 확인
5. Application 생성
   1. `python manage.py startapp [앱이름]` 
   2. 어플리케이션명은 복수형으로 생성
6.  앱 등록
   1. 프로젝트 `settings.py` `INSTALLED_APPS` 리스트에 추가해야한다.
   2. 앱을 생성 후 등록