import 'package:flutter/material.dart';
import './signup_screen.dart';
import '../widgets/text_field.dart';
import './main_screen.dart';
import '../models/auth.dart';
import '../models/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  static const route = "/loginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

final _emailController = TextEditingController();
final _passwordController = TextEditingController();
String errorMessage;
bool isLoading = false;

class _LoginScreenState extends State<LoginScreen> {
  
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
              child: _buildForm( context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton(context) {
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
            loginUser(_emailController.text, _passwordController.text)
                .then((value) {
              setState(() {
                isLoading = false;
                errorMessage = value;
              });
              if (errorMessage != null)
                return showAlertDialog(context, errorMessage);
              else{
                _emailController.text = "";
                _passwordController.text = "";
              }
                 
            });
          },
          child: Text(AppLocalizations.of(context).translate('login')),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
            side: BorderSide(color: Color(0xFF45746E)),
          ),
        ),
      ),
    );
  }

  Widget _buildForm( context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
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
                      .pushReplacementNamed(MainScreen.route))),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          Text(
            AppLocalizations.of(context).translate('login'),
            style: TextStyle(
                fontSize: 40,
                color: Colors.white70,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          BuildTextField(AppLocalizations.of(context).translate('email'),
              TextInputType.emailAddress, _emailController),
          BuildTextField(AppLocalizations.of(context).translate('password'),
              TextInputType.visiblePassword, _passwordController),
          _buildForgotPasswordtButton(),
          isLoading ? CircularProgressIndicator() : _buildSubmitButton(context),
          _buildSignUptButton(context),
        ],
      ),
    );
  }

  Widget _buildForgotPasswordtButton() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Align(
        alignment: FractionalOffset.bottomRight,
        child: FlatButton(
          onPressed: () {},
          child: Text(AppLocalizations.of(context).translate('forgot_password'),
              style: TextStyle(decoration: TextDecoration.underline)),
        ),
      ),
    );
  }

  Widget _buildSignUptButton(context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: FlatButton(
        onPressed: () => Navigator.of(context).pushNamed(SignupScreen.route),
        child: Text(AppLocalizations.of(context).translate('dont_have_account'),
            style: TextStyle(decoration: TextDecoration.underline)),
      ),
    );
  }

  showAlertDialog(BuildContext context, message) {
    errorMessage = null;

    // set up the button
    Widget okButton = FlatButton(
      child: Text(AppLocalizations.of(context).translate('ok')),
      onPressed: () => Navigator.of(context).pop(),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(AppLocalizations.of(context).translate('error')),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
