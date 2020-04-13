import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './user.dart';



final  _firestore = Firestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseUser currentUser;
String errorMessage;

Future<String> registerUser(User user) async {
  try {
    await _auth.createUserWithEmailAndPassword(
        email: user.email, password: user.password);
    await _firestore.collection('users').document("${user.email}").setData({
      'email': user.email,
      'password': user.password,
      'first_name': user.firstName,
      'middle_name': user.middleName,
      'last_name': user.lastName,
      'national_id': user.nationalID,
      'phone': user.phone,
      'status': user.status,
      'score': user.score,
      'age': user.age,
      'gender': user.gender
    });
    errorMessage = null;
  } catch (error) {
    errorMessage = error.message;
  }
  return errorMessage;
}

Future<String> loginUser(email, password) async {
  try {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    errorMessage = null;
  } catch (error) {
    switch (error.code) {
      case "ERROR_INVALID_EMAIL":
        errorMessage = "Your email address appears to be malformed.";
        break;
      case "ERROR_WRONG_PASSWORD":
        errorMessage = "Your password is wrong.";
        break;
      case "ERROR_USER_NOT_FOUND":
        errorMessage = "User with this email doesn't exist.";
        break;
      case "ERROR_USER_DISABLED":
        errorMessage = "User with this email has been disabled.";
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        errorMessage = "Too many requests. Try again later.";
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
        errorMessage = "Signing in with Email and Password is not enabled.";
        break;
      default:
        errorMessage = "An undefined Error happened.";
    }
  }

  return errorMessage;
}

Future<String> sendPasswordResetEmail(String email) async {
  try {
    await _auth.sendPasswordResetEmail(email: email);
  } catch (error) {
    errorMessage = error.message;
  }
  return errorMessage;
}


Future<User> getCurrentUser() async {
  currentUser = await _auth.currentUser();
  String email = currentUser.email;
  DocumentSnapshot doc =
      await _firestore.collection('users').document('$email').get();
      
  User user = User(
      email: doc.data['email'],
      password: doc.data['password'],
      phone: doc.data['phone'],
      firstName: doc.data['first_name'],
      middleName: doc.data['middle_name'],
      lastName: doc.data['last_name'],
      score: doc.data['score'],
      status: doc.data['status'],
      nationalID: doc.data['national_id'],
      age: doc.data['age'],
      gender: doc.data['gender'],
      );
      return user;
}

void updateUserStatus(  status) async {
  currentUser = await _auth.currentUser();
  String email = currentUser.email;
  await _firestore
      .collection('users')
      .document('$email')
      .updateData({'status': status});
}
/*

  catch (e) {
  authProblems errorType;
  if (Platform.isAndroid) {
    switch (e.message) {
      case 'There is no user record corresponding to this identifier. The user may have been deleted.':
        errorType = authProblems.UserNotFound;
        break;
      case 'The password is invalid or the user does not have a password.':
        errorType = authProblems.PasswordNotValid;
        break;
      case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
        errorType = authProblems.NetworkError;
        break;
      // ...
      default:
        print('Case ${e.message} is not yet implemented');
    }
  } else if (Platform.isIOS) {
    switch (e.code) {
      case 'Error 17011':
        errorType = authProblems.UserNotFound;
        break;
      case 'Error 17009':
        errorType = authProblems.PasswordNotValid;
        break;
      case 'Error 17020':
        errorType = authProblems.NetworkError;
        break;
      // ...
      default:
        print('Case ${e.message} is not yet implemented');
    }
  }
  */
