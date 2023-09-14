import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flip_card/flip_card.dart';
import '../components/login_text.dart';
import '../components/login_imagecard.dart';
import '../components/input_box.dart';
import 'features.dart';
import 'package:animate_do/animate_do.dart';

class Inputpage extends StatefulWidget {
  static const String id = 'input_page';
  @override
  State<Inputpage> createState() => _InputpageState();
}

class _InputpageState extends State<Inputpage>
    with SingleTickerProviderStateMixin {
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1DC8DF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Color(0xFF1DC8DF),
                  child: ZoomIn(
                    child: Image.asset(
                      'images/avatar1.png',
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: FadeInRight(
                  child: LoginText(
                    label: 'Instant Content Summaries',
                  ),
                ),
              ),
            ],
          ),
          ZoomIn(
            child: FlipCard(
              fill: Fill.fillBack,
              direction: FlipDirection.HORIZONTAL,
              side: CardSide.FRONT,
              front: Container(
                child: CircleAvatar(
                  radius: 150,
                  backgroundColor: Color(0xFF1DC8DF),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset(
                      'images/avatar2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              back: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  side: BorderSide(
                    color: Colors.white,
                  ),
                ),
                shadowColor: Colors.white,
                surfaceTintColor: Colors.white,
                color: Color(0xFF1DC8DF),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Icon(
                        Icons.people_alt_outlined,
                        size: 40.0,
                      ),
                    ),
                    InputBox(
                      onChange: (value) {},
                      hintText: "Enter your email",
                      suffix: Text("@gmail.com"),
                    ),
                    InputBox(
                      onChange: (value) {},
                      hintText: "Enter your password",
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, FeaturePage.id);
                      },
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(50, 50)),
                        foregroundColor: MaterialStateProperty.all(
                            Color(0xFF77DEEC)),
                        backgroundColor:
                        MaterialStateProperty.all(Colors.white),
                      ),
                      child: Text("Sign Up"),
                    )
                  ],
                ),
              ),
              autoFlipDuration: const Duration(seconds: 3),
            ),
          ),
          LoginImageCard(
            radius: 100,
          ),
        ],
      ),
    );
  }
}
