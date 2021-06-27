class UserModel {
  String name;
  String email;
  String qrcode;
  String password;
  String uId;
  bool isEmailVerified;

  double latitude;

  double longitude;

  UserModel({
    this.name,
    this.email,
    this.qrcode,
    this.password,
    this.uId,
    this.isEmailVerified,
    this.latitude,
    this.longitude,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    qrcode = json['qrcode'];
    password = json['password'];
    uId = json['uId'];
    isEmailVerified = json['isEmailVerified'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'qrcode': qrcode,
      'password': password,
      'uId': uId,
      'isEmailVerified': isEmailVerified,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
