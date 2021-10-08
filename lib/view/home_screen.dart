import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_home/data/remote/response/status.dart';
import 'package:take_home/models/album.dart';
import 'package:take_home/view/detail_screen.dart';
import 'package:take_home/view/widgets/app_search_button.dart';
import 'package:take_home/view/widgets/app_text_field.dart';
import 'package:take_home/view/widgets/error_widget.dart';
import 'package:take_home/view/widgets/loader.dart';
import 'package:take_home/view/widgets/notify.dart';
import 'package:take_home/view_model/album_view_model.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = "home-screen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final viewModel = AlbumViewModel();
  final _searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Album",
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.white
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.0.w),
        child: Column(
          children: [
            SizedBox(
              height: 2.0.h,
            ),
            Row(
              children: [
                Expanded(child: AppTextField(controller: _searchController, hintText: "Enter Album")),
                SizedBox(
                  width: 3.0.w,
                ),
                AppSearchButton(function:(){
                  if(_searchController.text.isEmpty){
                    Notify.showSnackBar(context, "Enter an album to search");
                    return;
                  }
                  final viewModel =
                  Provider.of<AlbumViewModel>(context, listen: false);

                  viewModel.fetchAlbum(_searchController.text);
                })
              ],
            ),
            SizedBox(
              height: 2.0.h,
            ),
            Consumer<AlbumViewModel>(builder: (context,viewModel,_){
              switch(viewModel.album.statusCode){
                case Status.loading:
                  return const Loader();
                case Status.result:
                  return _getAlbumListView(viewModel.album.responseObject?.results?.albummatches?.album);
                case Status.error:
                  return ErrorPage(viewModel.album.statusMessage ?? "Something went wrong, try again");
                default:
                  return Container();
              }
              return Container();
            })
          ],
        ),
      ),
    );
  }

  _getAlbumListView(List<ArtistAlbum>? albumList){
    return Expanded(
      child: ListView.builder(
          itemCount: albumList?.length,
          itemBuilder: (context,i){
            return _getItem(albumList![i]);
      }),
    );
  }

  Widget _getItem(ArtistAlbum item) {
    return Card(
      child: ListTile(
        leading: ClipRRect(
          child: Image.network(
            item.image!.first.text ?? "",
            fit: BoxFit.fill,
            width: 20.0.w,
            height: 20.0.h,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        title: Text(item.name ?? ""),
        subtitle: Text(item.artist ?? ""),

        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailScreen(album: item)));
        },
      ),
      elevation: 2.0,
    );
  }
}
