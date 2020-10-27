import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qrscan/qrscan.dart' as scanner;

//===============================================

class QrCreate extends StatefulWidget {
  @override
  _QrCreateState createState() => _QrCreateState();
}

class _QrCreateState extends State<QrCreate> {
  @override
  initState() {
    super.initState();
  }

  final String imgurl = 'http://10.0.2.2:8080/getQrImage';
  //'https://constant.kr/wp-content/uploads/2018/07/link-1271843_1280-1000x1000.png';
  @override
  Widget build(BuildContext context) {
    double myheight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: myheight * 0.2,
          ),
          Container(child: Image.network(imgurl))
        ],
      ),
    ));
  }
}
