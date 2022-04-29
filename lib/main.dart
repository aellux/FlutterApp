import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Card & Quote';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const FirstView(),
        floatingActionButton: const FirstRoute(),
        //Create a button under for "2nd view" for quote & route it to the other class
      ),
    );
  }
}

class FirstView extends StatelessWidget {
  const FirstView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      /*GestureDetector(
      onTap: () => insert api endpoint that updates the color
      Random color API endpoint: https://5fnqqpo4pvqof7dhkf2rjyrtbe0yayfh.lambda-url.us-east-1.on.aws
      */
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              title: Text('This Is A Card', textAlign: TextAlign.center,),
            ),
            const ListTile(
              title: Text('Click it', textAlign: TextAlign.center,),
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
    );
  }
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First View'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Second View'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondView()),
            );
            // Navigate to second route when tapped.
          },
        ),
      ),
    );
  }
}

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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FirstView()),
            );
          },
          child: const Text('View 1'),
        ),
      ),
    );
  }
}