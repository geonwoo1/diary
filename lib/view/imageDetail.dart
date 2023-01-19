

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class imageDetail extends StatelessWidget {
  const imageDetail({Key? key}) : super(key: key);
  get arg => Get.arguments;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body :Container(
        margin: EdgeInsets.fromLTRB(0, size.height * 0.1,0, size.height * 0.1),
        width: size.width,
        height: size.height * 0.8,
        child:PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: arg['controller'].image.length,
          itemBuilder: (context, index1) {
            return Container(
              child:
              Image.asset(
                  arg['controller'].image[index1],
                  fit: BoxFit.cover),
            );
          },),
/*  decoration: BoxDecoration(
                                                          //꾸미기
                                                          image: DecorationImage(
                                                            //이미지넣기
                                                              fit: BoxFit.fill, //이미지 어떻게 채울건지
                                                              image: AssetImage(
                                                                  '${arg['controller'].image}') //어떤 이미지넣을건지(이미지경로)
                                                          ),
                                                        ),*/
      ),

    );
  }
}

