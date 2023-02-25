import 'dart:convert';
import 'package:flutter/services.dart';
import './day.dart';

DateTime formatDateStr(String dateStr) {
  List<String> dateList = dateStr.split('-');
  return DateTime(
      int.parse(dateList[0]), int.parse(dateList[1]), int.parse(dateList[2]));
}

Day initBaseDay(dynamic day) {
  return Day.fromJson(day);
}

Future<UserData> getData() async {
  String content = await rootBundle.loadString('lib/api/test.json');
  dynamic jsonData = json.decode(content);

  Day topDay = initBaseDay(jsonData['topDay']);
  List<Day> daysList = [];
  for (dynamic day in jsonData['daysList']) {
    daysList.add(initBaseDay(day));
  }
  return UserData(topDay, daysList);
}
