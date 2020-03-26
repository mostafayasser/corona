import 'package:corona/screens/DailyReport.dart';
import 'package:corona/screens/main_screen.dart';
import 'package:flutter/material.dart';
import '../models/app_localizations.dart';
import '../models/auth.dart';
import '../screens/Diagnosis.dart';


class MainDiagnosis extends StatefulWidget {

  final int type;
  MainDiagnosis(this.type);
  @override
  _MainDiagnosisState createState() => _MainDiagnosisState();
}

class _MainDiagnosisState extends State<MainDiagnosis> {


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
              child: _buildForm(context, widget.type),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm(context, int type) {
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
                'images/q' + type.toString() + '.png',
                height: 500.0,
                width: 500.0,
              ),
              new Row(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 80.0, right: 40.0, top: 0.0, bottom: 0.0),
                      child: new RaisedButton(
                          elevation: 0.0,

                          padding: EdgeInsets.only(
                              bottom: 0.0, right: 0.0, left: 0.0, top: 0.0),
                          onPressed: () =>
                              _buildDiagAn(type, type == 3 ? 5 : (type == 5 ? 4 : 1)),
                          child: new Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              new Image.asset(
                                'images/Yes.png',
                                height: 50.0,
                                width: 50.0,

                              ),


                            ],
                          ),

                          textColor: Colors.transparent,
                          color: Colors.transparent)),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 0.0, right: 0.0, top: 0.0, bottom: 0.0),
                    child: new RaisedButton(
                        elevation: 0.0,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(0.0)),
                        padding: EdgeInsets.only(
                            top: 0, bottom: 0, right: 0.0, left: 0.0),
                        onPressed: () => (_buildDiagAn(type, 0)),
                        child: new Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Image.asset('images/No.png',
                                height: 50.0, width: 50.0),

                          ],
                        ),
                        textColor: Colors.transparent,
                        color: Colors.transparent),
                  ),

                ],
              ),
            ]

        )

    );
  }

  void _buildDiagAn(int type, int status) {
    updateUserStatus(status);
    if (type == 1)
      {
        MainScreen.listAn.removeRange(0, MainScreen.listAn.length);
      }
    type == 1 ? MainScreen.status = 1 : MainScreen.status += status;
    if (status > 0)
      switch (type) {
        case 1:
          MainScreen.listAn.add(AppLocalizations.of(context).translate("have diarrhea"));
          break;
        case 2:
          MainScreen.listAn.add(AppLocalizations.of(context).translate("suffer from muscle or joint pain"));
          break;
        case 3:
          MainScreen.listAn.add(AppLocalizations.of(context).translate("mixed with foreigners in the past days"));
          break;
        case 4:
          MainScreen.listAn.add(AppLocalizations.of(context).translate("suffer from nasal congestion"));
          break;
        case 5:
          MainScreen.listAn.add(AppLocalizations.of(context).translate("have a dry cough"));
          break;
        case 6:
          MainScreen.listAn.add(AppLocalizations.of(context).translate("suffer from fatigue"));
          break;
        case 7:
          MainScreen.listAn.add(AppLocalizations.of(context).translate("have a fever"));
          break;
        case 8:
          MainScreen.listAn.add(AppLocalizations.of(context).translate("suffer from a sore throat"));
          break;
        case 9:
          MainScreen.listAn.add(AppLocalizations.of(context).translate("suffer from sputum production"));
          break;
        case 10:
          MainScreen.listAn.add(AppLocalizations.of(context).translate("suffer from headache"));
          break;
        case 11:
          MainScreen.listAn.add(AppLocalizations.of(context).translate("suffer from shortness of breath"));
          break;
        case 12:
          MainScreen.listAn.add(AppLocalizations.of(context).translate("suffer from vomiting or nausea"));
          break;
        case 13:
          MainScreen.listAn.add(AppLocalizations.of(context).translate("suffer from chills"));
          break;
      }

    if (type >= 13)
  {
    Navigator.pop(
        context,
        MaterialPageRoute(builder: (context) => MainDiagnosis(13)));
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DailyReport()));
    return;
    }
    Navigator.pop(
        context,
        MaterialPageRoute(builder: (context) => MainDiagnosis(type)));
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainDiagnosis(type + 1)));
  }

}



