import 'package:flutter/material.dart';
import 'package:spotify_app/data/repository/repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var repo = DefaultRepository();
  var songs = await repo.loadData();
  if(songs!=null){
    for(var song in songs){
      debugPrint(song.toString());
    }
  }
  else{
    debugPrint("Dữ liệu lỗi");
  }
}

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

