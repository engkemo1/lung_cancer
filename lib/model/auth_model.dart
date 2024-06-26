class AuthModel {
  User? data;
  bool? success;

  AuthModel({this.data, this.success});

  AuthModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new User.fromJson(json['data']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = this.success;
    return data;
  }
}

class User {
  String? userName;
  String? email;
  String? password;
  String? code;
  String? type;

  User({this.userName, this.email, this.password, this.code, this.type});

  User.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    email = json['email'];
    password = json['password'];
    code = json['code'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_name'] = this.userName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['code'] = this.code;
    data['type'] = this.type;
    return data;
  }
}
