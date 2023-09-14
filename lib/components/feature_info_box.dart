import 'package:flutter/material.dart';
import 'package:dicee/constants.dart';

class FeatureInfoBox extends StatelessWidget {
  final Widget image;
  final Widget infotext;
  FeatureInfoBox({required this.image, required this.infotext});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(30.0),
        child: Container(
          decoration: kInputboxdecoration,
          width: double.infinity,
          height: 77.0,
          child: Row(
            children: [
              Expanded(
                 flex: 1,
                  child: Container(child: image)),
              Expanded(
                child: Align(alignment: Alignment.center, child: infotext),
                flex: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
