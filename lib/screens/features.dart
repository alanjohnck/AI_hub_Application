import 'package:flutter/material.dart';
import 'package:dicee/components/login_text.dart';
import 'summarizer.dart';
import 'package:dicee/constants.dart';
import 'package:dicee/components/feature_info_box.dart';
import 'voice_asisst.dart';
import 'package:animate_do/animate_do.dart';
class FeaturePage extends StatefulWidget {
  static const String id = "features";

  @override
  State<FeaturePage> createState() => _FeaturePageState();
}

class _FeaturePageState extends State<FeaturePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF77DEEC),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, Summarizer.id);
            },
            child: FadeInLeft(
              child: FeatureInfoBox(
                image: Image.asset(
                  'images/ai_extractor.png',
                  fit: BoxFit.fill,

                ),
                infotext: Text(
                  "AI Article Extractor/Note Maker",
                  style: ktextdefault.copyWith(fontSize: 18.0),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap:(){
              Navigator.pushNamed(context, VoiceAsisst.id);
            } ,
            child: FadeInRight(
              child: FeatureInfoBox(
                image:Image.asset('images/voice_asisstant.png') ,
                infotext:Text("Text To Speech",
                style: ktextdefault.copyWith(fontSize: 18.0),
              ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

