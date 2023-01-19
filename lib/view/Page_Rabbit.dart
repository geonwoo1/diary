import 'package:diary/view/appbar.dart';
import 'package:flutter/material.dart';

import 'Card_Rabbit.dart';

class Page_Rabbit extends StatefulWidget {
  const Page_Rabbit({Key? key}) : super(key: key);

  @override
  State<Page_Rabbit> createState() => _Page_RabbitState();
}

class _Page_RabbitState extends State<Page_Rabbit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:baseAppbar(),
      body:
      Container(

      child:
        ListView.separated(
            itemCount:30,
            itemBuilder:(BuildContext context, int index){
              return Card_Rabbit(
                number: index,
              );
              // return Text(index.toString());
            },
          separatorBuilder: (BuildContext context, int index){
              return SizedBox(height:20);
          },
        ),
      ),
    );
  }
}
