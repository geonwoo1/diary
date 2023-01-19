import 'package:diary/view/diaryPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';
import '../model/post.dart';


class writePage extends StatelessWidget {
  var title;
  get arg => Get.arguments;
  final _items =['Diary(travel)','?????????','###########3'];
  var _selected ='Diary(travel)';
  final formKey =GlobalKey<FormState>();
  var content1;
  var time1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(                   //앱바만들기
          title: const Text("Diary",      //앱바타이틀
            style:TextStyle(              //앱바 스타일 주기
                color:Colors.white        //화이트색상
            ),
          ),
          backgroundColor: Colors.black38,    //앱바 배경색 그레이
          leading: IconButton(              //리딩: 앱바 왼쪽에 아이콘 버튼
              icon:Icon(Icons.menu),          //메뉴버튼
              onPressed: (){
                //버튼클릭하면 함수
                print('menu');
              }
          ),
          actions: [                        //액션: 오른쪽에 아이콘 배치
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
                print('search');
              },
            ),
            IconButton(
              icon: Icon(Icons.wechat),
              onPressed: (){
                print('chat');
              },
            ),
          ],
        ),
        body: Column(
            children: [Column(
              children: [Row(
                children:[
                  TextButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: Colors.blue
                    ),
                    onPressed: null,
                    child: const Text('저장',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  DropdownButton(
                    value: _selected,
                    items : _items.map(
                            (value){
                          return DropdownMenuItem(
                              value: value,
                              child:Text(value)
                          );
                        }
                    ).toList(),
                    onChanged: (value){

                    },
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: Colors.blue
                    ),
                    onPressed: null,
                    child: const Text('저장',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),TextButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: Colors.blue
                    ),
                    onPressed: null,
                    child: const Text('저장',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
              ],
            ),Expanded(child:
              Container(
                child:Form(
                  key:this.formKey,
                  child: Column(
                    children: [
                      renderTextFormField(label: 'title',
                        onSaved:(val){
                       title=val;
                      },
                          validator: (val){
                            if(val.length<1){
                              return '필수 필드입니다.';
                            }
                        return null;
                      },
                      ),
                      renderTextFormField(label: 'time',
                        onSaved:(val){
                          time1=val;
                        },
                        validator: (val){
                          if(val.length<1){
                            return '필수 필드입니다.';
                          }
                        return null;
                        },
                      ),renderTextFormField(label: 'content',
                        onSaved:(val){
                        content1=val;
                        },
                        validator: (val){
                        if(val.length<1){
                          return '필수 필드입니다.';
                        }
                        return null;
                        },
                      ),
                      renderSubmitButton(),
                    ],
                  ),
                )
            ),
            )
            ]

        )

    );
  }
  renderSubmitButton(){
    return ElevatedButton(
      style:ElevatedButton.styleFrom(
        primary: Colors.blue,
        textStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      child: Text(
        '작성',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
        onPressed: (){//저장하기
        if(this.formKey.currentState!.validate()){      //만약 validation 다 통과되면 try
          formKey.currentState?.save();
          Get.find<DiaryController>().updatePost();
          Get.snackbar('저장성공', Get.find<DiaryController>().postData[0].title +"${title}");
          Get.to(DiaryPage());


        }
        },

      );
  }

  renderTextFormField({
    required String label,
    required FormFieldSetter onSaved,
    required FormFieldValidator validator,
}){
    assert(label !=null);
    assert(onSaved!=null);
    assert(validator!=null);

    return Column(
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
    TextFormField(
    onSaved: onSaved,
    validator: validator,
    ),
    ],
    );

  }

}

