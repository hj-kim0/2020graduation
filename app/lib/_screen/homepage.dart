//메인 페이지
import 'dart:ui';

import 'package:app/_screen/homepage_qrcodescan.dart';
import 'package:app/_screen/homepage_admin_qr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/_screen/signin.dart';

import 'dart:convert' show json, base64, ascii;

class HomePage extends StatelessWidget {
  HomePage(this.jwt, this.payload);

  factory HomePage.fromBase64(String jwt) => HomePage(
      jwt,
      json.decode(
          ascii.decode(base64.decode(base64.normalize(jwt.split(".")[1])))));

  final String jwt;
  final Map<String, dynamic> payload;

  @override
  Widget build(BuildContext context) {
    double mywidth = MediaQuery.of(context).size.width;
    double myheight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GreenCafe',
          style: TextStyle(color: Colors.lightGreen),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.grey),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(color: Colors.grey[400]),
                child: InkWell(
                    child: Text(
                      '사용자',
                      style: TextStyle(
                          color: Colors.lightBlue[700],
                          fontSize: 25,
                          decoration: TextDecoration.underline),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) => Signin()));
                    })),
            ListTile(
              title: Text('적립 내역'),
              onTap: () {},
            ),
            ListTile(
              title: Text('기부 내역'),
              onTap: () {},
            ),
            ListTile(
              title: Text('매장 찾기'),
              onTap: () {},
            ),
            ListTile(
              title: Text('오늘의 추천'),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              title: Text('log out'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.zero,
        child: Column(children: <Widget>[
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: myheight * 0.5,
                  width: mywidth,
                  color: Colors.green,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      height: myheight * 0.364,
                      width: mywidth * 0.5,
                      color: Colors.red,
                      child: ButtonTheme(
                        child: FlatButton(
                          child: Text(
                            'QR코드 스캔',
                            style: TextStyle(fontSize: 24),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => QrCode()));
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: myheight * 0.364,
                      width: mywidth * 0.5,
                      color: Colors.blue,
                      child: ButtonTheme(
                        child: FlatButton(
                          child: Text(
                            'QR코드 생성',
                            style: TextStyle(fontSize: 24),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => QrCreate()));
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ])
        ]),
      ),
    );
  }
}
