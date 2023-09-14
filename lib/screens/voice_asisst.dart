import 'package:flutter/material.dart';
import 'package:text_to_speech/text_to_speech.dart';

import 'package:dicee/components/input_box.dart';
class VoiceAsisst extends StatefulWidget {
  static const String id = "voice_asisst";

  @override
  State<VoiceAsisst> createState() => _VoiceAsisstState();
}

class _VoiceAsisstState extends State<VoiceAsisst> {
  String speachString = "";

  void getSpeak() async {
    TextToSpeech tts = await TextToSpeech();
    String text = speachString;
    tts.speak(text);
  }

  void getPause() {
    TextToSpeech tts = TextToSpeech();
    tts.pause();
  }

  void getResume() {
    TextToSpeech tts = TextToSpeech();
    tts.resume();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF77DEEC),
        body: Column(
          children: [
            Container(
              color: Color(0xFF77DEEC),
              child: InputBox(
                hintText: "Enter the text",
                onChange: (value) {
                  setState(() {
                    speachString = value;
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                getSpeak();
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                  Size(100, 40),
                ),
                foregroundColor: MaterialStateProperty.all(Color(0xFF77DEEC)),
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: Text("GET VOICE"),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        getPause();
                      },
                      child: Icon(Icons.pause),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        getResume();
                      },
                      child: Icon(Icons.play_arrow),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                color: Color(0xFFA5E9F2),
                child: Column(
                  children: [

                    SizedBox(height: 20), // Add some spacing
                    Text(
                      speachString, // Display the text statically

                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
