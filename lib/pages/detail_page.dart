import 'package:flutter/material.dart';
import 'package:orange_valley_caa/models/video.dart';
import 'package:orange_valley_caa/pages/video_player_page.dart';
import 'package:orange_valley_caa/utils/constants.dart';

//---------------------------------------------------------------------
//---------------Widget représentant la page de détails----------------
//---------------------------------------------------------------------
class DetailsPage extends StatelessWidget {
  DetailsPage({required this.video});
  final Video video;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(video.name),
      ),
      body: Container(
        color: backgroundColor,
        height: double.infinity,
        child: _VideoDetail(video),
      ),
    );
  }
}

//---------------------------------------------------------------------
//---------------Widget affichant la liste des informations------------
//---------------------------------------------------------------------
class _VideoDetail extends StatelessWidget {
  _VideoDetail(this.video);
  final Video video;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        //--- image du haut
        _DetailsPoster(
          posterUrl: video.thumbnail,
          videoUrl: video.videoUrl,
        ),
        //--- separation
        SizedBox(height: 20),
        //--- description
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _getDescription(),
        ),
        //--- separation
        SizedBox(height: 50),
        //--- affichage des mots
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _DetailsKeywords(
            keywords: video.keywords,
          ),
        )
      ],
    );
  }

  // Méthode retournant la description d'une vidéo
  Widget _getDescription() => Text(
    video.description,
    style: TextStyle(
      fontSize: 22,
      color: Colors.white,
      fontFamily: 'CastoroCustom',
      fontStyle: FontStyle.italic,
    ),
  );
}

//---------------------------------------------------------------------
//------------Widget affichant l'image en grand d'une vidéo------------
//---------------------------------------------------------------------
class _DetailsPoster extends StatelessWidget {
  final posterUrl;
  final videoUrl;
  _DetailsPoster({this.posterUrl, this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: posterUrl,
        //--- détection du clic et ouverture de la page
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VideoPlayerScreen(url: videoUrl),
            ),
          ),
          //--- stack pour superposer l'image et l'icône blanche
          child: Stack(
            children: [
              //--- Image
              Container(
                width: double.infinity,
                height: 200,
                child: Image.network(posterUrl, fit: BoxFit.fitWidth),
              ),
              //--- Icône de lecture
              Center(
                child: Icon(
                  Icons.play_circle_outline,
                  size: 200,
                  color: Colors.white70,
                ),
              )
            ],
          ),
        ));
  }
}

//---------------------------------------------------------------------
//--------------Widget traitant les mots-clés de la vidéo--------------
//---------------------------------------------------------------------
class _DetailsKeywords extends StatelessWidget {
  final keywords;
  _DetailsKeywords({this.keywords});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: [
          // Exemple de keywork renvoyé par l'api:
          // "air,France,French,outdoors,painting,plein,watercolor"
          for (var genre in keywords.split(','))
            Padding(
              padding: EdgeInsets.all(3.0),
              child: Chip(
                label: Text(genre),
              ),
            )
        ],
      ),
    );
  }
}
