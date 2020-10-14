class ReceivedUserData {
  String token;
  Data userdata;

  ReceivedUserData({this.token, this.userdata});

  ReceivedUserData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userdata = Data.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['userdata'] = this.userdata.toJson();
  }
}

class Data {
  String id;
  String name;
  String userId;
  String passwd;
  String point;
  Address address;

  Data(
      {this.id, this.name, this.userId, this.passwd, this.point, this.address});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userId = json['userId'];
    passwd = json['passwd'];
    point = json['point'];

    address = Address.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['userId'] = this.userId;
    data['passwd'] = this.passwd;
    data['point'] = this.point;
    data['address'] = this.address.toJson();
  }
}

class Address {
  String city;
  String street;
  String zipcode;

  Address({this.city, this.street, this.zipcode});

  Address.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    street = json['street'];
    zipcode = json['zipcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> addr = new Map<String, dynamic>();

    addr['city'] = this.city;
    addr['street'] = this.street;
    addr['zipcode'] = this.zipcode;

    return addr;
  }
}
