import 'package:flutter/material.dart';
import 'package:orange_valley_caa/models/video.dart';

//-----------------------------------------------------
//------------Widget affichant une GridView------------
//-----------------------------------------------------
class VideosGrid extends StatelessWidget {
  final List<Video> videos;

  VideosGrid({required this.videos});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        for (var video in videos)
          _VideoTile(
            imageUrl: video.thumbnail,
            title: video.name,
          )
      ],
    );
  }
}



//---------------------------------------------------------------------
//------------Widget représentant un élément de la GridView------------
//---------------------------------------------------------------------
class _VideoTile extends StatelessWidget {
  _VideoTile({required this.imageUrl, required this.title});
  final String imageUrl, title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // mettre de l'espace autour de chaque élément de la GridView
      padding: EdgeInsets.all(10.0),
      child: Stack(children: [
        //----------Image----------
        Container(
          width: double.infinity,
          height: double.infinity,
          child: ClipRRect(
            // Pour avoir des rebords arrondis dans le container
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(imageUrl, fit: BoxFit.cover),
          ),
        ),
        //----------Titre----------
        Align(
          // pour positionner, en bas au centre, dans la Stack
          alignment: Alignment.bottomCenter,
          child: Container(
            // on baisse l'opacité pour avoir un effet semi-transparent
            color: Colors.black.withOpacity(0.6),
            height: 35,
            child: Center(
              child: Text(
                title, // passé en paramètre du constructeur
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
