import 'package:diary/controller/dropController.dart';
import 'package:diary/view/appbar.dart';
import 'package:diary/view/bottomNavi.dart';
import 'package:diary/view/diaryWrite.dart';
import 'package:diary/view/drawer.dart';
import 'package:diary/view/rabbitWrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';


class dropDown extends StatelessWidget {
  dropDown({Key? key}) : super(key: key);
  final diaryController = Get.put(DiaryController());
  final drop = Get.put(dropCotroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: baseAppbar(),
        drawer: drawerPage(),
        body: GetBuilder<dropCotroller>(builder: (drop) {
          return Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropdownButton(
                  value: drop.selectedValue,
                  items: drop.valueList.map(
                    (String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                  onChanged: (dynamic value) {
                    drop.change(value);
                  },
                ),
                OutlinedButton(
                    onPressed: () {},
                    /*OutlineButton(onPressed: (){

                    },*/
                    child:
                        Text('임시저장 | 0', style: TextStyle(color: Colors.white)))
              ],
            ),
            if (drop.selectedValue == "래빗페이지")
              rabbitWrite()
            else if (drop.selectedValue == "diary")
              diaryWrite(),
          ]);
        }));
  }
}
