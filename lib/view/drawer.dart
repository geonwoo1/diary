import 'package:diary/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'calendar.dart';
class drawerPage extends StatelessWidget {
  const drawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
            padding: EdgeInsets.zero,
            children:[
        // 프로젝트에 assets 폴더 생성 후 이미지 2개 넣기
        // pubspec.yaml 파일에 assets 주석에 이미지 추가하기
        UserAccountsDrawerHeader(
        currentAccountPicture: CircleAvatar(
            // 현재 계정 이미지 set
            backgroundImage: AssetImage('image/profile.jpg'),
        backgroundColor: Colors.white,
      ),
    accountName: Text('LeeGeonWoo'),
    accountEmail: Text('lgw@pinetreesys.co.kr'),
          decoration: BoxDecoration(
            color: Color(0xffEA7466),
          ),
    ),
              ListTile(
                leading: Icon(
                  Icons.person_pin,
                  color: Colors.grey[850],
                ),
                title: Text('내 정보'),
                onTap: () {
                 Get.to(profile());
                },
                trailing: Icon(Icons.add),
              ),
              ListTile(
                leading: Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.grey[850],
                ),
                title: Text('캘린더'),
                onTap: () {
                Get.to(calendar());
                },
                trailing: Icon(Icons.add),
              ),
              ListTile(
                leading: Icon(
                  Icons.question_answer,
                  color: Colors.grey[850],
                ),
                title: Text('로그아웃'),
                onTap: () {
                },
                trailing: Icon(Icons.add),
              ),
            ],
    ),
    );



  }
}
