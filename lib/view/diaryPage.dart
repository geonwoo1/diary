import 'package:diary/controller/controller.dart';
import 'package:diary/view/searchPage.dart';
import 'package:diary/view/diaryWrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:diary/view/imgEdit.dart';
import 'package:diary/view/detail.dart';
import 'package:dio/dio.dart';
import '../model/post.dart';
import 'bottomNavi.dart';
import 'package:search_page/search_page.dart';

class DiaryPage extends StatelessWidget {
  Color titleColor = Colors.green; // 기본 배경색
  var maintitle = "Travel"; // 기본 메인 타이틀
  get arg => Get.arguments;
  final diaryController =
  Get.put(DiaryController()); // DiaryController를 통해 데이터를 가져올 수 있음
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        //앱바만들기
        title: const Text(
          "Diary", //앱바타이틀
          style: TextStyle(
            //앱바 스타일 주기
              color: Colors.white //화이트색상
          ),
        ),
        backgroundColor: Colors.black38, //앱바 배경색 그레이
        leading: IconButton(
          //리딩: 앱바 왼쪽에 아이콘 버튼
            icon: Icon(Icons.menu), //메뉴버튼
            onPressed: () {
              //버튼클릭하면 함수
              Get.to(bottomNavi());
            }),
        actions: [
          //액션: 오른쪽에 아이콘 배치
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
            },
          ),
          IconButton(
            icon: Icon(Icons.wechat),
            onPressed: () {

            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        //바디부분 전체 스크롤 감싸기
        controller: Get.find<DiaryController>().scr,
        child: GetX<DiaryController>(
          // 상태관리 위해 G
          builder: (controller) {
            return Column(
              children: [
                if (Get.find<DiaryController>().titleImage != "")
                  Container(
                    height: (size.height * 0.30),
                    decoration: BoxDecoration(
                      //꾸미기
                      image: DecorationImage(
                        //이미지넣기
                          fit: BoxFit.fill, //이미지 어떻게 채울건지
                          image:
                          AssetImage(
                              "${Get.find<DiaryController>().titleImage}") //어떤 이미지넣을건지(이미지경로)
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
                                  onPressed: () =>showSearch(
                                    context: context,
                                    delegate: SearchPage<Post>(
                                      onQueryUpdate: (s) => print(s),
                                      items: controller.post,
                                      searchLabel: 'Search post',
                                      suggestion: Center(
                                        child: Text('Filter post by title, content or date'),
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
                                    Get.to(bottomNavi());
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
                                Text('Total Post ${controller.post.length}개')
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
                  color: Colors.blue,
                  child: ListView.builder(
                    //리스트뷰 생성
                    physics: const NeverScrollableScrollPhysics(),
                    // 리스트뷰 스크롤 막기
                    shrinkWrap: true,
                    itemCount: controller.res.length-5,
                    //몇개의 리스트뷰 만들건지
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Container(
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
                                          '${controller.post[index].time}',
                                          //시간 가져오기
                                          style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      SizedBox(
                                        //제목
                                        height: size.height * 0.05,
                                        width: size.width * 0.2,
                                        child: Text(
                                          '${controller.res[index]['content']}',
                                          //타이틀
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                      SizedBox(
                                        //내용
                                        height: size.height * 0.1,
                                        width: size.width * 0.6,
                                        child: Flexible(
                                          child: RichText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            strutStyle:
                                            StrutStyle(fontSize: 16.0),
                                            text: TextSpan(
                                              text:
                                              '${controller.post[index].content}',
                                            ),
                                          ),
                                        ),
                                        /*  Text(
                                          '${controller.post[index].content}', //글내용
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                        ),*/
                                      ),
                                    ],
                                  ),
                                ),
                                if ('${controller.post[index].image}' !=
                                    "") //사진 있으면 사이즈드박스 생성 후 사진넣기
                                  Container(
                                    padding: EdgeInsets.fromLTRB(
                                        size.width * 0.05, 0, 0, 0),
                                    //if문 사용시 {} 사용 X
                                    width: size.width * 0.2,
                                    height: size.height * 0.2,
                                    child: Image.asset(
                                        '${controller.post[index].image}'),
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
