import 'package:diary/view/appbar.dart';
import 'package:diary/view/bottomNavi.dart';
import 'package:diary/view/searchPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controller/controller.dart';
import 'diaryPage.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:images_picker/images_picker.dart';

import 'drawer.dart';

class imgEditPage extends StatelessWidget {
  final controller = Get.put(DiaryController());
  var maintitle1 = DiaryPage().maintitle;
  Color titleColor = Colors.green;
  get arg => Get.arguments;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: baseAppbar(),
        drawer: drawerPage(),
        body: GetBuilder<DiaryController>(
          builder: (controller) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 40,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20),
                            backgroundColor: Color(0xffEA7466)),
                        onPressed: (){
                          Get.to(bottomNavi());
                        },
                        child: const Text(
                          '취소',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        '편집',
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20),
                            backgroundColor: Color(0xffEA7466)),
                        onPressed: () {
                          Get.find<DiaryController>().currentColor =
                              Get.find<DiaryController>().pickerColor;
                          Get.to(bottomNavi(), arguments: {
                            "maintitle": maintitle1,
                            "titleColor": Get.find<DiaryController>().pickerColor,
                            "backgroundColor":
                                Get.find<DiaryController>().pickerColor2,
                          });
                        },
                        child: const Text(
                          '저장',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  height: 100,
                  color: Colors.white,
                  child: Container(
                    height: 100,
                    child: Row(
                      children: [
                        Text(
                          'Diary title',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        BlockPicker(
                          pickerColor: Get.find<DiaryController>().pickerColor,
                          onColorChanged: Get.find<DiaryController>().changeColor,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 50,
                  child: Container(
                      margin: EdgeInsets.fromLTRB(30, 0, 50, 0),
                      child: TextField(
                          onChanged: (val) => maintitle1 = val,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '',
                          ))),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  height: 50,
                  child: Row(
                    children: [
                      Text(
                        'Background',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    /*  BlockPicker(
                        pickerColor: Get.find<DiaryController>().pickerColor2,
                        onColorChanged: Get.find<DiaryController>().changeBack,
                      ),*/ ElevatedButton(
                        child: Text('pick'),
                        onPressed: () async {
                          controller.getImage(ImageSource.gallery);
                        },
                      ),



                      // TextButton(
                      //   style: TextButton.styleFrom(
                      //       textStyle: const TextStyle(fontSize: 15),
                      //       backgroundColor: Colors.blue),
                      //   onPressed: null,
                      //   child: const Text(
                      //     '찾기',
                      //     style: const TextStyle(
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                if(controller.imagefile==null)
                     Container(
                       height: size.height*0.3,
                       width: size.width*0.8,
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover, //이미지 어떻게 채울건지
                                image: AssetImage(controller.titleImage) //어떤 이미지넣을건지(이미지경로)
                                ),
                        ),
                      )
                 else
                    Container(
                      height: size.height*0.3,
                              width: size.width*0.8,
                              margin: EdgeInsets.all(20),
                              child: Image.file(controller.imagefile,fit:BoxFit.cover),
                            )
              ],
            );
          }
        ));
  }
}
