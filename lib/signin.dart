// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:first/connect.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  // ignore: no_logic_in_create_state
  _SignInState createState() => _SignInState(url: url);
}

class _SignInState extends State<SignIn> {
  final String url;
  _SignInState({required this.url});
  @override
  Widget build(BuildContext context) {
    final Color bgColor = Color(int.parse("0xFF007291"));
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In to $url'),
        backgroundColor: bgColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            children: <Widget>[
              SizedBox(
                width: 120,
                height: 120,
                child: Image.asset('asset/images/stamp.png'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                      hintText: 'Enter valid mail id as abc@gmail.com'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter your secure password'),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: bgColor, fontSize: 15),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Connect(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(bgColor),
                  ),
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
