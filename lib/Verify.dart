import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({ Key? key }) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<VerifyScreen> {
  String _code = "Error";
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Verify',
          ),
        ),
        body: Column (
            children: [
              TextField(
                obscureText: false,
                decoration: const InputDecoration(hintText: 'Verification Code'),
                onChanged: (value) {
                  setState(() {
                    _code = value.trim();
                  });
                },
              ),


              Row(
                children: [
                  ElevatedButton(
                    child: const Text('Enter'),
                    onPressed: () {

                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
                    },
                  ),

                ],
              )
            ]
        )
    );
  }
}