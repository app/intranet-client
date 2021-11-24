// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intranet_client/signin.dart';
import 'package:intranet_client/scanner.dart';
import 'package:intranet_client/theme.dart';

const secureProtocol = 'https://';
const plainProtocol = 'http://';
const defautlIntranetUrl = 'intranet.example.com';

class Connect extends StatefulWidget {
  const Connect({Key? key}) : super(key: key);

  @override
  _ConnectState createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  String protocol = secureProtocol;
  final intranetUrl = TextEditingController()..text = defautlIntranetUrl;

  setUrl(url) {
    setState(() {
      if (url.toString().trim().contains(secureProtocol, 0)) {
        intranetUrl.text =
            url.toString().trim().replaceFirst(secureProtocol, '');
        protocol = secureProtocol;
        return;
      }
      if (url.toString().trim().contains(plainProtocol, 0)) {
        intranetUrl.text =
            url.toString().trim().replaceFirst(plainProtocol, '');
        protocol = plainProtocol;
        return;
      }
      intranetUrl.text = url;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    labelText: 'Intranet connection URL',
                    border: OutlineInputBorder(),
                    suffixIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            intranetUrl.clear();
                            protocol = secureProtocol;
                            setState(() {});
                          },
                          icon: Icon(
                              intranetUrl.text.isNotEmpty ? Icons.clear : null),
                        ),
                        IconButton(
                          icon: Icon(Icons.qr_code_rounded),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    QRViewWindow(setUrl: setUrl),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 15, top: 15, bottom: 15),
                      child: Text(
                        protocol,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  controller: intranetUrl,
                  onChanged: (text) {
                    setState(() {
                      if (text == '') {
                        protocol = secureProtocol;
                      }
                    });
                  },
                ),
              ),
              Text("Scan QR code or type in your intranet's URL",
                  style: TextStyle(fontSize: 14, color: Colors.grey)),
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignIn(url: intranetUrl.text)));
                    },
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

  @override
  void dispose() {
    intranetUrl.dispose();
    super.dispose();
  }
}
