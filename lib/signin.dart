// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
  final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Scaffold(
        appBar: AppBar(title: const Text('Intranet sign in')),
        body: SingleChildScrollView(child: 
        Column(
          children: <Widget>[
          Padding(padding: EdgeInsets.all(10),),
          Container(
            width: 120,
            height: 120,
            child: Image.asset('asset/images/stamp.png'),
          ),
          Padding(
            padding: EdgeInsets.only(top:20,left:10,right:10,bottom:10),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'User Name',
                hintText: 'Enter valid mail id as abc@gmail.com'),
              ),
            ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Enter your secure password'
                ),
              ),
            ),

          TextButton(
              onPressed: (){
                /* TODO FORGOT PASSWORD SCREEN GOES HERE */
              },
              child: Text(
                       'Forgot Password',
              style: TextStyle(color: Colors.blue, fontSize: 15),
            ),
          ),
          ElevatedButton(
            onPressed: (){ /* TODO */},
            style: style,
            child: Text('Sign In'),),
          ]
        )));
  }
}
