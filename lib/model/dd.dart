import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';
import '../view/detail.dart';
import '../view/imgEdit.dart';

class dd extends StatelessWidget {
  final diaryController = Get.put(DiaryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Column(
            children: [
              Flexible(
                flex: 3,
                child: Container(
                    color: Colors.black,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.search),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle: const TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () {
                                    Get.to(imgEditPage());
                                  },
                                  child: const Text(
                                    '편집',
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            color: Colors.red,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            color: Colors.grey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [Text("Travel",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 50,
                                    ),
                                  )],
                                ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.amber,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Text("Total Post 6개")],
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
              Flexible(
                flex: 7,
                child: Container(
                  color: Colors.blue,
                  child: GetX<DiaryController>(//리스트뷰를 GetX 로 감싸기
                      builder: (controller) {
                    //controller를 통해 모든 데이터 정보를 가져옴
                    return ListView.builder(
                      //리스트뷰 생성
                      physics: const NeverScrollableScrollPhysics(),
                      // 리스트뷰 스크롤 막기
                      shrinkWrap: true,
                      itemCount: controller.post.length,
                      //몇개의 리스트뷰 만들건지
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Container(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10), //패딩값
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          //올린시간
                                          height: 20,
                                          width: 70,
                                          child: Text(
                                            '${controller.post[index].time}', //시간 가져오기
                                            style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey),
                                          ),
                                        ),
                                        SizedBox(
                                          //제목
                                          height: 30,
                                          width: 100,
                                          child: Text(
                                            '${controller.post[index].title}', //타이틀
                                            style: const TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ),
                                        SizedBox(
                                          //내용
                                          height: 100,
                                          width: 230,
                                          child: Text(
                                            '${controller.post[index].content}', //글내용
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if ('${controller.post[index].image}' !=
                                      "") //사진 있으면 사이즈드박스 생성 후 사진넣기
                                    SizedBox(
                                      //if문 사용시 {} 사용 X
                                      width: 100,
                                      height: 150,
                                      child: Image.asset(
                                          '${controller.post[index].image}'),
                                    ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Get.to(detailPage(),
                                  arguments: controller.post[index]);
                            },
                          ),
                        );
                      },
                    );
                  }),
                ),
              )
            ],
          ),
        ),
    );
  }
}
