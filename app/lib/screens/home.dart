import 'package:app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'qrcodeview.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Homepage extends StatelessWidget {
  Map data;

  Future getData() async {
    http.Response response = await http.post(targeturl);

    data = json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
              child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 5.0),
                child: InkWell(
                  child: Text(
                    'qrcode',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 30,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => Qrpage()));
                  },
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
