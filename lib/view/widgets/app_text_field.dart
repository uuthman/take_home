import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const AppTextField(
      {Key? key,
        required this.controller,
        required this.hintText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText ,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
      ),
    );
  }
}