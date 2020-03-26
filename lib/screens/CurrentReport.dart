import 'package:corona/screens/main_screen.dart';
import 'package:flutter/material.dart';
import '../models/app_localizations.dart';
import '../screens/Diagnosis.dart';


class CurrentReport extends StatefulWidget {


  @override
  _CurrentReportState createState() => _CurrentReportState();
}

class _CurrentReportState extends State<CurrentReport> {

  final String diag = MainScreen.postive() ? "images/postive.png" : "images/nagtive.png";
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
                          top: MediaQuery
                              .of(context)
                              .size
                              .height * 0.06),
                      icon: Icon(
                        (AppLocalizations.of(context).translate('language') ==
                            "English")
                            ? Icons.arrow_forward
                            : Icons.arrow_back,
                        color: Colors.white,
                      ),

                      onPressed: () =>
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Diagnosis())))),
              new Image.asset(

                '' + diag + '',
                height: 500.0,
                width: 500.0,

              ),
            ]

        )

    );
  }
}