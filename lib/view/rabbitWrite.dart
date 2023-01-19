import 'package:diary/view/bottomNavi.dart';
import 'package:diary/view/searchPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


rabbitWrite(){
 return Container(
    child:
    Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text('제목'),
          ],
        ),
        TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '제목을 입력해주세요'
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text('내용'),
          ],
        ),
        TextFormField(
          maxLines: 10,
          minLines: 8,
          decoration: InputDecoration(
              border: OutlineInputBorder( ),
              hintText: '내용을 입력해주세요.'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            textStyle: TextStyle(
              color: Colors.white,
            ),
          ),
          child: Text(
            "작성",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            //저장하기

            Get.to(bottomNavi());
          },
        ),],

    ),

  );
}
