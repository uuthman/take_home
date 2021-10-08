import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppSearchButton extends StatelessWidget {
  final Function function;
  final IconData iconData;
  const AppSearchButton({Key? key, required this.function, this.iconData = CupertinoIcons.search}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function();
      },
      child: Container(
        child: Icon(
          iconData,
          color: Colors.white,
          size: 2.5.h,
        ),
        height: 6.0.h,
        width: 6.0.h,
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
