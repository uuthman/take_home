import 'package:flutter/material.dart';
import 'package:take_home/models/album.dart';
import 'package:sizer/sizer.dart';

class DetailScreen extends StatelessWidget {


  final ArtistAlbum album;

  const DetailScreen({Key? key,required this.album}) : super(key: key);
  static const routeName = "detail-screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,title: Text(
        album.name ?? "",
        style: TextStyle(
            fontSize: 16.sp,
            color: Colors.white
        ),
      )),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: [
                Center(
                  child: Image.network(
                    album.image!.first.text ?? "",
                    fit: BoxFit.fill,
                    height: 15.0.h,
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(album.name ?? ""),
                        subtitle: Text(album.artist ?? ""),

                      ),
                    ],
                  ),
                  elevation: 2.0,
                  margin: const EdgeInsets.all(5),
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
