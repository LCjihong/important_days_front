import 'dart:io';

Future<void> readFile(String filePath) async {
  try {
    var file = File(filePath);
    if (await file.exists()) {
      var contents = await file.readAsString();
      print(contents);
    } else {
      print('File not found');
    }
  } catch (e) {
    print(e);
  }
}

Future<void> writeFile(String filePath, String content) async {
  try {
    var file = File(filePath);
    await file.writeAsString(content);
  } catch (e) {
    print(e);
  }
}
