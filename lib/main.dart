import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_home/view/home_screen.dart';
import 'package:take_home/view_model/album_view_model.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) =>
       MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => AlbumViewModel())
        ],
        child: MaterialApp(
          title: 'Take Home',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(

            primarySwatch: Colors.blue,
          ),
          home: const HomeScreen(),
          routes: {
            HomeScreen.routeName: (context) => const HomeScreen(),
          },
        ),
      ),
    );
  }
}