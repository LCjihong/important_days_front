import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class DaysStorage {
  DaysStorage() {
    // 若文件不存在，先初始化一下文件
    _localFile.then((File file) => {
          if (!file.existsSync())
            {
              // 若文件不存在，创建文件，初始化默认数据
              file.writeAsString(
                  '{"topDay":"1","daysList":[{"id":"1","date":"2023-08-13","title":"在一起一周年纪念日"},{"id":"2","date":"2023-06-29","title":"媳妇儿24岁生日"},{"id":"3","date":"2023-2-2","title":"媳妇儿去墨尔本"},{"id":"4","date":"2022-8-13","title":"在一起"}]}')
            }
        });
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<String> getPath() async {
    return _localPath;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/days.json');
  }

  Future<File> getFile() async {
    return await _localFile;
  }

  Future<dynamic> readData() async {
    final file = await _localFile;
    if (kDebugMode) {
      print(file.path);
    }

    final contents = await file.readAsString();

    dynamic mapData = jsonDecode(contents);

    return mapData;
  }

  Future<File> writeData(Map<String, dynamic> content) async {
    final file = await _localFile;

    try {
      final contentJson = json.encode(content);
      return file.writeAsString(contentJson);
    } catch (e) {
      return file;
    }
  }
}
