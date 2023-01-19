import 'package:diary/view/appbar.dart';
import 'package:diary/view/bottomNavi.dart';
import 'package:diary/view/searchPage.dart';
import 'package:diary/view/diaryWrite.dart';
import 'package:diary/view/writeEdit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:diary/view/diaryPage.dart';
import 'package:search_page/search_page.dart';

import '../controller/controller.dart';
import 'drawer.dart';
import 'imageDetail.dart';

class detailPage extends StatelessWidget {
  detailPage({Key? key}) : super(key: key);
  get arg => Get.arguments;
  final diaryController = Get.put(DiaryController());
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: baseAppbar(),
      drawer: drawerPage(),
      body: Container(
            child: Column(children: [
              Container(
                margin: EdgeInsets.all(size.width*0.04),
                height: size.height * 0.15,
                child: Row(
                  children: [
                    Container(
                      width: size.width * 0.6,
                      child: Text(
                        "${arg['controller'].title}",
                        style: TextStyle(fontSize: size.height * 0.04),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, size.height * 0.02, 0, 0),
                      width: size.width * 0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width:size.width*0.13,
                                //  padding: EdgeInsets.fromLTRB(
                                    //  0, 0, size.width * 0.01, 0),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: const TextStyle(fontSize: 15),
                                      backgroundColor: Colors.green,
                                    ),
                                    onPressed: () {
                                      Get.snackbar('작성성공', "${arg['controller'].image}");
                                      Get.to(writeEdit(), arguments: arg);
                                    },
                                    child: const Text(
                                      '수정',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: size.height * 0.02,
                                  width: size.width * 0.002,
                                  child: VerticalDivider(),
                                ),

                          Container(
                            width:size.width*0.13,
                                      padding: EdgeInsets.fromLTRB(
                                          size.width * 0.01, 0, 0, 0),
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          textStyle: const TextStyle(fontSize: 15),
                                            backgroundColor: Colors.green,
                                        ),
                                        onPressed: () {
                                          Get.find<DiaryController>().postData.removeAt(int.parse("${arg['index']}"));
                                          Get.find<DiaryController>().updatePost();
                                          Get.off(bottomNavi());

                                        },
                                        child: const Text(
                                          '삭제',
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                              ],
                            ),
                          ),
                          Container(
                            //padding:
                          //  EdgeInsets.fromLTRB(0, size.height * 0.01, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Text("${arg['controller'].time}")],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                EdgeInsets.fromLTRB(size.width * 0.03, 0, size.width * 0.03, 0),
                height: size.height * 0.01,
                width: size.width,
                child: Divider(
                  //선 삽입
                  //선 간격
                  color: Color(0xffEA7466), //선 색상
                  thickness: 1, //선 굵기
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(size.width * 0.025, size.height * 0.01,
                    size.width * 0.025, size.height * 0.01),
                height: size.height * 0.2,
                child: Column(
                  children: [
                    Container(
                      height: size.height * 0.045,
                      child: Row(
                        children: [
                          Container(
                            width: size.width * 0.15,
                            child: Text("Date :"),
                          ),
                          Container(
                            width: size.width * 0.6,
                            child: Text("2022.04.01~2022.04.03"),
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
                            width: size.width * 0.6,
                            child: Text("서울특별시"),
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
                            width: size.width * 0.6,
                            child: Text("#장첸, #마동석, # 영화배우"),
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
                            width: size.width * 0.6,
                            child: Text("#맛집, #여행, #힐링, #서울"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                EdgeInsets.fromLTRB(size.width * 0.03, 0, size.width * 0.03, 0),
                height: size.height * 0.01,
                width: size.width,
                child: Divider(
                  //선 삽입
                  //선 간격
                  color:Color(0xffEA7466), //선 색상
                  thickness: 1, //선 굵기
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(size.width * 0.03,size.height * 0.01, size.width * 0.03, 0),
                height: size.height * 0.4,
                width: size.width * 0.9,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                    width: size.width * 0.9,
                                    child: Column(children: [
                                      Text(arg['controller'].content),
                                      if (arg['controller'].image[0]!="") //사진 있으면 사이즈드박스 생성 후 사진넣기
                                        InkWell(
                                          child: Container(
                                            //if문 사용시 {} 사용 X
                                            width: size.width,
                                            height: size.height * 0.4,
                                            child: PageView.builder(
                                                scrollDirection: Axis.horizontal,
                                                itemCount: arg['controller'].image.length,
                                                itemBuilder: (context, index1) {
                                                  return Container(
                                                    margin: EdgeInsets.fromLTRB(size.width * 0.03,size.height * 0.01, size.width * 0.03, 0),
                                                    width: size.width * 0.8,
                                                    child: Image.asset(
                                                        arg['controller'].image[index1],
                                                        fit: BoxFit.cover),
                                                  );
                                                }),
                                          ),
                                          onTap: () {
                                            Get.to(imageDetail(),arguments: arg);
                                          },

                                        ),
                                    ]

                                      /*    children: [Container(
                              child: Text("gdgdgdddddddddddddddddd"
                                  "gdgdgdgdgdgdgdgdgdgdgdgdgdgdgdddddddddddddddddddddd",
                                style: TextStyle(fontSize: 40),
                              ),
                            ),if],
                          )

                          child: Text("gdgdgdddddddddddddddddd"
                              "gdgdgdgdgdgdgdgdgdgdgdgdgdgdgdddddddddddddddddddddd",
                          style: TextStyle(fontSize: 40),
                          ),*/
                                    )),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),

    );
  }
}
