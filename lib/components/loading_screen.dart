import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Spinner  extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return
        Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
        color: Colors.white,
        size: 200,
    ),
    );

  }
}
