import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import '../model/mv.dart';
import 'sharedPreferences_tools.dart';

class SqlTools {
  static String fileSQL =
      "/data/user/0/com.vocabulary.vocabulary/files/ok.sqlite";

  static Future<bool> fileExists(String filePath) async {
    return File(filePath).exists();
  }

  static Future<void> readAndWriteImage() async {
    String fileName = "ok.sqlite";
    String dir = (await getApplicationSupportDirectory()).path;
    fileSQL = "$dir/$fileName";
    bool isFirstLaunch = !DataUtils.hasKey('launchedBefore');
    if (isFirstLaunch) {
      print('首次启动！！！！');
      DataUtils.putBool('launchedBefore', true);
      var bytes = await rootBundle.load("assets/recMusic.sqlite");
      ByteBuffer buffer = bytes.buffer;
      File file = await File(fileSQL).writeAsBytes(
          buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes));
    }
  }

  static final Database _database = sqlite3.open(fileSQL);

  static void inMvHistory(MvModel model){
    DateTime now = DateTime.now();
    String currentTime = now.millisecondsSinceEpoch.toString();
    String data = jsonEncode(model.toJson());
    var insertStatement = _database.prepare('''
      INSERT OR REPLACE INTO mvHistory (data,id,time)
      VALUES (?,?,?)
    ''');
    insertStatement.execute([data,model.id.toString(),currentTime]);
  }

  static void inSearch(String word) {
    var insertStatement = _database.prepare('''
      INSERT OR REPLACE INTO searchWordTime (word)
      VALUES (?)
    ''');
    insertStatement.execute([word]);
  }

  static bool isLoveMusic(String id) {
    // 准备查询语句
    var queryStatement = _database.prepare('''
    SELECT * FROM love WHERE id = ?
  ''');
    // 执行查询操作，传入ID参数
    var result = queryStatement.select([id]);
    return result.isNotEmpty;
  }

  static bool isLocal(String id) {
    // 准备查询语句
    var queryStatement = _database.prepare('''
    SELECT * FROM download WHERE id = ?
  ''');
    // 执行查询操作，传入ID参数
    var result = queryStatement.select([id]);
    return result.isNotEmpty;
  }
}
