import 'dart:math';

import 'package:flutter/material.dart';

class Card_Rabbit extends StatefulWidget {
  int number;

  Card_Rabbit({required this.number});

  @override
  State<Card_Rabbit> createState() => _Card_RabbitState();
}

class _Card_RabbitState extends State<Card_Rabbit> {

  List<String> testImageList = [
    "https://cdn.pixabay.com/photo/2022/05/24/04/38/study-7217599_960_720.jpg",
    "https://cdn.pixabay.com/photo/2022/07/01/14/29/wheat-7295718_960_720.jpg",
    "https://cdn.pixabay.com/photo/2022/02/07/06/41/vietnam-6998583_960_720.jpg",
    "https://cdn.pixabay.com/photo/2022/07/11/06/14/wild-bird-7314255_960_720.jpg",
    "https://cdn.pixabay.com/photo/2022/06/29/08/26/daisy-7291228_960_720.jpg"
  ];

  List<String> testTextList = [
    '우리나라 역사와 멋이 숨쉬는 거리, mz와 옛것이 만'+"\n"+'나 재탄생한 힙지로를 ...',
    '홍대입구역 근처 맛집 리스트 ...',
    '롯데타워 재밌는.. 숨쉬는 옛것 요즘것  ... ',
    '유튜브에서 유명한 디진다 돈까스 방문 후기 ...',
    '서울 시장 투어 사람도 북적북적 맛스럽고 위생상태도 good..!!',
  ];

  List<String> testMainList = [
    '뒤앙만크 소울에서의 역사여행',
    '홍대입구 맛집여행',
    '롯데타워 여행',
    '유튜브 맛집여행',
    '서울 시장투어',
  ];

  List<String> testImageAsset = [
    'images/EDRing.jpg',
    'images/air.jpg',
    'images/eldenring.gif',
    'images/lenna.png',
    'images/tiger.jpg'
  ];

  List<String> testUserList = [
    'Rabbit',
    'Tiger',
    'Dog',
    'Cat',
    'Alice'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children:[
          Container(
            child: Image.network(testImageList[Random().nextInt(5)])
          ),
          Container(
              height:50,
              width: MediaQuery.of(context).size.width,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children:[
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: AssetImage(testImageAsset[Random().nextInt(5)]),
                        ),
                        SizedBox(width: 5),
                        Text(testUserList[Random().nextInt(5)])
                  ],
      ),
                  Icon(Icons.more_vert),
      ]
    )
          ),
          Container(
            height:35,
            width: MediaQuery.of(context).size.width,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children : [
                    Icon(Icons.star_border),
                    SizedBox(width : 7),
                    Text('4.97 (57)')
                  ]
                )
              ]
            )
          ),
          Container(
            height:35,
            width: MediaQuery.of(context).size.width,
            child:Text(testMainList[Random().nextInt(5)])
          ),
          Container(
            height:50,
            width: MediaQuery.of(context).size.width,
            child:Text(testTextList[Random().nextInt(5)])
          ),

      Divider()

        ]

      // )
      // width:double.infinity,
      // height:200,
      // color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      // child: Center(child: Text(widget.number.toString()))
    )
    );
  }
}
