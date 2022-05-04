import 'package:flutter/material.dart';
import 'second_view.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FirstView extends StatefulWidget {
  const FirstView({Key? key}) : super(key: key);

  @override
  State<FirstView> createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> { // Creates the card in first view
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell( // Allows the card to change color when tapped
        onTap: () {

        },
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                title: Text('This Is A Card', textAlign: TextAlign.center,),
              ),
              const ListTile(
                title: Text('Update the color by click on it', textAlign: TextAlign.center,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  const SizedBox(width: 8, height: 40),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class FirstRoute extends StatelessWidget { // First view including card and button, routes to second view
  const FirstRoute({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First View'),
      ),
      body: Center(
        child: Column(
          children: [FirstView(),
            ElevatedButton(
              child: const Text('Second View'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondView()),
                );
                // Navigate to second route when tapped.
              },
            ),
          ],
        ),
      ),
    );
  }
}

Future<Color> fetchColor() async { // Fetch information with API endpoint
  final response = await http
      .get(Uri.parse('https://5fnqqpo4pvqof7dhkf2rjyrtbe0yayfh.lambda-url.us-east-1.on.aws/'));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Color.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load color');
  }
}


class Color { // Constructors for the updating colors
  final String hex;
  final int red, green, blue, opacity;

  const Color({
    required this.hex, required this.red, required this.green, required this.blue, required this.opacity
  });


factory Color.fromJson(Map<String, dynamic> json) { //
  return Color(
    hex: json['hex'],
    red: json['red'],
    green: json['green'],
    blue: json['blue'],
    opacity: json['opacity'],
  );
}
}

/*
class MyAppState extends State<MyApp> {
  late Future<Color> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchColor();
  }
// ···
}
*/
