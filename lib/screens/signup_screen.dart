import 'package:flutter/material.dart';
import '../widgets/text_field.dart';
import '../models/auth.dart';
import '../models/user.dart';
import './Instructions.dart';
import '../models/app_localizations.dart';
import '../models/dialog.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class SignupScreen extends StatefulWidget {
  static const route = "/signupScreen";
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

bool isLoading = false;
final _emailController = TextEditingController();
final _passwordController = TextEditingController();
final _firstNameController = TextEditingController();
final _middleNameController = TextEditingController();
final _lastNameController = TextEditingController();
final _nationalIDController = TextEditingController();
final _phoneNumberController = TextEditingController();
final _ageController = TextEditingController();
String _genderController;

class _SignupScreenState extends State<SignupScreen> {
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
              child: _buildForm(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm(context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Align(
              alignment: FractionalOffset.bottomLeft,
              child: IconButton(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.04),
                  icon: Icon(
                    (AppLocalizations.of(context).translate('language') ==
                            "English")
                        ? Icons.arrow_forward
                        : Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.of(context).pop())),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Text(
            AppLocalizations.of(context).translate('signup'),
            style: TextStyle(
                fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          BuildTextField(AppLocalizations.of(context).translate('first_name'),
              TextInputType.text, _firstNameController),
          BuildTextField(AppLocalizations.of(context).translate('middle_name'),
              TextInputType.text, _middleNameController),
          BuildTextField(AppLocalizations.of(context).translate('last_name'),
              TextInputType.text, _lastNameController),
          BuildTextField(AppLocalizations.of(context).translate('age'),
              TextInputType.phone, _ageController),
          _buildGenderSelector(),
          BuildTextField(AppLocalizations.of(context).translate('phone'),
              TextInputType.phone, _phoneNumberController),
          BuildTextField(AppLocalizations.of(context).translate('email'),
              TextInputType.emailAddress, _emailController),
          BuildTextField(AppLocalizations.of(context).translate('password'),
              TextInputType.visiblePassword, _passwordController),
          BuildTextField(AppLocalizations.of(context).translate('id'),
              TextInputType.text, _nationalIDController),
          isLoading ? CircularProgressIndicator() : _buildSubmitButton(context),
        ],
      ),
    );
  }

  Widget _buildGenderSelector() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Align(
              alignment: (AppLocalizations.of(context).translate('language') == "English")
                        ? FractionalOffset.bottomRight : FractionalOffset.bottomLeft,
              child: Text(AppLocalizations.of(context).translate('gender'))),

          Row(
            children: <Widget>[
              RadioButtonGroup(
                orientation: GroupedButtonsOrientation.HORIZONTAL,
                labelStyle: TextStyle(color: Colors.white70),
                activeColor: Colors.teal,
                labels: <String>[
                  AppLocalizations.of(context).translate('male'),
                  AppLocalizations.of(context).translate('female')
                ],
                onSelected: (selected) => _genderController = selected,
              ),
            ],
          ),
        ],
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
          color: Colors.white,
          textColor: Color(0xFF45746E),
          onPressed: () {
            setState(() {
              isLoading = true;
            });
            registerUser(User(
                    email:"",// _emailController.text,
                    password:"",// _passwordController.text,
                    phone:"",// _phoneNumberController.text,
                    firstName:"",// _firstNameController.text,
                    middleName: "",//_middleNameController.text,
                    lastName: "",//_lastNameController.text,
                    nationalID: "",//_nationalIDController.text,
                    status: "0xFF00FF00",
                    score: 0,
                    age: 10,//int.parse(_ageController.text),
                    gender: ""//_genderController
                    ))
                .then((value) {
              setState(() {
                isLoading = false;
                errorMessage = null;//value;
              });
              if (errorMessage != null)
                return showAlertDialog(context, errorMessage,
                    AppLocalizations.of(context).translate('error'));
              else {
                _genderController = "";
                _ageController.text = "";
                _emailController.text = "";
                _passwordController.text = "";
                _phoneNumberController.text = "";
                _firstNameController.text = "";
                _middleNameController.text = "";
                _lastNameController.text = "";
                _nationalIDController.text = "";
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Instructions()),
                );
              }
            });
          },
          child: Text(AppLocalizations.of(context).translate('signup')),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
            side: BorderSide(color: Color(0xFF45746E)),
          ),
        ),
      ),
    );
  }
}
