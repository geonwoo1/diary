import 'package:diary/view/searchPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';
import '../model/post.dart';
import 'bottomNavi.dart';

class diaryWrite extends StatelessWidget {
  diaryWrite({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  var title1;
  var content1;
  var time1;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      child: Form(
        key: this.formKey,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(size.width * 0.01, size.height * 0.01,
                  size.width * 0.01, size.height * 0.01),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "제목을 입력하세요",
                  border: OutlineInputBorder(),
                ),
                onSaved: (val) {
                  if (val!.length < 1) {
                  } else {
                    title1 = val;
                  }
                },
                validator: (val) {
                  return "필수입력 사항입니다";
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(size.width * 0.025,
                  size.height * 0.03, size.width * 0.025, size.height * 0.025),
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
                              hintText: "여행기간",
                              border: OutlineInputBorder(),
                              hintStyle: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                            onSaved: (val) {
                              if (val!.length < 1) {
                              } else {
                                time1 = val;
                              }
                            },
                            validator: (val) {
                              return "필수 입력사항입니다.";
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
                              hintText: "제목을 입력하세요",
                              hintStyle: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                            onSaved: (val) {
                              if (val!.length < 1) {
                              } else {
                                title1 = val;
                              }
                            },
                            validator: (val) {
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
                              hintStyle: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                            onSaved: (val) {
                              if (val!.length < 1) {
                              } else {
                                title1 = val;
                              }
                            },
                            validator: (val) {
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
                              hintText: "시간을 입력하세요",
                              hintStyle: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                            onSaved: (val) {
                              if (val!.length < 1) {
                              } else {
                                title1 = val;
                              }
                            },
                            validator: (val) {
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
            ),
            Container(
              width: size.width * 0.8,
              height: size.height * 0.3,
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 200,
                decoration: InputDecoration(hintText: "내용을 입력하세요"),
                onSaved: (val) {
                  if (val!.length < 1) {
                  } else {
                    content1 = val;
                  }
                },
                validator: (val) {
                  return null;
                },
              ),
            ),
            Container(
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
                  if (this.formKey.currentState!.validate()) {
                    //만약 validation 다 통과되면 try
                    this.formKey.currentState?.save();
                    Get.find<DiaryController>().postData.insert(
                        0,
                        Post(
                            title: "${title1}",
                            image: [""],
                            time: "${time1}",
                            content: "${content1}",
                            tag: ''));
                    Get.find<DiaryController>().updatePost();
                    Get.to(searchPage());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
