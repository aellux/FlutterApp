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
        //Create textfield that is set to nothing
        //Create a button & when clicked, call API endpoint and update textbox
        child: ElevatedButton( // Navigate back to first route when tapped.
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          child: const Text('Return to View 1'),
        ),
      ),
    );
  }
}