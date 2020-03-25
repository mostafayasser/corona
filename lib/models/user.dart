import 'package:flutter/foundation.dart';


class User {


  final String firstName,
      middleName,
      lastName,
      phone,
      email,
      password,
      status,
      nationalID;

  User({@required this.firstName,
    @required this.email,
    @required this.lastName,
    @required this.middleName,
    @required this.nationalID,
    @required this.password,
    @required this.status,
    @required this.phone});

  User.fromData(Map<String, dynamic> data)
      : firstName = data['firstName'],
        middleName = data['email'],
        lastName = data['lastName'],
        phone = data['middleName'],
        email = data['nationalID'],
        password = data['password'],
        status = data['status'],
        nationalID = data['phone}'];

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'phone': phone,
      'email': email,
      'password': password,
      'status': status,
      'nationalID': nationalID,
    };
  }
}





