import 'package:diary/view/Page_Alice.dart';
import 'package:diary/view/Page_Rabbit.dart';
import 'package:diary/view/Page_Write.dart';
import 'package:diary/view/mainPage.dart';

import 'package:diary/view/profile.dart';
import 'package:diary/view/searchPage.dart';
import 'package:diary/view/diaryWrite.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../view/dropdown.dart';

class BottomNavigationPageController extends GetxController {
  static BottomNavigationPageController get to => Get.find();

  final currentIndex = 0.obs;

  List<Widget> pages = [
    mainPage(),
    Page_Rabbit(),
    Page_Alice(),
    searchPage(),
    dropDown(),
  ];

  Widget get currentPage => pages[currentIndex.value];

  void changePage(int _index) {
    currentIndex.value = _index;
  }
  void gotoDiaryPage(){
    currentIndex.value = 3;
    update();
  }
}