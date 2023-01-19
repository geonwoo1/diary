import 'package:diary/view/Page_Alice.dart';
import 'package:diary/view/searchPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';
import 'appbar.dart';
import 'drawer.dart';

class mainPage extends StatelessWidget {
 mainPage({Key? key}) : super(key: key);
  final diaryController =
  Get.put(DiaryController());
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: baseAppbar(),
        drawer: drawerPage(),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(size.width * 0.1,
                        size.height * 0.05, size.width * 0.1, 0),
                    height: size.height * 0.17,
                    width: size.width * 0.8,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: size.height * 0.02,
                            width: size.width * 0.2,
                            child: Text("인기레빗"),
                          ),
                          Container(
                              height: size.height * 0.15,
                              width: size.width * 0.8,
                              child: ListView.builder(
                                  itemCount: 10,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: size.width * 0.2,
                                      height: size.height * 0.1,
                                      child: ListTile(
                                          title: Column(
                                        children: [
                                          Container(
                                            width: size.width * 0.2,
                                            height: size.height * 0.02,
                                            child: Text("Seoul"),
                                          ),
                                          Container(
                                            width: size.width * 0.2,
                                            height: size.height * 0.07,
                                            child: CircleAvatar(
                                              backgroundImage:
                                                  AssetImage('image/profile.jpg'),
                                              // 이미지 불러오기
                                              radius: 60.0,
                                            ),
                                          ),
                                          Container(
                                              width: size.width * 0.2,
                                              height: size.height * 0.02,
                                              child: Text("Alex")),
                                        ],
                                      ),),
                                    );
                                  }))
                        ])),
                Container(
                    margin: EdgeInsets.fromLTRB(
                        size.width * 0.05, 0, size.width * 0.05, 0),
                    child: Divider(
                      thickness: 1,
                      color: Color(0xffEA7466),
                    )),
                Container(
                  width: size.width * 0.9,
                  height: size.height * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: size.width * 0.9,
                        height: size.height * 0.04,
                        child: Row(children: [Container(
                          width:size.width*0.7,
                        child:Text("레빗커뮤니티에 글을 올려보세요",
                          style: TextStyle(fontSize: 15),
                        ),),Container(
                          width: size.width*0.2,
                          child: TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 12),
                          ),
                          onPressed: () {
                            Get.to(Page_Alice(),);
                          },
                          child: const Text(
                            '전체보기',
                            style: const TextStyle(
                              color: Colors.green,
                            ),
                          ),
                        ),) ],)
                      ),
                      Container(
                          width: size.width * 0.9,
                          height: size.height * 0.1,
                          child: ListTile(
                            title: Container(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "소통해요",
                                  style:
                                      TextStyle(fontSize: 13, color: Colors.grey),
                                ),
                                Text("내일 한강 치맥",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black)),
                                Text("날씨도 좋은데 내일 오후 2시에 여의도한강공원에서 치맥 할 엘리스분들~~?",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.black54)),
                              ],
                            )),
                          )),
                      Container(
                          child: Divider(
                            thickness: 1,
                            color:Color(0xffEA7466),
                          )
                      ),
                      Container(
                          width: size.width * 0.8,
                          height: size.height * 0.15,
                          child: ListTile(
                            title: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "래빗구해요",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                  Text("나를 이끌어줄 래빗구해용",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black)),
                                  Text(
                                    "서울 갈만한 곳으로 여행 루트 짜주실 래빗 구해요~~ 가격은 같이 정해봅시다.."
                                    "채팅주세요!",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.black54),
                                  )
                                ],
                              ),
                            ),
                          )),Container(
                          child: Divider(
                            thickness: 1,
                            color: Color(0xffEA7466),
                          )
                      ),Container(
                        width: size.width*0.9,
                        height: size.height*0.05,
                        child:Row(children: [Container(
                          width:size.width*0.7,
                          child:Text("마이 다이어리",
                            style: TextStyle(fontSize: 15),
                          ),),Container(
                          width: size.width*0.2,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 12),
                            ),
                            onPressed: () {
                              Get.to(searchPage(),);
                            },
                            child: const Text(
                              '전체보기',
                              style: const TextStyle(
                                color: Colors.green,
                              ),
                            ),
                          ),) ],)
                      ),Expanded(
                        child: Container(
                  child: GetBuilder<DiaryController>(
                    builder: (controller) {
                        return ListTile(
                          title: Container(
                            height: size.height*0.15,
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(size.width * 0.01),
                                  //패딩값
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        //올린시간
                                        height: size.height * 0.03,
                                        width: size.width * 0.2,
                                        child: Text(
                                          '${controller.post[0].time}',
                                          //시간 가져오기
                                          style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      SizedBox(
                                        //제목
                                        height: size.height * 0.03,
                                        width: size.width * 0.3,
                                        child: Text(
                                          '${controller.post[0].title}',
                                          //타이틀
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                      SizedBox(
                                        //내용
                                        height: size.height * 0.03,
                                        width: size.width * 0.4,
                                        child: Flexible(
                                          child: Text(
                                            '${controller.post[0].content}',
                                            //글내용
                                            overflow: TextOverflow.ellipsis,
                                            // 2줄넘어가면 ...
                                            maxLines: 2,
                                            //2줄만 표시
                                            style: const TextStyle(
                                                fontSize: 5,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black),
                                          ),
                                          // RichText(
                                          //   overflow: TextOverflow.ellipsis,
                                          //   maxLines: 2,
                                          //   *//**//*strutStyle:
                                          //   StrutStyle(fontSize: 14),*//**//*
                                          //   text: TextSpan(
                                          //     text: "gdgd"
                                          //     //'${controller.post[index].content}'
                                          //   ),
                                          // ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ), //사진 있으면 사이즈드박스 생성 후 사진넣기
                                  Container(
                                      padding: EdgeInsets.fromLTRB(
                                          size.width * 0.05, 0, 0, 0),
                                      //if문 사용시 {} 사용 X
                                      width: size.width * 0.3,
                                      height: size.height * 0.2,
                                      child: PageView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: controller
                                              .post[0].image.length,
                                          itemBuilder: (context, index1) {
                                            return Container(
                                              width: size.width * 0.3,
                                              height: size.height * 0.2,
                                              child: Image.asset(
                                                  '${controller.post[0].image[index1]}',
                                                  fit: BoxFit.cover),
                                            );
                                          })),
                              ],
                            ),
                          ),
                        );
                    }
                  ),
                ),
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
