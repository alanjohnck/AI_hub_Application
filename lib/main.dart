import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/summarizer.dart';
import 'screens/features.dart';
import 'screens/voice_asisst.dart';
void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.black, scaffoldBackgroundColor: Colors.black),
      initialRoute: Inputpage.id,
      routes: {
        VoiceAsisst.id:(context)=>VoiceAsisst(),
        FeaturePage.id: (context) => FeaturePage(),
        Inputpage.id: (context) => Inputpage(),
        Summarizer.id: (context) => Summarizer()
      },
    );
  }
}
