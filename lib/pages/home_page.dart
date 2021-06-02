import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orange_valley_caa/models/video.dart';
import 'package:orange_valley_caa/services/video_api.dart';
import 'package:orange_valley_caa/utils/constants.dart';
import 'package:orange_valley_caa/utils/helper.dart';
import 'package:orange_valley_caa/widgets/videos_grid.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedFilter = VideoSort.id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orange Valley CAA'),
        backgroundColor: Colors.black,
        actions: [
          PopupMenuButton(
            onSelected: _onChangeFilter,
            icon: Icon(Icons.sort),
            offset: Offset(0, 100),
            itemBuilder: (context) => [
              PopupMenuItem(value: VideoSort.id, child: Text('Par défaut')),
              PopupMenuItem(value: VideoSort.name, child: Text('Par nom')),
              PopupMenuItem(
                  value: VideoSort.duration, child: Text('Par durée')),
            ],
          ),
        ],
      ),
      body: Container(
        color: backgroundColor,
        child: FutureBuilder(
            future: getVideosFromApi(filter: _selectedFilter),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(child: CircularProgressIndicator());
              else if (snapshot.hasError)
                return Center(child: Text("Pas de connexion"));
              else
                return VideosGrid(videos: snapshot.data);
            }),
      ),
    );
  }

  void _onChangeFilter(VideoSort choice) {
    if (choice != _selectedFilter) {
      setState(() {
        _selectedFilter = choice;
      });
    }
  }
}
