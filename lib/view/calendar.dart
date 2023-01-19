import 'package:diary/controller/calendarController.dart';
import 'package:diary/view/drawer.dart';
import 'package:diary/view/searchPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';

import '../controller/calendarController.dart';
import '../controller/calendarController.dart';

class calendar extends StatelessWidget {
 final formKey = GlobalKey<FormState>();

 final CalendarController = Get.put(calendarController("","",""));
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TableCalendar - Basics'),
      ),
      drawer: drawerPage(),
      body: GetBuilder<calendarController>(
        builder: (controller) {
          return Container(
            child:Column(
              children:[
            TableCalendar(
            calendarStyle: CalendarStyle(
                defaultTextStyle: TextStyle(color: Colors.grey,),
                weekendTextStyle: TextStyle(color: Colors.grey),
                outsideDaysVisible: false, todayDecoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.green,width: 1.5)
                ),
                todayTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey
                )
            ),
            eventLoader:(day){

              if (controller.getEventsForDay(day).length>0){
                return controller.getEventsForDay(day);
              } return [];

            },
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: controller.focusedDay1,
            calendarFormat: controller.calendarFormat1,
            selectedDayPredicate: (day) {
              // Use `selectedDayPredicate` to determine which day is currently selected.
              // If this returns true, then `day` will be marked as selected.

              // Using `isSameDay` is recommended to disregard
              // the time-part of compared DateTime objects.
              return isSameDay(controller.selectedDay1 , day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(controller.selectedDay1 , selectedDay)) {
                // Call `setState()` when updating the selected day
                controller.change(selectedDay, focusedDay);
              }
            },
            onFormatChanged: (format) {
              if (controller.calendarFormat1 != format) {
                // Call `setState()` when updating calendar format

              }
            },
            onPageChanged: (focusedDay) {
              // No need to call `setState()` here
              controller.focusedDay1 = focusedDay;
            },
            // Enable week numbers (disabled by default).
          ),
              Container(
                height: 200,
                child:((){
                  if(controller.getEventsForDay(controller.focusedDay1).length==0){
                    return Text("등록하신 일정이 없습니다.");
                  }
                  else {
                   return ListView.builder(
          itemCount: controller.getEventsForDay(controller.focusedDay1).length,
          itemBuilder:(context,index){
          return ListTile(
          title: Container(
          child: Text("${controller.getEventsForDay(controller.focusedDay1)[index]}"),
          ),
            onTap:() {Get.dialog(
              Dialog(
                child: Container(
                  height: 100,
                  child: Center(
                    child: Text("${controller.getEventsForDay(controller.focusedDay1)[index].startDateTimeSelected}"),
                  ),
                ),
              ),
            );
          }
          );
          }
          );
          }
          } )()
              )]),
          );

        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.dialog(
            Dialog(
              child: Form(
                key: this.formKey,
                child: Container(
                  height: 200,
                  child: Center(
                    child: Column(
                      children: [Container(
                    height: 50,
                    child:TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 200,
                        decoration: InputDecoration(
                            hintText: "제목을 입력하세요"),
                        onSaved: (val) {
                          if(val!.length<1){
                            Get.find<calendarController>().title=val;
                          }else {

                          }
                        }, validator: (val) {

                        return null;
                      },
                      ),),GetBuilder<calendarController>(
                        builder: (controller) {
                          return Container(
                            height: 50,
                            child:Row(children:[Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () =>controller.openTimePickerSheet(context),
                                    child: (controller.startDateTimeSelected==null)
                                        ? Text('시작하는 시간을 선택하세요')
                                   :Text("${controller.startDateTimeSelected}:${controller.startDateTimeSelected}"),
                                ),
                              ],
                            ),Container(child:Text("-")),Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {controller.openTimePickerSheet2(context);
                                  },
                                  //child: Text('시작시간을 선택하세요'),
                                  child:(controller.endDateTimeSelected==null)
                                      ? Text('끝나는 시간을 선택하세요')
                                      :Text("${controller.endDateTimeSelected}:${controller.endDateTimeSelected}")
                                ),
                              ],
                            )],),);
                        }
                      )







                    /*Container(
                        height: 50,
                        child:TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 200,
                          decoration: InputDecoration(
                              hintText: "시간"),
                          onSaved: (val) {
                            if(val!.length<1){

                            }else {

                            }
                          }, validator: (val) {

                          return null;
                        },
                        ),)*/,Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        textStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      child: Text(
                        "작성",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {//저장하기
                        if (this.formKey.currentState!.validate()) {
                          //만약 validation 다 통과되면 try
                          this.formKey.currentState?.save();
                          //print(Get.find<calendarController>().focusedDay1);
                          Get.find<calendarController>().updatTodo();
                          Get.to(calendar());
                        }
                      },
                    ),
                      ),
                    ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        backgroundColor: Color(0xffEA7466),
        child: Icon(Icons.add),
      ),
    );
  }
}
