class LoginResponse {
  Data? data;
  String? statusCode;
  String? message;

  LoginResponse({this.data, this.statusCode, this.message});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? token;
  String? isAdmin;
  String? id;
  String? firstName;
  String? email;
  String? mobile;
  String? gender;
  String? dOB;

  Data(
      {this.token,
      this.isAdmin,
      this.id,
      this.firstName,
      this.email,
      this.mobile,
      this.gender,
      this.dOB});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    isAdmin = json['isAdmin'];
    id = json['id'];
    firstName = json['first_name'];
    email = json['email'];
    mobile = json['mobile'];
    gender = json['gender'];
    dOB = json['DOB'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['isAdmin'] = this.isAdmin;
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['gender'] = this.gender;
    data['DOB'] = this.dOB;
    return data;
  }
}
