import 'package:diary/view/bottomNavi.dart';
import 'package:diary/view/diaryPage.dart';
import 'package:diary/view/write.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'model/dd.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Rabbit',
      home: bottomNavi(),
    );
  }
}
