import 'package:flutter/material.dart';
import './login_screen.dart';
import '../widgets/text_field.dart';
import '../models/app_localizations.dart';
import '../models/dialog.dart';
import '../models/auth.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const route = "/forgetPasswordScreen";
  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

final _emailController = TextEditingController();
bool isLoading = false;

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.8],
            colors: [Color(0xFF8FDBB8), Color(0xFF51b5D8)],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.001,
                  ),
                  Align(
              alignment: FractionalOffset.bottomLeft,
              child: IconButton(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.06),
                  icon: Icon(
                    (AppLocalizations.of(context).translate('language') ==
                            "English")
                        ? Icons.arrow_forward
                        : Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.of(context)
                      .pushReplacementNamed(LoginScreen.route))),
                      SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Image.asset(
                    "assets/images/electropi1++.png",
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  BuildTextField(
                      AppLocalizations.of(context).translate('email'),
                      TextInputType.emailAddress,
                      _emailController),
                  isLoading
                      ? CircularProgressIndicator()
                      : _buildSubmitButton(context, LoginScreen.route),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton(context, route) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: ButtonTheme(
        buttonColor: Colors.white70,
        minWidth: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.08,
        child: RaisedButton(
          textColor: Color(0xFF45746E),
          onPressed: () {
            setState(() {
              isLoading = true;
            });
            sendPasswordResetEmail(_emailController.text).then((value) {
              setState(() {
                isLoading = false;
                errorMessage = value;
              });
              if (errorMessage != null) {
                return showAlertDialog(context, errorMessage,
                    AppLocalizations.of(context).translate('error'));
              } else {
                _emailController.text = "";
                return showAlertDialog(
                    context,
                    AppLocalizations.of(context).translate('reset_password'),
                    AppLocalizations.of(context)
                        .translate('reset_password_message'));
              }
            });
          },
          child: Text(
            AppLocalizations.of(context).translate('reset_password'),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
            side: BorderSide(color: Color(0xFF45746E)),
          ),
        ),
      ),
    );
  }
}
