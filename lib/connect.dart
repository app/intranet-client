// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Connect extends StatefulWidget {
  const Connect({Key? key}) : super(key: key);

  @override
  _ConnectState createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  @override
  Widget build(BuildContext context) {
    final Color bgColor = Color(int.parse("0xFF007291"));
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: 70,
                ),
                child: Text(
                  'Connect to',
                  style: TextStyle(fontSize: 40),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  'your intranet',
                  style: TextStyle(fontSize: 40),
                ),
              ),
              SizedBox(
                width: 120,
                height: 120,
                child: Image.asset('asset/images/stamp.png'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50, bottom: 10),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 15, top: 15, bottom: 15),
                      child: Text(
                        'https://',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    labelText: 'Intranet URL',
                  ),
                  controller: TextEditingController()
                    ..text = 'intranet.signapi.art',
                ),
              ),
              Text('Copy and paste or type in your intranet\'s URL',
                  style: TextStyle(fontSize: 14, color: Colors.grey)),
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(bgColor),
                    ),
                    child: Text(
                      'CONNECT',
                      style: TextStyle(
                        fontSize: 18,
                      ),
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
