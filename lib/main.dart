import 'package:flutter/material.dart';
import 'package:spotify_app/ui/music_home_page/music_home_page.dart';

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MusicHomePage(),
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
  ));
}

