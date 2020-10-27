//회원가입
import 'package:app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'homepage.dart';
import 'package:app/_class/signup_model.dart';

final TextEditingController tnameController = TextEditingController();
final TextEditingController tuserIdController = TextEditingController();
final TextEditingController tpasswdController = TextEditingController();
final TextEditingController tcityController = TextEditingController();
final TextEditingController tstreetController = TextEditingController();
final TextEditingController tzipcodeController = TextEditingController();

final String url = 'http://10.0.2.2:8080/';

String targeturl;

Future<User> createUser(String name, String userId, String passwd, String city,
    String street, String zipcode) async {
  final msg = jsonEncode({
    'name': name,
    'userId': userId,
    'passwd': passwd,
    'city': city,
    'street': street,
    'zipcode': zipcode
  });

  final response = await http.post(
    targeturl,
    headers: {'Content-Type': 'application/json'},
    body: msg,
  );

  if (response.statusCode == 201) {
    final String responseString = response.body;
    return userFromJson(responseString);
  } else {
    return null;
  }
}

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double mywidth = MediaQuery.of(context).size.width;
    double myheight = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          children: <Widget>[
            SizedBox(height: myheight * 0.1),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: TextField(
                  controller: tnameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Name'),
                )),
            SizedBox(height: myheight * 0.02),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: TextField(
                  controller: tuserIdController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'ID'),
                )),
            SizedBox(height: myheight * 0.02),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: TextField(
                  controller: tpasswdController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'PassWord'),
                )),
            SizedBox(height: myheight * 0.02),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: TextField(
                  controller: tcityController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'City'),
                )),
            SizedBox(height: myheight * 0.02),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: TextField(
                  controller: tstreetController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Street'),
                )),
            SizedBox(height: myheight * 0.02),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: TextField(
                  controller: tzipcodeController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'zipcode'),
                )),
            SizedBox(height: myheight * 0.05),
            Container(
                width: mywidth * 0.9,
                height: myheight * 0.1,
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey,
                  elevation: 7.0,
                  child: GestureDetector(
                      onTap: () async {
                        final String name = tnameController.text;
                        final String userId = tuserIdController.text;
                        final String passwd = tpasswdController.text;
                        final String city = tcityController.text;
                        final String street = tstreetController.text;
                        final String zipcode = tzipcodeController.text;

                        targeturl = url + 'account/create/';
                        //err시 수정해야함
                        final User user = await createUser(
                            name, userId, passwd, city, street, zipcode);

                        if (user != null) {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => HomePage(null, null)));
                        } else {
                          AlertDialog(
                            title: new Text(""),
                            content: new Text("Err. wrong something"),
                            actions: <Widget>[
                              new FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: new Text("Close"),
                              ),
                            ],
                          );
                        }
                      },
                      child: Center(
                          child: Text('register',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )))),
                ))
          ],
        ));
  }
}
