import 'package:spotify_app/data/source/data_source/data_source.dart';

import '../model/song/song.dart';

abstract interface class Repository {
  Future<List<Song>?> loadData();
}

class DefaultRepository implements Repository{
  final _localDataSource = LocalDataSource();
  final _remoteDataSource = RemoteDataSource();

  @override
  Future<List<Song>?> loadData() async{
    List<Song> songs = [];
    //chạy remote trước, nếu local null thì chạy vào local
    await _remoteDataSource.loadData().then((remoteSongs) async {
      if(remoteSongs==null){
        await _localDataSource.loadData().then((localSongs){
          if(localSongs!=null){
            songs.addAll(localSongs);
          }
        });
      }
      else{
        songs.addAll(remoteSongs);
      }
    });
    return songs;
  }
}