// 将yyyy-mm-dd转换成DateTime对象
DateTime formatDateStr(String dateStr) {
  List<String> dateList = dateStr.split('-');
  return DateTime(
      int.parse(dateList[0]), int.parse(dateList[1]), int.parse(dateList[2]));
}

// 获取当前时间戳
String getNowStamp() {
  return DateTime.now().millisecondsSinceEpoch.toString();
}
