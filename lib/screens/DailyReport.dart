import 'package:corona/screens/main_screen.dart';
import 'package:flutter/material.dart';
import '../models/app_localizations.dart';
import '../screens/Diagnosis.dart';



class DailyReport extends StatefulWidget {


  @override
  _DailyReportState createState() => _DailyReportState();
}

class _DailyReportState extends State<DailyReport> {

  final String diag = MainScreen.postive()
      ? "images/yallow.png"
      : "images/statusgreen.png";

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
                height: 100.0,
                width: 100.0,

              ),

              Column(
                children: <Widget>[
                  new Image.asset(
                    'images/Yes.png',
                    height: 50.0,
                    width: 50.0,

                  ),
                 Text (AppLocalizations.of(context).translate("Your answer on the questions."),
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey
                  )),
                  for (int x = 0; x < MainScreen.listAn.length; x++)

    Text("${MainScreen.listAn[x]}",
        style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w900,
            color: Colors.white
        ))
                ],
              )

            ]

        )

    );
  }
}