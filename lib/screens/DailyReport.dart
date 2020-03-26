import 'package:corona/screens/main_screen.dart';
import 'package:flutter/material.dart';
import '../models/app_localizations.dart';
import '../screens/Diagnosis.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user.dart';

class DailyReport extends StatefulWidget {


  @override
  _DailyReportState createState() => _DailyReportState();
}

class _DailyReportState extends State<DailyReport> {

  final String diag = MainScreen.postive()
      ? "images/yallow.png"
      : "images/statusgreen.png";
  final String diag2 = MainScreen.postive()
      ? "Your health condition needs medical follow-up, contact us."
      : "You are fine and need to stay home to avoid infection.";

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

                      onPressed: () =>(sendData(context))
                    )),
              new Image.asset(
                '' + diag + '',
                height: 100.0,
                width: 100.0,

              ),
              SizedBox(height: 10),

              Column(
                children: <Widget>[

                  SizedBox(height: 10),
                  Text (AppLocalizations.of(context).translate("Daily report of your health conditions."),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      )),
                 Text (AppLocalizations.of(context).translate(MainScreen.listAn.length < 1 ? "You have not been examined, please go to the quick medical examination page": diag2),
                     textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      color: MainScreen.postive() ? Colors.red : Colors.blue,
                  )),

                  SizedBox(height: 10),
                  for (int x = 0; x < MainScreen.listAn.length; x++)
                    RichText(
                      text: TextSpan(
                        children: [

                          TextSpan(
                            text: MainScreen.listAn[x].toString(),
                          ),
                          WidgetSpan(
                            child:  new Image.asset(
                              'images/Yes.png',
                              height: 28.0,
                              width: 28.0,

                            ),

                          ),
                      WidgetSpan(
                        child:   SizedBox(height: 20),
                      )


                        ],
                      ),
                    ),
                ],
              )

            ]

        )
    );
  }
  void sendData(BuildContext context){
    Navigator.pop(
        context,
        MaterialPageRoute(builder: (context) => DailyReport()));
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Diagnosis()));
  }
//se
}