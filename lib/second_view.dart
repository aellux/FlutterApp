import 'dart:convert';
import 'package:flutter/material.dart';
import 'first_view.dart';
import 'main.dart';
import 'package:http/http.dart' as http;

class SecondView extends StatelessWidget { // Second view
  const SecondView({Key? key}) : super(key: key);

  @override
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
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'A quote will pop up here',
              ),
            ),
            ElevatedButton( // Navigate back to first route when tapped.
              child: const Text('Generate Quote'),
              onPressed: () {
              },
            ),
        ],
      ),
      ),
    );
  }
}

Future<Quote> fetchQuote() async { // Fetch information with API endpoint
  final response = await http
      .get(Uri.parse('https://irnvhor4mth6odid4xgxlodvoy0rgjwc.lambda-url.us-east-1.on.aws/'));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Quote.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load quote');
  }
}

class Quote { // Constructors for the updating textbox
  final String pQuote;

  const Quote({
    required this.pQuote,
  });

  factory Quote.fromJson(Map<String, dynamic> json) { //
    return Quote(
      pQuote: json['string'],
    );
  }
}