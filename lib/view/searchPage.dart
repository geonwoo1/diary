import 'package:diary/controller/controller.dart';
import 'package:diary/main.dart';
import 'package:diary/view/appbar.dart';
import 'package:diary/view/searchPage.dart';
import 'package:diary/view/diaryWrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:diary/view/imgEdit.dart';
import 'package:diary/view/detail.dart';

import '../model/post.dart';
import 'bottomNavi.dart';
import 'package:search_page/search_page.dart';

import 'drawer.dart';

class searchPage extends StatelessWidget {
  Color titleColor = Colors.green; // 기본 배경색
  var maintitle = "Travel"; // 기본 메인 타이틀
  get arg => Get.arguments;
  final diaryController =
      Get.put(DiaryController()); // DiaryController를 통해 데이터를 가져올 수 있음
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: baseAppbar(),
      drawer: drawerPage(),
      body: SingleChildScrollView(
        //바디부분 전체 스크롤 감싸기
        controller: Get.find<DiaryController>().scr,
        child: GetX<DiaryController>(
          // 상태관리 위해 G
          builder: (controller) {
            return Column(
              children: [
                if (controller.imagefile != null)
                  Container(
                      width: size.width,
                      height: size.height * 0.3,
                      child: Stack(children: [
                        Container(
                            width: size.width,
                            height: size.height * 0.3,
                            child: Image.file(controller.imagefile,
                                fit: BoxFit.cover)),
                        Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () => showSearch(
                                        context: context,
                                        delegate: SearchPage<Post>(
                                          onQueryUpdate: (s) => print(s),
                                          items: controller.post,
                                          searchLabel: 'Search post',
                                          suggestion: Center(
                                            child: Text(
                                                'Filter post by title, content or date'),
                                          ),
                                          failure: Center(
                                            child: Text('No diary found :('),
                                          ),
                                          filter: (post) => [
                                            post.title,
                                            post.content,
                                            post.time,
                                            post.tag,
                                          ],
                                          builder: (post) => ListTile(
                                            title: Text(post.title),
                                            subtitle: Text(post.content),
                                            trailing: Text(post.time),
                                            onTap: () {
                                              Get.to(detailPage(), arguments: {
                                                "controller": post,
                                                "index": post
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      icon: Icon(Icons.search),
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        textStyle:
                                            const TextStyle(fontSize: 20),
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
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    arg == null
                                        ? Text(
                                            maintitle,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 50,
                                            ),
                                          )
                                        : Text(
                                            arg['maintitle'],
                                            style: TextStyle(
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold,
                                              color: arg[
                                                  'titleColor'], //arg['titleColor']
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                        'Total Post ${controller.post.length}개'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]))
                else if (controller.titleImage != "")
                  Container(
                    width: size.width,
                    height: size.height * 0.30,
                    decoration: BoxDecoration(
                      //꾸미기
                      image: DecorationImage(
                          //이미지넣기
                          fit: BoxFit.cover, //이미지 어떻게 채울건지
                          image: AssetImage(
                              controller.titleImage) //어떤 이미지넣을건지(이미지경로)
                          ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () => showSearch(
                                    context: context,
                                    delegate: SearchPage<Post>(
                                      onQueryUpdate: (s) => print(s),
                                      items: controller.post,
                                      searchLabel: 'Search post',
                                      suggestion: Center(
                                        child: Text(
                                            'Filter post by title, content or date'),
                                      ),
                                      failure: Center(
                                        child: Text('No diary found :('),
                                      ),
                                      filter: (post) => [
                                        post.title,
                                        post.content,
                                        post.time,
                                        post.tag,
                                      ],
                                      builder: (post) => ListTile(
                                        title: Text(post.title),
                                        subtitle: Text(post.content),
                                        trailing: Text(post.time),
                                        onTap: () {
                                          Get.to(detailPage(), arguments: {
                                            "controller": post,
                                            "index": post
                                          });
                                        },
                                      ),
                                    ),
                                  ),
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
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                arg == null
                                    ? Text(
                                        maintitle,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 50,
                                        ),
                                      )
                                    : Text(
                                        arg['maintitle'],
                                        style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                          color: arg[
                                              'titleColor'], //arg['titleColor']
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Total Post ${controller.post.length}개',
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  Container(
                    color: arg == null ? Colors.amber : arg['backgroundColor'],
                    height: (size.height * 0.30),
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
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            color: Colors.grey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                arg == null
                                    ? Text(
                                        maintitle,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 50,
                                        ),
                                      )
                                    : Text(
                                        arg['maintitle'],
                                        style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                          color: arg[
                                              'titleColor'], //arg['titleColor']
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('Total Post ${controller.post.length}개')
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, size.height * 0.01, 0, 0),
                  width: size.width * 0.97,
                  child: ListView.builder(
                    //리스트뷰 생성
                    physics: const NeverScrollableScrollPhysics(),
                    // 리스트뷰 스크롤 막기
                    shrinkWrap: true,
                    itemCount: controller.post.length,
                    //몇개의 리스트뷰 만들건지
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.grey,
                        child: ListTile(
                          title: Container(
                            height: size.height * 0.15,
                            child: Row(
                              children: [
                                if ('${controller.post[index].image[0]}' !=
                                    "") //사진 있으면 사이즈드박스 생성 후 사진넣기
                                  Container(
                                      padding: EdgeInsets.fromLTRB(
                                          size.width * 0.01, 0, 0, 0),
                                      //if문 사용시 {} 사용 X
                                      width: size.width * 0.3,
                                      height: size.height * 0.2,
                                      child: PageView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: controller
                                              .post[index].image.length,
                                          itemBuilder: (context, index1) {
                                            return Container(
                                              width: size.width * 0.3,
                                              height: size.height * 0.2,
                                              child: Image.asset(
                                                  controller.post[index]
                                                      .image[index1],
                                                  //'${controller.post[index].image[index1]}',
                                                  fit: BoxFit.cover),
                                            );
                                          })),
                                Padding(
                                  padding: EdgeInsets.all(size.width * 0.01),
                                  //패딩값
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        //올린시간
                                        margin: EdgeInsets.fromLTRB(
                                            size.width * 0.01, 0, 0, 0),
                                        height: size.height * 0.03,
                                        width: size.width * 0.2,
                                        child: Text(
                                          '${controller.post[index].time}',
                                          //시간 가져오기
                                          style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white70),
                                        ),
                                      ),
                                      Container(
                                        //제목
                                        margin: EdgeInsets.fromLTRB(
                                            size.width * 0.01, 0, 0, 0),
                                        height: size.height * 0.035,
                                        width: size.width * 0.5,
                                        child: Text(
                                          '${controller.post[index].title}',
                                          //타이틀
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Container(
                                        //내용
                                        margin: EdgeInsets.fromLTRB(
                                            size.width * 0.01, 0, 0, 0),
                                        height: size.height * 0.05,
                                        width: size.width * 0.5,
                                        child: Flexible(
                                          child: Text(
                                            '${controller.post[index].content}',
                                            //글내용
                                            overflow: TextOverflow.ellipsis,
                                            // 2줄넘어가면 ...
                                            maxLines: 2,
                                            //2줄만 표시
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.white),
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
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Get.to(detailPage(), arguments: {
                              "controller": controller.post[index],
                              "index": index
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
