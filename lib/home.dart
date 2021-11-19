import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cum',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cum Home'),
        ),
        body: const Center(
          child: Image(
            image: AssetImage('assets/dude.jpeg'),
          ),
        ),
      )
    );
  }
}