import 'package:flutter/foundation.dart';


class User {


  final String firstName,
      middleName,
      lastName,
      phone,
      email,
      password,
     nationalID,
      status,
      gender;
      int score , age;
  User(
      {@required this.firstName,
      @required this.email,
      @required this.lastName,
      @required this.middleName,
      @required this.nationalID,
      @required this.password,
      @required this.phone,
      @required this.status,
      @required this.score,
      @required this.age,
      @required this.gender,
      });

}





