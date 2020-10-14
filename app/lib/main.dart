import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'login_model.dart';

import 'dart:convert';

import 'screens/registration.dart';
import 'screens/home.dart';
//import

void main() {
  runApp(MyApp());
}
//run

final TextEditingController tuserIdController = TextEditingController();
final TextEditingController tpasswdController = TextEditingController();

final String url = 'https://10.0.2.2:8080/';

String targeturl;

LoginData _loginData;

Future<LoginData> createUser(String userId, String passwd) async {
  final msg = jsonEncode({'userId': userId, 'passwd': passwd});

  final response = await http.post(
    targeturl,
    headers: {'Content-Type': 'application/json'},
    body: msg,
  );

  if (response.statusCode == 201) {
    final String responseString = response.body;
    return loginFromJson(responseString);
  } else if (response.statusCode == 400) {
    return null;
  }
}
//define input textarea

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: new LoginForm(),
    );
  }
}

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(30.0, 38.0, 0.0, 0.0),
                      child: Text('Green',
                          style: TextStyle(
                              fontSize: 50.0, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(25.0, 90.0, 0.0, 0.0),
                      child: Text('Coffee',
                          style: TextStyle(
                              fontSize: 80.0, fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: tuserIdController,
                        decoration: InputDecoration(
                            labelText: 'ID',
                            labelStyle: TextStyle(
                                fontFamily: 'Gothic',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(13, 255, 22, 0)))),
                      ),
                      TextField(
                        controller: tpasswdController,
                        decoration: InputDecoration(
                            labelText: 'PassWord',
                            labelStyle: TextStyle(
                                fontFamily: 'Gothic',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(13, 255, 22, 0)))),
                      ),
                      SizedBox(height: 5.0),
                      Container(
                          padding: EdgeInsets.only(top: 15, left: 140),
                          child: InkWell(
                            child: Text('you are not the member?',
                                style: TextStyle(
                                    color: Colors.green[400],
                                    decoration: TextDecoration.underline)),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          RegistrationPage()));
                            },
                          )),
                      SizedBox(height: 60),
                      Container(
                          height: 60,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.lightGreen,
                            elevation: 7.0,
                            child: GestureDetector(
                                onTap: () async {
                                  final String userId = tuserIdController.text;
                                  final String passwd = tpasswdController.text;

                                  targeturl = url + 'login/';
                                  //Navigator.push(
                                  //    context,
                                  //    CupertinoPageRoute(
                                  //        builder: (context) => Homepage()));

                                  _loginData = await createUser(userId, passwd);
                                  if (_loginData == null) {
                                    AlertDialog(
                                      title: new Text("Alert Dialog title"),
                                      content: new Text("Alert Dialog body"),
                                      actions: <Widget>[
                                        new FlatButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: new Text("Close"),
                                        ),
                                      ],
                                    );
                                  } else {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) => Homepage()));
                                  }
                                },
                                child: Center(
                                    child: Text('LOGIN',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        )))),
                          )),
                      Container(child: Column(children: <Widget>[]))
                    ],
                  ))
            ]));
  }
}
