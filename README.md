# Scrap

> 웹 사이트 링크를 저장하고 분류해 다시 볼 수 있는 앱입니다.

<br>

## 📌 사용된 기술   


- SwiftUI

- KakaoOpenSDK (KakaoTalk API)

- REST API

- Share Extension

- AuthenticationServices (Sign In With Apple)

<br>

## 📌 구현 방식


- MVVM 디자인 패턴 사용
  
- 서버에 사용자 데이터를 저장하고 조회하며 데이터 관리

- 자료 저장시, Share Extension을 사용해 JavaScript 파일을 통해 website title/link/imageUrl(썸네일)을 얻음 


<br>


## 📌 주요 기능


1. **링크 관리**

    - 공유 버튼을 눌러 Scrap 앱에 링크 저장

    - Scrap 홈 화면에서 저장한 자료(링크) 확인

<br>

2. **카테고리**

    - 저장한 링크를 카테고리별로 분류

    - 카테고리 이름 수정, 삭제, 순서 변경

<br>

3. **자료 수정**

    - 자료 링크 클립보드 복사

    - 자료의 카테고리 변경

    - 자료 삭제

<br>

4. **로그인**

    - 일반 로그인 (이메일)

    - 카카오 로그인 (웹 사이트 혹은 카카오톡 앱)

    - 애플 로그인

<br>

5. **회원가입 및 탈퇴**


<br>

## 📌 동작 화면


<p align= center>
    <img src=https://user-images.githubusercontent.com/63290629/211134783-78162903-7a2b-43a2-a5d7-e76eaf3144e3.png width="20%"/> 
    &nbsp;&nbsp;&nbsp;&nbsp; 
    <img src=https://user-images.githubusercontent.com/63290629/211134791-06764447-4971-4f8f-a56b-270bdb8a7f2a.png width="20%"/>
    &nbsp;&nbsp;&nbsp;&nbsp; 
    <img src=https://user-images.githubusercontent.com/63290629/211134784-2fd41138-ff15-44e7-9882-e03021b881b8.png width="20%"/> 
    &nbsp;&nbsp;&nbsp;&nbsp; 
    <img src=https://user-images.githubusercontent.com/63290629/211134787-71fc3a2c-cb36-4254-a7c8-d21d6a95b763.png width="20%"/>
</p>
