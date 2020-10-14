String emailValidator(String val) {
  Pattern pattern =
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
  RegExp regex = new RegExp(pattern);

  if (!regex.hasMatch(val)) {
    return "Email format is invalid";
  } else {
    return null;
  }
}

String passwdValidator(String val) {
  if (val.length < 8) {
    return "PassWord must be longer than 8 chars";
  } else {
    return null;
  }
}
