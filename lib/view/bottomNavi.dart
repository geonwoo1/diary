import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/LandingPageController.dart';

class bottomNavi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Scaffold(
        body: Get.put(BottomNavigationPageController()).currentPage,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex:
          Get.put(BottomNavigationPageController()).currentIndex.value,
          onTap: Get.put(BottomNavigationPageController()).changePage,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,color: Color(0xffEA7466),),
              label: "홈",
            ),
            BottomNavigationBarItem(
              icon: Icon( Icons.airplanemode_active,color:Color(0xffEA7466),),
              label: "래빗",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined,color: Color(0xffEA7466),),
              label: "엘리스",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet_rounded,color: Color(0xffEA7466),),
              label:"Diary",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book,color: Color(0xffEA7466),),
              label: "글작성",
            ),
          ],
          selectedItemColor: Colors.black,
        ),
      ),
    );
  }
}