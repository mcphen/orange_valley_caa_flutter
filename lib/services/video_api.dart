import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:orange_valley_caa/models/video.dart';
import 'package:orange_valley_caa/utils/helper.dart';

Future<List<Video>> getVideosFromApi({VideoSort filter = VideoSort.id}) async {
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  final url = Uri.http('orangevalleycaa.org', '/api/videos/order/${filter.filterName()}');

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var json =response.body;
    return videoFromJson(json);
  } else {
    return [];
  }
}