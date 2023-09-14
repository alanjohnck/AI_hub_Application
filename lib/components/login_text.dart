
import 'package:flutter/material.dart';
import 'package:dicee/constants.dart';
class LoginText extends StatelessWidget {
  final String? label;
  final double? width;
  LoginText({this.label,this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Text(
          label!,
          style: ktextdefault
        ),
      ),
      margin: EdgeInsets.all(20),
      decoration:kInputboxdecoration,
    );
  }
}