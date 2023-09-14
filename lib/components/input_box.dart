import 'package:flutter/material.dart';
import 'package:dicee/constants.dart';
class InputBox extends StatelessWidget {
  final String? hintText;
  final Widget? suffix;
  void  Function(String)? onChange;
  InputBox({this.hintText,this.suffix,required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Align(
          alignment: Alignment.center,
          child: TextFormField(
              onChanged: onChange,
              decoration: kTextFieldDecoration.copyWith(
                  suffix: suffix,
                  hintText:hintText,
                  hintStyle: TextStyle(color: Colors.white))),
        ),
      ),
    );
  }
}
