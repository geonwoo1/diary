import 'package:flutter/material.dart';

class baseAppbar extends StatelessWidget implements PreferredSizeWidget{
  @override
  Widget build(BuildContext context) {

    return AppBar( //앱바만들기
      title: const Text("Diary", //앱바타이틀
        style: TextStyle( //앱바 스타일 주기
            color: Colors.white //화이트색상
        ),
      ),
      backgroundColor: Color(0xffEA7466), //앱바 배경색 그레이
      /*leading: IconButton( //리딩: 앱바 왼쪽에 아이콘 버튼
          icon: Icon(Icons.menu), //메뉴버튼
          onPressed: () {
            //버튼클릭하면 함수
            print('menu');
          }
      ),*/
      actions: [ //액션: 오른쪽에 아이콘 배치
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            print('search');
          },
        ),
        IconButton(
          icon: Icon(Icons.wechat),
          onPressed: () {
            print('chat');
          },
        ),
      ],
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(50);
}

