class Perbaikan {
  String _username;
  String _password;
  String _email;

  Perbaikan(this._username, this._password, this._email);

  Perbaikan.map(dynamic obj) {
    this._username = obj["username"];
    this._password = obj["password"];
    this._email = obj["email"];
  }
  String get username => _username;
  String get password => _password;
  String get email => _email;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map["username"] = _username;
    map["password"] = _password;
    map["email"] = _email;

    return map;
  }
}
