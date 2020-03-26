
import 'package:corona/screens/Instructions.dart';
import 'package:flutter/material.dart';
import '../models/app_localizations.dart';
import '../screens/Diagnosis.dart';


class ContactUS extends StatefulWidget {


  @override
  _ContactUSState createState() => _ContactUSState();
}

class _ContactUSState extends State<ContactUS> {


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
                      sendData(context))),
              Align(
                  alignment: FractionalOffset.center,
                  child: ButtonTheme(
                      buttonColor: Colors.white70,
                      minWidth: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.05,
                    child: RaisedButton(
                      textColor: Color(0xFF45746E),
                      onPressed: () {
                        Navigator.pop(
                            context,
                            MaterialPageRoute(builder: (context) => ContactUS()));
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Instructions()));
                      },
                      child: Text(AppLocalizations.of(context).translate('Instructions')),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                        side: BorderSide(color: Color(0xFF45746E)),
                      ),
                    ))),
              SizedBox(height: 100),
              new Image.asset(

                'images/Contactus.png',
                height: 400.0,
                width: 300.0,

              ),
            ]

        )


    );
  }
  void sendData(BuildContext context){
    Navigator.pop(
        context,
        MaterialPageRoute(builder: (context) => ContactUS()));
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Diagnosis()));
  }
}