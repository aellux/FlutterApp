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

  final myController = TextEditingController(); // Creates the controller for updating text
  String newText = "";

  @override
  void dispose(){
    myController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              TextField(
              controller: myController,
              textAlign: TextAlign.center,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Quote',
              ),
            ),
            ElevatedButton( // Button that updated the textfield box with a new quote
              child: const Text('Generate Quote'),
              onPressed: () {
                fetchQuote();
                 String updatedText = myController.text + newText;
                 myController.value = myController.value.copyWith(
                   text: newText,
                 );
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
      newText = response.body;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load quote');
    }
  }
}







