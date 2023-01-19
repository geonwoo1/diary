
import 'dart:collection';
import 'package:time_picker_sheet/widget/sheet.dart';
import 'package:time_picker_sheet/widget/time_picker.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';


class calendarController extends GetxController{
  var startDateTimeSelected;
  var endDateTimeSelected;
  CalendarFormat calendarFormat1 = CalendarFormat.month;
  DateTime focusedDay1 = DateTime.now();
  DateTime? selectedDay1;
  String title;
  calendarController(this.title, this.startDateTimeSelected, this.endDateTimeSelected);

  @override
  String toString() => title;
  change(selectedDay, focusedDay){
    selectedDay1=selectedDay;
    focusedDay1=focusedDay;
    update();
  }
  List<calendarController> getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }
  void openTimePickerSheet(BuildContext context) async {
    final result = await TimePicker.show<DateTime?>(
      context: context,
      sheet: TimePickerSheet(
        sheetTitle: 'Select meeting schedule',
        minuteTitle: 'Minute',
        hourTitle: 'Hour',
        saveButtonText: 'Save',
      ),
    );
    if (result != null) {
      startDateTimeSelected = result;
      update();
    }
  } void openTimePickerSheet2(BuildContext context) async {
    final result2 = await TimePicker.show<DateTime?>(
      context: context,
      sheet: TimePickerSheet(
        sheetTitle: 'Select meeting schedule',
        minuteTitle: 'Minute',
        hourTitle: 'Hour',
        saveButtonText: 'Save',
      ),
    );
    if (result2 != null) {
      endDateTimeSelected = result2;
      update();
    }
  }
void updatTodo(){
    eventSource[focusedDay1] = [calendarController(title,startDateTimeSelected,endDateTimeSelected)];
    kEvents = LinkedHashMap(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(eventSource);
    update();


}



}

Map<DateTime,dynamic> eventSource = {
  DateTime(2022,8,3) : [calendarController('5분 기도하기',"13:00","15:00"),calendarController('교회 가서 인증샷 찍기',"15:00","17:00")],
  DateTime(2022,8,5) : [calendarController('5분 기도하기',"13:00","15:00"),calendarController('치킨 먹기',"13:00","15:00"),calendarController('QT하기',"13:00","15:00"),calendarController('셀 모임하기',"13:00","15:00"),],
};

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
var kEvents = LinkedHashMap(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(eventSource);

/*final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
    key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
    value: (item) => List.generate(
        item % 4 + 1, (index) => calendarController('Event $item | ${index + 1}')))
  ..addAll({
    kToday: [
      calendarController('Today\'s Event 1'),
      calendarController('Today\'s Event 2'),
    ],
  });*/

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
        (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
