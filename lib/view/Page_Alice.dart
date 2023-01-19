import 'package:diary/view/appbar.dart';
import 'package:flutter/material.dart';

import 'Card_Alice.dart';

class Page_Alice extends StatefulWidget {
  const Page_Alice({Key? key}) : super(key: key);

  @override
  State<Page_Alice> createState() => _Page_AliceState();
}

enum Public {open, closed}

class _Page_AliceState extends State<Page_Alice> {


  int _counter = 0;
  var _isChecked = false;
  Public _public = Public.open;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  final _valueList = ['서울특별시','광주광역시','제주특별자치도'];
  String _selectedValue = '서울특별시';
  final _valueMenu = ['소통','엘리스구합니다','래빗구합니다'];
  String _selectedMenu = '소통';
  final _valueLatest = ['최신순','오래된순','인기순'];
  String _selectedLatest = '최신순';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppbar(),
      resizeToAvoidBottomInset : false,
      body:
        SingleChildScrollView(
      child:Container(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 TextField(
                    decoration: InputDecoration(
                        border:OutlineInputBorder(),
                        hintText: '키워드 검색'
                    ),
                  ),

          SizedBox(
            height: 5,
          ),

          Container(
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropdownButton( //지역선택
                  value: _selectedValue,
                  items: _valueList.map(
                        (String value) {
                      return DropdownMenuItem (
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                  onChanged: (dynamic value) {
                    setState(() {
                      _selectedValue = value;
                    });
                  },
                ),

                DropdownButton( //글 종류 선택
                  value: _selectedMenu,
                  items: _valueMenu.map(
                        (String value) {
                      return DropdownMenuItem (
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                  onChanged: (dynamic value) {
                    setState(() {
                      _selectedMenu = value;
                    });
                  },
                ),
                DropdownButton( // 최신,오래된,인기 등등
                  value: _selectedLatest,
                  items: _valueLatest.map(
                        (String value) {
                      return DropdownMenuItem (
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                  onChanged: (dynamic value) {
                    setState(() {
                      _selectedLatest = value;
                    });
                  },
                ),
                SizedBox(
                  height:10
                )
              ],
            ),
          ),
                 Container(
                   height: 700,
                     child:
                     ListView.separated( //리스트뷰
                       shrinkWrap: true,
                       itemCount:30,
                       itemBuilder:(BuildContext context, int index){
                         return Card_Alice(
                           number: index,
                         );
                         // return Text(index.toString());
                       },
                       separatorBuilder: (BuildContext context, int index){
                         return SizedBox(height:10);
                       },
                     )
                 )
               ]
             ),
          ) ,
        )
    );
  }
}
