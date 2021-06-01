import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orange_valley_caa/models/video.dart';
import 'package:orange_valley_caa/services/video_api.dart';
import 'package:orange_valley_caa/utils/constants.dart';
import 'package:orange_valley_caa/widgets/videos_grid.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(title: Text('Orange Valley CAA') , backgroundColor: Colors.black,),
      body: Container(
        color: backgroundColor,
        child: FutureBuilder(
          future: getVideosFromApi(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){//si nous sommes toujours en attente des donnees
              return Center(
                child: CircularProgressIndicator(),
              );
            }else if(snapshot.hasError){//si cela contient des erreurs
              return Center(
                child: Text("Connexion incorrecte"),
              );
            }else{
              return VideosGrid(videos: snapshot.data);
            }
          },
        ),
      ),
    );
  }

}