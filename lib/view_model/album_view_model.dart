import 'package:flutter/material.dart';
import 'package:take_home/data/remote/response/api_response.dart';
import 'package:take_home/models/album.dart';
import 'package:take_home/repository/album/album_repo_impl.dart';

class AlbumViewModel extends ChangeNotifier{
  final _albumRepo = AlbumRepoImpl();

  ApiResponse<Album> album = ApiResponse.initialize();

  void _setUiState(ApiResponse<Album> response){
    album = response;
    notifyListeners();
  }

  void fetchAlbum(String albumName) async{
    _setUiState(ApiResponse.loading());
    _albumRepo
        .getAlbumList(albumName)
        .then((value) => _setUiState(ApiResponse.result(value)))
        .onError((error, stackTrace) => _setUiState(ApiResponse.error(error.toString())));
  }
}