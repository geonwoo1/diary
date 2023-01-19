import 'dart:math';

import 'package:flutter/material.dart';

class Card_Alice extends StatefulWidget {
  int number;

  Card_Alice({required this.number});

  @override
  State<Card_Alice> createState() => _Card_AliceState();
}

class _Card_AliceState extends State<Card_Alice> {

  List<String> testTextList = [
    '홍대에서 술드실분 ..?',
    '나랑 낙지낚찌 가실분? \n 너무가고싶은데 혼밥은 못하겠음 ㅜ',
    '심심한데 노래방가실분 구함 \n 대신 노래부르는동안 마스크써야함',
    '한강에서 치맥하실분 댓글 ㄱㄱ 5명모이면 끝',
    '이번에 흠뻑쇼가는데 우비 챙겨야함? 물 많이맞는대서',
  ];

  List<String> testMainList = [
    '홍대',
    '혼밥 낙지',
    '노래방',
    '한강 치맥',
    '싸이 흠뻑쇼',
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
                  child:
                  Text(
                      testMainList[Random().nextInt(5)],
                    style:
                    TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                    )
              ),
              Container(
                  height:40,
                  width: MediaQuery.of(context).size.width,
                  child:Text(testTextList[Random().nextInt(5)])
              ),
              Container(
                  height:35,
                  width: MediaQuery.of(context).size.width,
                  child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            children : [
                              Icon(Icons.thumb_up_alt_outlined),
                              SizedBox(width : 7),
                              Text('94,215')
                            ]
                        ),
                        Row(
                            children : [
                              Icon(Icons.chat),
                              SizedBox(width : 7),
                              Text('124')
                            ]
                        )
                      ]
                  )
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
