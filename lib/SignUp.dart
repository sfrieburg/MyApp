import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';
import 'login.dart';
import 'Verify.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({ Key? key }) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SignUpScreen> {
  String _email = "Error", _password = "Error", _FirstName = "Error", _LastName = "Error";
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Sign Up',
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
              TextField(
                obscureText: true,
                decoration: const InputDecoration(hintText: 'First Name'),
                onChanged: (value) {
                  setState(() {
                    _FirstName = value.trim();
                  });
                },
              ),
              TextField(
                obscureText: true,
                decoration: const InputDecoration(hintText: 'Last Name'),
                onChanged: (value) {
                  setState(() {
                    _LastName = value.trim();
                  });
                },
              ),
              Row(
                children: [
                  ElevatedButton(
                    child: const Text('Create'),
                    onPressed: () {
                      auth.createUserWithEmailAndPassword(email: _email, password: _password);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const VerifyScreen()));
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Return to Login'),
                    onPressed: () {

                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginScreen()));
                    },
                  ),
                ],
              )
            ]
        )
    );
  }
}