import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:diary/model/post.dart';
import 'package:diary/view/diaryWrite.dart';
import 'package:image_picker/image_picker.dart';
import 'package:images_picker/images_picker.dart';



class DiaryController extends GetxController {
  var dio =Dio();
  var image;
  var imagefile;
  var userImage;
  final ImagePicker picker =ImagePicker();    // 이미지 불러오기
  String? path;
  String titleImage ='image/aa8.jpg';
  final ScrollController scr =ScrollController();
  Color pickerColor2 = Color(0xff443a49);
  Color currentColor2 = Color(0xff443a49);
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);
  var post = <Post>[].obs; //데이터 바뀌면 ui 자동으로 업데이트
  var res = [].obs;

  var postData = [
    Post(
        title: '첫 해외여행!! 베트남 다낭',
        content: '첫 해외여행으로 베트남 다낭에 갔다왔는데.. 너무 더워ㅠㅠㅠㅠㅠㅠㅠ'
            '콩카페 맛있었음',
        image: ['image/aa1.jpg','image/aa2.jpg','image/aa3.jpg','image/aa4.jpg','image/aa5.jpg',
          'image/aa6.jpg'],
        time: '11시간전',
        tag: '#맛집 #카페 #생크림 #상큼 #아트'),
    Post(
        title: '담양 여행',
        content: '오늘은 친구들과 전라남도 담양에 갔다왔다. 국수 굳 ',
        image: ['image/bb1.jpg','image/bb2.jpg'],
        time: '2022.05.01',
        tag: '#맛집 #카페 #생크림 #상큼 #아트'),
    Post(
        title: '즉흥여행',
        content: '즉흥으로 떠나는 여행~ 신나',
        image: ['image/cc1.jpg','image/cc2.jpg'],
        time: '2022.04.20',
        tag: ''),
    Post(
        title: '시고르자브종',
        content: '멍멍멍',
        image: ['image/travel3.jpg'],
        time: '2022.04.01',
        tag: '#맛집 #카페 #생크림 #상큼 #아트'),
    Post(
        title: '나는멋쟁이',
        content: '플러터는 재밌따',
        image: [''],
        time: '2022.03.01',
        tag: '#맛집 #카페 #생크림 #상큼 #아트'),
    Post(
        title: 'ㅎㅎㅎㅎㅎ',
        content: '바보',
        image: ['image/travel1.jpg'],
        time: '2022.03.01',
        tag: '#맛집 #카페 #생크림 #상큼 #아트'),
  ];

  @override
  void onInit() {
    // 컨트롤러 생성시 호출되는 메서드
    super.onInit(); // 관련 api 호출 현재는 임시데이터로 대체
    fechData(); // 임시데이터
    getHttp();
  }

  void getHttp() async {
    try {
      var response = await Dio().get('http://localhost:3000/users');
      res.assignAll(response.data);

    } catch (e) {
      print(e);
    }
  }




  void fechData() async {
    //임시데이터 만들기
    await Future.delayed(Duration(seconds: 2));
    post.assignAll(postData); // 리스트내에 있는 모든 아이템을 인자값을 받는 아이템으로 대체해줌
  }

  Future<void> updatePost() async {
    postData;
    post.assignAll(postData);
    update();
  }
  void changeColor(Color color) {
    pickerColor = color;
  }
  void changeBack(Color color){
    pickerColor2 =color;
  }
  void scrollToTop() {
      scr.jumpTo(0);
  }
  Future getImage(ImageSource imageSource) async {
    image = await picker.pickImage(source: ImageSource.gallery);
    imagefile = File(image!.path);
    update();
  }

// Media
// .path
// .thumbPath (path for video thumb)
// .size (kb)

}