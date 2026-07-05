import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../../model/song/song.dart';

abstract interface class DataSource{
  Future<List<Song>?> loadData();
}

class RemoteDataSource implements DataSource{
  @override
  Future<List<Song>?> loadData() async {
    const url = 'https://thantrieu.com/resources/braniumapis/songs.jsons';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if(response.statusCode == 200 ){
      final bodyContent = utf8.decode(response.bodyBytes); //khi kéo từ internet về có ký tự tiếng Việt nên phải dùng utf8 để giải mã
      var songWrapper = jsonDecode(bodyContent) as Map;
      var songList = songWrapper['songs'] as List;
      List<Song> songs = songList.map((song) => Song.fromJson(song)).toList();
      return songs;
    }
    return null;
  }
}

class LocalDataSource implements DataSource{
  @override
  Future<List<Song>?> loadData() async{
    final String response = await rootBundle.loadString('assets/songs.json'); //đọc file là rootBundle.loadString('file path')
    final jsonBody = jsonDecode(response) as Map;
    final songList = jsonBody['songs'] as List;
    List<Song> songs = songList.map((song) => Song.fromJson(song)).toList();
    return songs;
  }
}