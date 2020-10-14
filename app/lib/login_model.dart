import 'dart:convert';

LoginData loginFromJson(String str) => LoginData.fromJson(json.decode(str));
String loginToJson(LoginData data) => json.encode(data.toJson());

class LoginData {
  final String userId;
  final String passwd;

  LoginData(this.userId, this.passwd);

  LoginData.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        passwd = json['passwd'];
  // to send

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'passwd': passwd,
      };
}
// data group
