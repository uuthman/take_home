import 'package:take_home/data/remote/network/base_api_service.dart';
import 'package:take_home/data/remote/network/network_api_service.dart';
import 'package:take_home/models/album.dart';
import 'package:take_home/repository/album/album_repo.dart';

class AlbumRepoImpl implements AlbumRepo{

  final BaseApiService _apiService = NetworkApiService();
  @override
  Future<Album?> getAlbumList(String albumName) async{
    try{
      final params = {
        "method": "album.search",
        "album":albumName,
      };
      dynamic response = await _apiService.getRequest("",params: params);
      final jsonResponse = Album.fromJson(response);
      return jsonResponse;
    }catch(e){
      rethrow;
    }
  }

}