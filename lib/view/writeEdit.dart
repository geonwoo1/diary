import 'package:diary/view/appbar.dart';
import 'package:diary/view/bottomNavi.dart';
import 'package:diary/view/diaryPage.dart';
import 'package:diary/view/searchPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';
import '../model/post.dart';
import 'drawer.dart';

class writeEdit extends StatelessWidget {
  get arg => Get.arguments;
  final _items = ['Diary(travel)', '?????????', '###########3'];
  var _selected = 'Diary(travel)';
  final formKey = GlobalKey<FormState>();
  var title1;
  var content1;
  var time1;
  final formKey1 = GlobalKey<FormState>();
  final diaryController = Get.put(DiaryController());
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar:baseAppbar(),
        drawer: drawerPage(),
        body: Column(
          children: [
            Container(
              height: size.height * 0.08,
              child: Row(
                children: [
                  Container(
                    width: size.width * 0.08,
                    height: size.height * 0.08,
                    margin: EdgeInsets.fromLTRB(
                        size.width * 0.01,
                        size.height * 0.01,
                        size.width * 0.01,
                        size.height * 0.01),
                    child: TextButton(
                      style: TextButton.styleFrom(
                          textStyle: TextStyle(fontSize: size.height * 0.02),
                          backgroundColor: Colors.blue),
                      onPressed: (){
                        Get.to(bottomNavi());
                      },
                      child: const Text(
                        '취소',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        size.width * 0.01,
                        size.height * 0.01,
                        size.width * 0.01,
                        size.height * 0.01),
                    width: size.width * 0.4,
                    height: size.height * 0.8,
                    child: DropdownButton(
                      value: _selected,
                      items: _items.map((value) {
                        return DropdownMenuItem(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (value) {},
                    ),
                  ),
                  Container(
                    width: size.width * 0.08,
                    height: size.height * 0.08,
                    margin: EdgeInsets.fromLTRB(
                        size.width * 0.1,
                        size.height * 0.01,
                        size.width * 0.01,
                        size.height * 0.01),
                    child: TextButton(
                      style: TextButton.styleFrom(
                          textStyle: TextStyle(fontSize: size.height * 0.02),
                          backgroundColor: Colors.blue),
                      onPressed: null,
                      child: const Text(
                        '저장',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * 0.08,
                    height: size.height * 0.08,
                    margin: EdgeInsets.fromLTRB(
                        size.width * 0.01,
                        size.height * 0.01,
                        size.width * 0.01,
                        size.height * 0.01),
                    child: TextButton(
                      style: TextButton.styleFrom(
                          textStyle: TextStyle(fontSize: size.height * 0.02),
                          backgroundColor: Colors.blue),
                      onPressed: null,
                      child: const Text(
                        '등록',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(
                  size.width * 0.01, 0, size.width * 0.01, 0),
              height: size.height * 0.01,
              width: size.width,
              child: Divider(
                //선 삽입
                //선 간격
                color: Colors.grey, //선 색상
                thickness: 1, //선 굵기
              ),
            ),
            Expanded(
              child: Container(
                child: Form(
                  key: this.formKey1,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            size.width * 0.01,
                            size.height * 0.01,
                            size.width * 0.01,
                            size.height * 0.01),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "${arg['controller'].title}"),
                          onSaved: (val) {
                            if(val!.length<1){
                              title1="${arg['controller'].title}";
                            }else {
                              title1 = val;
                            }
                          }, validator: (val) {

                          return null;
                        },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(
                            size.width * 0.025,
                            size.height * 0.03,
                            size.width * 0.025,
                            size.height * 0.025),
                        height: size.height * 0.3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: size.height * 0.05,
                              child: Row(
                                children: [
                                  Container(
                                    width: size.width * 0.15,
                                    child: Text("Date :"),
                                  ),
                                  Container(
                                    width: size.width * 0.2,
                                    height: size.height * 0.03,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "${arg['controller'].time}",
                                        hintStyle:TextStyle(
                                          fontSize: 10,
                                        ) ,),
                                      onSaved: (val) {
                                        if(val!.length<1){
                                          time1="${arg['controller'].time}";
                                        }else {
                                          time1 = val;
                                        }
                                      }, validator: (val) {

                                      return null;
                                    },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: size.height * 0.045,
                              child: Row(
                                children: [
                                  Container(
                                    width: size.width * 0.15,
                                    child: Text("Place :"),
                                  ),
                                  Container(
                                    width: size.width * 0.2,
                                    height: size.height * 0.03,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "${arg['controller'].title}",
                                        hintStyle:TextStyle(
                                          fontSize: 10,
                                        ) ,
                                      ),
                                      onSaved: (val) {
                                        if(val!.length<1){
                                          title1="${arg['controller'].title}";
                                        }else {
                                          title1 = val;
                                        }
                                      }, validator: (val) {

                                      return null;
                                    },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: size.height * 0.045,
                              child: Row(
                                children: [
                                  Container(
                                    width: size.width * 0.15,
                                    child: Text("Friend :"),
                                  ),
                                  Container(
                                    width: size.width * 0.2,
                                    height: size.height * 0.03,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "${arg['controller'].time}",
                                        hintStyle:TextStyle(
                                          fontSize: 10,
                                        ) ,),
                                      onSaved: (val) {
                                        if(val!.length<1){
                                          title1="${arg['controller'].title}";
                                        }else {
                                          title1 = val;
                                        }
                                      }, validator: (val) {

                                      return null;
                                    },
                                    ),

                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: size.height * 0.045,
                              child: Row(
                                children: [
                                  Container(
                                    width: size.width * 0.15,
                                    child: Text("Tag :"),
                                  ),
                                  Container(
                                    width: size.width * 0.2,
                                    height: size.height * 0.03,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "${arg['controller'].time}",
                                        hintStyle:TextStyle(
                                          fontSize: 10,
                                        ) ,),
                                      onSaved: (val) {
                                        if(val!.length<1){
                                          title1="${arg['controller'].title}";
                                        }else {
                                          title1 = val;
                                        }
                                      }, validator: (val) {

                                      return null;
                                    },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(
                            size.width * 0.01, 0, size.width * 0.01, 0),
                        height: size.height * 0.01,
                        width: size.width,
                        child: Divider(
                          //선 삽입
                          //선 간격
                          color: Colors.grey, //선 색상
                          thickness: 1, //선 굵기
                        ),
                      ),Container(
                        width: size.width * 0.8,
                        height: size.height * 0.3,
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 200,
                          decoration: InputDecoration(
                              hintText: "${arg['controller'].content}"),
                          onSaved: (val) {
                            if(val!.length<1){
                              content1="${arg['controller'].content}";
                            }else {
                              content1 = val;
                            }
                          }, validator: (val) {

                          return null;
                        },
                        ),
                      ),Container(
                            child: ElevatedButton(
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
                                if (this.formKey1.currentState!.validate()) {
                                  //만약 validation 다 통과되면 try
                                  this.formKey1.currentState?.save();
                                  Get.find<DiaryController>().postData.removeAt(int.parse("${arg['index']}"));
                                  Get.find<DiaryController>().postData.insert(
                                      int.parse("${arg['index']}"),
                                      Post(
                                          title: "${title1}",
                                          image: ["${arg['controller'].image[0]}"],
                                          time: "${time1}",
                                          content: "${content1}",
                                          tag: '${arg['controller'].tag}'));
                                  Get.find<DiaryController>().updatePost();
                                  Get.snackbar('작성성공', "${arg['controller'].image[0]}");
                                  Get.to(bottomNavi());
                                }
                              },
                            ),
                          ),

                    ],
                  ),

                ),
              ),
            )
          ],
        ));
  }

}

