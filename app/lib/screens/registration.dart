import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../user_model.dart';
import 'home.dart';

import 'dart:convert';

final TextEditingController tnameController = TextEditingController();
final TextEditingController tuserIdController = TextEditingController();
final TextEditingController tpasswdController = TextEditingController();
final TextEditingController tcityController = TextEditingController();
final TextEditingController tstreetController = TextEditingController();
final TextEditingController tzipcodeController = TextEditingController();

final String url = 'https://10.0.2.2:8080/';

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

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 30.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: tnameController,
                      decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(
                              fontFamily: 'Gothic',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(13, 255, 22, 0)))),
                    ),
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
                    TextField(
                      controller: tcityController,
                      decoration: InputDecoration(
                          labelText: 'City',
                          labelStyle: TextStyle(
                              fontFamily: 'Gothic',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(13, 255, 22, 0)))),
                    ),
                    TextField(
                      controller: tstreetController,
                      decoration: InputDecoration(
                          labelText: 'Street',
                          labelStyle: TextStyle(
                              fontFamily: 'Gothic',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(13, 255, 22, 0)))),
                    ),
                    TextField(
                      controller: tzipcodeController,
                      decoration: InputDecoration(
                          labelText: 'zipcode',
                          labelStyle: TextStyle(
                              fontFamily: 'Gothic',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(13, 255, 22, 0)))),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Container(
                  height: 50,
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

                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => Homepage()));

                          targeturl = url + 'account/create/';
                          //err시 수정해야함
                          final User user = await createUser(
                              name, userId, passwd, city, street, zipcode);
                        },
                        child: Center(
                            child: Text('register',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )))),
                  ))
            ],
          ),
        ));
  }
}
