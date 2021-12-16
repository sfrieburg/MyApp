import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<LoginScreen> {
  String _email = "Error", _password = "Error";
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Login',
        ),
      ),
      body: Column (
        children: [
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: 'Email'),
            onChanged: (value) {
              setState(() {
                _email = value.trim();
              });
            },
          ),
          TextField(
            obscureText: true,
            decoration: const InputDecoration(hintText: 'Password'),
            onChanged: (value) {
              setState(() {
                _password = value.trim();
              });
            },
          ),
          Row(
            children: [
              ElevatedButton(
                child: const Text('Sign In'),
                onPressed: () {
                  auth.signInWithEmailAndPassword(email: _email, password: _password);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
                  },
              ),
              ElevatedButton(
                child: const Text('Sign Up'),
                onPressed: () {
                  auth.createUserWithEmailAndPassword(email: _email, password: _password);
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