import 'dart:convert';
import 'package:flutter/material.dart';
import 'first_view.dart';
import 'main.dart';
import 'package:http/http.dart' as http;



class SecondView extends StatefulWidget { // Second view
  const SecondView({Key? key}) : super(key: key);

  @override
  State<SecondView> createState() => _SecondViewState();
}


class _SecondViewState extends State<SecondView> {

  String newText = "Click Generate Quote!"; //Defaults the text when calling API

  @override
  void dispose(){
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // Creates the App Bar above
        title: const Text('Second View'),
      ),
      body: Center( // Centers the widget
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Aligns the child to the middle
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Text(newText),
            ),
            ElevatedButton( // Button that updated the textfield box with a new quote
              child: const Text('Generate Quote'),
              onPressed: () async { // When the button is clicked call fetchQuote()
                await fetchQuote();
              },
            ),
        ],
      ),
      ),
    );
  }
   fetchQuote() async { // Fetch information with API endpoint
    final response = await http
        .get(Uri.parse('https://irnvhor4mth6odid4xgxlodvoy0rgjwc.lambda-url.us-east-1.on.aws/'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      setState(() {
        newText = response.body;
      });
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load quote');
    }
  }
}







