//로그인

import 'package:app/_screen/homepage.dart';
import 'package:app/_screen/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:app/_class/signin_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert' show json, base64, ascii;

final TextEditingController tuserIdController = TextEditingController();
final TextEditingController tpasswdController = TextEditingController();

final String url = 'http://10.0.2.2:8080/';
String targeturl;

final storage = FlutterSecureStorage();

Future<String> sendIdPw(String userId, String passwd) async {
  final msg = jsonEncode({'userId': userId, 'passwd': passwd});

  var res = await http.post(
    targeturl,
    headers: {'Context-Type': 'application/json'},
    body: msg,
  );

  if (res.statusCode == 201) {
    //post 요청 리소스 생성 성공
    final String responseString = res.body;
    return res.body;
  } else if (res.statusCode == 400) {
    return null;
  }
}

class Signin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double mywidth = MediaQuery.of(context).size.width;
    double myheight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: myheight * 0.2),
          Container(
            child: Text('   안녕하세요.\n   GreenCafe입니다.',
                style: TextStyle(fontSize: 20)),
          ),
          Container(
              child: Text('    원활한 서비스 이용을 위해 로그인 해주세요.',
                  style: TextStyle(fontSize: 15))),
          SizedBox(height: myheight * 0.06),
          Container(
            child: TextField(
              controller: tuserIdController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: '아이디'),
            ),
          ),
          SizedBox(height: myheight * 0.02),
          Container(
            child: TextField(
              controller: tpasswdController,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: '비밀번호'),
            ),
          ),
          SizedBox(
            height: myheight * 0.05,
          ),
          Container(
            child: ButtonTheme(
                minWidth: mywidth * 0.8,
                height: myheight * 0.1,
                child: FlatButton(
                  child: Text(
                    '로그인',
                    style: TextStyle(fontSize: 24),
                  ),
                  onPressed: () async {
                    // var username = tuserIdController.text;
                    // var password = tpasswdController.text;

                    // var jwt = await sendIdPw(username, password);
                    // if (jwt != null) {
                    //   storage.write(key: "jwt", value: jwt);
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => HomePage.fromBase64(jwt)));
                    // } else {}
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage(null, null)));
                  },
                  color: Colors.green,
                  textColor: Colors.black,
                )),
            alignment: Alignment.center,
          ),
          SizedBox(
            height: myheight * 0.01,
          ),
          Container(
            child: ButtonTheme(
                minWidth: mywidth * 0.8,
                height: myheight * 0.1,
                child: FlatButton(
                  child: Text(
                    '회원가입',
                    style: TextStyle(fontSize: 24),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => Signup()));
                  },
                  color: Colors.grey[400],
                  textColor: Colors.white,
                )),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}
