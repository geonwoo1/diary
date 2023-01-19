# [플러터] Diary 만들기(1인)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/2e2c23c3-9d92-45cd-b3e1-bacc328781e0/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/7f39fa8b-40c3-4b5e-938f-097231c1013d/Untitled.png)

## 🌞 프로젝트 기획 이유

여행 중 나만의 여행기록을 남기기 위해 프로젝트를 기획하였다. 

## 🤩 프로젝트 개발 목표 및 내용

- 글 등록,삭제,수정
    - 글 작성, 삭제, 수정이 가능하도록 해야한다.
- 바텀네비게이션을 이용하여 페이지 이동
    - GetX 이용하여 바텀네비게이션을 만들어 페이지 이동을 한다.
- 검색기능
    - 검색 기능을 통해 해당 찾고자 하는 글을 찾는다.
- 여러 패키지 사용해보기
    - [pub.dev](http://pub.dev) 사이트의 여러 패키지들을 사용하고 커스텀 해본다.

## **1. 사용 기술**

- **언어** : Flutter
- **IDEs** : androidStudio
- **Package**: GetX(상태관리 및 바텀네비게이션), search_page(검색기능), hsv_color_pickers(타이틀 색 바꾸기), image_picker(휴대폰 내 사진 선택)

## 2. 초기 화면 구성(카카오오븐 활용)

## 메인화면

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/517a7d26-e587-4749-b06e-c26be7c5c4b6/Untitled.png)

## 글 상세보기

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/99c91138-8dec-4392-ba72-9db5150ad22a/Untitled.png)

# 3. 실제 구현 화면

## 메인화면

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/17627316-f761-4fef-b82f-ad2554c75b60/Untitled.png)

### 검색화면(검색전)

## 

     

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/c4e5b5b2-2d53-45ad-a0c7-77870da94dc0/Untitled.png)

### 글 작성화면

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/858ba405-087c-416e-862e-d624a73b09e1/Untitled.png)

### 글 수정

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/fb66da9b-f85f-40ed-81f1-2d266d5953d9/Untitled.png)

## 편집화면

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/bafb9e4b-a5ef-4fe7-971c-8d7319f5ed65/Untitled.png)

## 글 작성화면

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/8205f966-b4ea-4a27-a2fb-1a39476e8df0/Untitled.png)

  

## 글 상세보기

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b1388255-91aa-4ff9-b53b-bb5913c18f18/Untitled.png)

### 검색화면(검색 후)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/559cfa00-d689-4bcd-bfcf-5f05c318dee8/Untitled.png)

### 편집화면

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/263a0e25-de26-4cca-88da-29298e6c0b70/Untitled.png)

### 글 수정 후 메인화면

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/8a773574-4a28-454b-8189-e6a3d7383551/Untitled.png)

## 느낀점 및 알게된 점

- 내가 화면을 기획하고 만드는것은 어려운 일이었으며, 화면을 만드는데에 있어 크기가 넘어가 overflow 현상이 많이 일어났었다. 화면을 설계할때 overflow 가 일어나지 않도록 설계하는것이 중요하다는 것을 깨달을 수 있었다.
- 화면을 반응형으로 만들기 위해 mediaquery 를 활용할 수 있다.
- 오픈 패키지를 사용할때 내 입맛에 맞게 커스텀 할 수 있어야 한다.

## 보완점

- 현재 데이터를 플러터 안에 만들어 사용 했는데 서버를 연결하여 db나 api를 이용해야 한다.
- 레이아웃이 벗어나는걸 수정해야 한다.
- 현재 상태관리로 getx를 사용중인데 다른 상태관리 패키지 공부도 필요하다.
