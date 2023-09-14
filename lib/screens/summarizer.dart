import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dicee/components/input_box.dart';
import 'package:dicee/components/loading_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart'; // Import the loading_animation_widget package

class Summarizer extends StatefulWidget {
  static const String id = 'summarizer';

  @override
  State<Summarizer> createState() => _SummarizerState();
}

class _SummarizerState extends State<Summarizer> {
  final String apiUrl =
      'https://article-extractor-and-summarizer.p.rapidapi.com/summarize-text';
  final String apiKey =
      '82ef279bd1msh3322c1dfa339964p12389bjsn8f371963ca71'; // Replace with your RapidAPI key
  String textstring = '';
  String summarizedText = ''; // Variable to hold the summarized text
  bool isLoading = false; // Flag to track data fetching

  // New function to show loading animation
  void showLoadingAnimation() {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Center(
            child: LoadingAnimationWidget.staggeredDotsWave(
              color: Colors.white,
              size: 50,
            ),
          ),
        );
      },
    );
  }

  Future<void> fetchData() async {
    try {
      setState(() {
        isLoading = true; // Set loading flag to true before fetching data
      });

      // Show the loading animation
      showLoadingAnimation();

      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'content-type': 'application/json',
          'X-RapidAPI-Key': apiKey,
          'X-RapidAPI-Host': 'article-extractor-and-summarizer.p.rapidapi.com',
        },
        body: json.encode({
          'lang': 'en',
          'text': '$textstring', // Replace with the text you want to summarize
        }),
      );

      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body);
        setState(() {
          summarizedText = decodedData[
          'summary']; // Update summarizedText with the summary from the API
          isLoading = false; // Set loading flag to false after data is fetched
        });

        // Close the loading animation dialog
        Navigator.of(context).pop();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      setState(() {
        isLoading = false; // Set loading flag to false on error
      });
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF1DC8DF),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: InputBox(
                hintText: "Enter the text",
                onChange: (value) {
                  setState(() {
                    textstring = value;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: ElevatedButton(
                onPressed: () {
                 // Call fetchData when the button is pressed
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(100, 40)),
                  foregroundColor: MaterialStateProperty.all(Color(0xFF77DEEC)),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Text("Summarize"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Container(
                child: Align(
                  widthFactor: double.infinity,
                  alignment: Alignment.center,
                  child: Container(
                    color: Color(0xFFA5E9F2),
                    child: isLoading // Conditionally render the loading animation
                        ?null
                        : Text(
                      summarizedText, // Display the summarized text
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
