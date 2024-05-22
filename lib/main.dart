import 'package:flutter/material.dart';
import 'package:mem_flutter/model/mv.dart';
import 'package:mem_flutter/page/video_player_page.dart';
import 'package:mem_flutter/tools/permission_tools.dart';
import 'package:video_player/video_player.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '5:20AM',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VideoPlayerPage(
        mvModel: MvModel(
            id: 0,
            name: "test",
            artistName: "test",
            cover: "test",
            url: "http://vodkgeyttp8.vod.126.net/cloudmusic/OCIiIzAmYTdgIjBkNjQgIg==/mv/419786/876e30d5b621fb5da64963d90a659c4b.mp4?wsSecret=b7746fc4f83013abc4f364f2723f84cf&wsTime=1715937785"
        ), url: 'http://vodkgeyttp8.vod.126.net/cloudmusic/OCIiIzAmYTdgIjBkNjQgIg==/mv/419786/876e30d5b621fb5da64963d90a659c4b.mp4?wsSecret=b7746fc4f83013abc4f364f2723f84cf&wsTime=1715937785',
      ) ,
    );
  }
}
