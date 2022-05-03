import 'package:flutter/material.dart';
import 'first_view.dart';
import 'second_view.dart';
import 'package:http/http.dart' as http;


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Simple App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstView(),
    );
  }
}




