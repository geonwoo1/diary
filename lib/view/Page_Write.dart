import 'package:diary/view/diaryWrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'appbar.dart';

class Page_Write extends StatefulWidget {
  const Page_Write({Key? key}) : super(key: key);

  @override
  State<Page_Write> createState() => _Page_WriteState();

}

enum Public {open, closed}

class _Page_WriteState extends State<Page_Write> {

  int _counter = 0;
  var _isChecked = false;
  Public _public = Public.open;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  final _valueList = ['래빗페이지','엘리스페이지','diary'];
  String _selectedValue = '래빗페이지';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppbar(),
        resizeToAvoidBottomInset : false,
        body:
        SingleChildScrollView(
        child:Column(
            children:<Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DropdownButton(
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

                OutlinedButton(onPressed: (){},
                /*OutlineButton(onPressed: (){

                },*/
                  child:Text('임시저장 | 0',
                    style : TextStyle(
                        color : Colors.white))
                )
                ],

              ),
              if(_selectedValue=="래빗페이지")
              Container(
                child:
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text('제목'),
                    ],
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '제목을 입력해주세요'
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text('내용'),
                    ],
                  ),
                  TextFormField(
                    maxLines: 10,
                    minLines: 8,
                    decoration: InputDecoration(
                        border: OutlineInputBorder( ),
                        hintText: '내용을 입력해주세요.'),
                  ),
                ],
              ),
              )else if(_selectedValue=="diary")


              SizedBox(
                height: 20.0,
              ),

                    ListTile(
                    title: Text('게시글 공개'),
                    leading: Radio(
                      value: Public.open,
                      groupValue: _public,
                      onChanged: (dynamic value) {
                        setState(() {
                          _public = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                  title: Text('게시글 비공개'),
              leading: Radio(
              value: Public.closed,
              groupValue: _public,
              onChanged: (dynamic value) {
                setState(() {
                  _public = value;
                });
              })),


            ]
          )
        )
    );
  }
}
