import 'dart:convert';

import 'package:import_days/api/get_data.dart';

class Day {
  String id;
  String dateStr;
  String title;
  late DateTime date;

  bool get isAfterDay => date.isAfter(DateTime.now());

  Day(this.id, this.dateStr, this.title) {
    if (dateStr != '') {
      date = formatDateStr(dateStr);
    }
  }

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(json['id'], json['date'], json['title']);
  }

  String getWeekDay() {
    String weekday = '一二三四五六日'[date.weekday - 1];
    return '星期$weekday';
  }

  String getYMD() {
    return "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  String getDescKeyWord() {
    return isAfterDay ? '还有' : '已经';
  }

  int getDiffDaysNum() {
    return date.difference(DateTime.now()).inDays.abs();
  }
}

class DayGroup {
  List<Day> children = [];

  List<Day> get getDays => children;
  set push(Day date) {
    children.add(date);
  }

  void delDay(String id) {
    for (var element in children) {
      if (element.id == id) children.remove(element);
    }
  }
}

class UserData {
  Day topDay;
  List<Day> daysList = [];

  UserData(this.topDay, this.daysList);

  String toJson() {
    dynamic json = {
      topDay,
      daysList,
    };
    return jsonEncode(json);
  }
}
