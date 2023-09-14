import 'package:flutter/material.dart';
import 'package:dicee/constants.dart';
import 'login_text.dart';
import 'package:animate_do/animate_do.dart';

class LoginImageCard extends StatelessWidget {
  final double? radius;
  LoginImageCard({this.radius});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 3,
              child: FadeInLeft(
                child: LoginText(
                  label: "Voice-Activated Learning",
                ),
              )),
          Expanded(
              flex: 2,
              child: CircleAvatar(
                  radius: radius,
                  backgroundColor: Color(0xFF1DC8DF),
                  child: ZoomIn(
                    child: Image.asset(
                      'images/write.png',
                    ),
                  ),),
          ),
        ],
      ),
    );
  }
}
