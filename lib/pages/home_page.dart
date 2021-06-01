import 'package:flutter/material.dart';
import 'package:orange_valley_caa/models/video.dart';
import 'package:orange_valley_caa/services/video_api.dart';
import 'package:orange_valley_caa/utils/constants.dart';
import 'package:orange_valley_caa/utils/helper.dart';
import 'package:orange_valley_caa/widgets/videos_grid.dart';

class HomePage extends StatefulWidget{


  @override
  _HomePageState  createState()=> _HomePageState();

}

class _HomePageState  extends State<HomePage> {
  List<Video> videos = [];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    getVideosFromApi().then((value) {
      setState(() {
        videos = value;
      });
    });
    return Scaffold(
      appBar: AppBar(title: Text('Orange Valley CAA') , backgroundColor: Colors.black,),
      body: Container(
        color: backgroundColor,
        child: VideosGrid(videos: videos,),
      ),
    );
  }
}