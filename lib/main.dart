import 'package:flutter/material.dart';
import 'package:orange_valley_caa/pages/home_page.dart';

void main() {
  runApp(OrangeValleyApp());
}

class OrangeValleyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }

}
