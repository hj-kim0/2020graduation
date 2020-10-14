import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Qrpage extends StatelessWidget {
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
                  child: Image.network(
                      //url로 바꾸기
                      'https://ww.namu.la/s/0cfab2fd922e17120b3c2e24b1e81e148c66f5d28a9823ba68e834aecff79731b404e28255427bb4a0f14a92fdcba1892fda6c7a9c80d5e5a1c1c57d4c471d3785310b275d99129cf231f6d54b2ba87e5560e6d5974f7f28803fdf3691d3ee05'),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
