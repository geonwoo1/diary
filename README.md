# [플러터] Diary 만들기(1인)

![image](https://user-images.githubusercontent.com/90121680/215307995-1249916a-53ab-4f03-a68d-364656145cb3.png)

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

## 메인화면  및 글 상세보기

![image](https://user-images.githubusercontent.com/90121680/215308068-0e00aec8-1dbd-4bf5-9a1c-1ca178379b03.png)

## 편집화면 및 글 작성

![image](https://user-images.githubusercontent.com/90121680/215308410-8613297e-7bce-4712-be10-01f1dd51d396.png)

# 3. 실제 구현 화면

## 메인화면 및 검색
![image](https://user-images.githubusercontent.com/90121680/215308224-593292d7-6b30-46fd-905e-52623a44c335.png)

     
### 글 작성화면 및 수정

![image](https://user-images.githubusercontent.com/90121680/215308336-5d8485c5-b38f-4c97-848b-feeee55e0c5b.png)


## 편집화면 및 글 상세보기

![image](https://user-images.githubusercontent.com/90121680/215308476-1b353610-d304-4cf3-93b7-d6c5d4d461a0.png)


## 느낀점 및 알게된 점

- 내가 화면을 기획하고 만드는것은 어려운 일이었으며, 화면을 만드는데에 있어 크기가 넘어가 overflow 현상이 많이 일어났었다. 화면을 설계할때 overflow 가 일어나지 않도록 설계하는것이 중요하다는 것을 깨달을 수 있었다.
- 화면을 반응형으로 만들기 위해 mediaquery 를 활용할 수 있다.
- 오픈 패키지를 사용할때 내 입맛에 맞게 커스텀 할 수 있어야 한다.

## 보완점

- 현재 데이터를 플러터 안에 만들어 사용 했는데 서버를 연결하여 db나 api를 이용해야 한다.
- 레이아웃이 벗어나는걸 수정해야 한다.
- 현재 상태관리로 getx를 사용중인데 다른 상태관리 패키지 공부도 필요하다.
