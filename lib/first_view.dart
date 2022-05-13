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
  Color futureAlbum = Colors.white;

  Widget build(BuildContext context) {
    return Center(
      child: InkWell( // Allows the card to change color when tapped
        onTap: () async { //Call fetch color & update the card background color with the Json data
          // TODO Update the Card color given the Json
          final myColor = await fetchColor();
          setState(() {
            futureAlbum = myColor.color();
          });
        },
        child: Card( // Creates the card UI
          color: futureAlbum,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                title: Text('This Is A Card', textAlign: TextAlign.center,),
              ),
              const ListTile(
                title: Text('Update the color by clicking on it', textAlign: TextAlign.center,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const <Widget>[
                  SizedBox(width: 8, height: 40),
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const FirstView(),
            ElevatedButton( //Button on push, routes to second
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

Future<MyColor> fetchColor() async { // Fetch information with API endpoint
  final response = await http
      .get(Uri.parse('https://5fnqqpo4pvqof7dhkf2rjyrtbe0yayfh.lambda-url.us-east-1.on.aws/'));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return MyColor.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load color'); // Throw exception if it didn't return a response
  }
}


class MyColor { // Constructors for the json values
  final String hex;
  final int red, green, blue;
  final double opacity;

  const MyColor({
      required this.hex, required this.red, required this.green, required this.blue, required this.opacity
  });

  factory MyColor.fromJson(Map<String, dynamic> json) { //Fetches the values
    return MyColor(
      hex: json['hex'],
      red: int.parse(json['red']?.toString() ?? '0'),
      green: int.parse(json['green']?.toString() ?? '0'),
      blue: int.parse(json['blue']?.toString() ?? '0'),
      opacity: double.parse(json['opacity']?.toString() ?? '1'),
    );
  }

  Color color() {
    return Color.fromRGBO(red, green, blue, opacity);
  }
}

