import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:import_days/api/file_io.dart';
import 'package:import_days/tools/tools.dart';

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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': getYMD(),
      'title': title,
    };
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

class UserData extends ChangeNotifier {
  Day topDay;
  List<Day> daysList = [];
  late DaysStorage daysStorage;

  UserData(this.topDay, this.daysList) {
    daysStorage = DaysStorage();
    daysStorage.getPath().then((value) {
      if (kDebugMode) {
        print(value);
      }
    });
  }

  void writeToFile() {
    daysStorage.writeData({
      'topDay': topDay.id,
      'daysList': daysList.map((e) => e.toJson()).toList(),
    });
    notifyListeners();
  }

  void changeTopDay(String id) {
    topDay = daysList.where((day) => day.id == id).toList()[0];
    writeToFile();
  }

  void changeDay(Day day) {
    String dayId = day.id;
    // 数据里没有对应的id时不执行任何操作
    if (daysList.where((element) => element.id == dayId).isNotEmpty) {
      // 去掉原来的数据
      daysList.removeWhere((element) => element.id == dayId);
      // 添加新的数据
      daysList.add(day);
      // 写入文件
      writeToFile();
    }
  }

  void addDay(Day day) {
    if (daysList.where((element) => element.id == day.id).isEmpty) {
      daysList.add(day);
      // 写入文件
      writeToFile();
    } else {
      if (kDebugMode) {
        print('id已存在: ${day.id}');
      }
    }
  }

  void removeDay(String dayId) {
    daysList.removeWhere((element) => element.id == dayId);
    writeToFile();
  }
}
