import 'package:flutter/material.dart';
import './app_localizations.dart';
import '../screens/login_screen.dart';

showAlertDialog(BuildContext context, message , title) {

    // set up the button
    Widget okButton = FlatButton(
      child: Text(AppLocalizations.of(context).translate('ok')),
      onPressed: () {
        if(message == AppLocalizations.of(context).translate('reset_password'))
          Navigator.of(context).pushReplacementNamed(LoginScreen.route);
        else
          Navigator.of(context).pop();  
        },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
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