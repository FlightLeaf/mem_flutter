import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:sqlite3/sqlite3.dart';
import '../model/mv.dart';

import 'sqlite_tools.dart';

class ApiDio {

  /// 搜索历史列表
  static List<String> searchList = [];
  /// 歌词映射表
  static Map<String, String> lyricsMap = {};
  /// MV列表
  static List<MvModel> newMvList = [];
  /// MVID列表
  static List<String> idList = [];

  static final Dio _dio = Dio();

  /// 获取MV
  static Future<void> getNewMV() async {
    try {
      newMvList.clear();
      for(String id in idList){
        Response response = await _dio.post("http://music.163.com/api/mv/detail?id=$id&type=mp4");
        Map<String, dynamic> mp4 = json.decode(response.toString());
        Map<String, dynamic> rand = mp4['data'];
        newMvList.add(MvModel.fromJson(rand));
      }
    } catch (e) {
      //DeBugMessage.addMistake(e.toString());
    }
  }

}

