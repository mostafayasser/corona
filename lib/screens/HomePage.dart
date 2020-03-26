import 'package:corona/screens/CurrentReport.dart';

import 'package:corona/screens/ContactUS.dart';

import 'package:flutter/material.dart';
import './Instructions.dart';
import '../models/app_localizations.dart';
import '../screens/Diagnosis.dart';
import '../screens/map_screen.dart';
class HomePage extends StatefulWidget {

  static const route = "/HomePage";
  final Function changeLocale;
  HomePage({this.changeLocale});

  @override

  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    
    return
        WillPopScope(
          onWillPop: () async => false,
                  child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.1, 0.8],
                  colors: [Color(0xFF8FDBB8), Color(0xFF51b5D8)],
                ),
              ),

    child : Scaffold(

      backgroundColor: Colors.transparent,
          body: new Stack(
            fit: StackFit.expand,
            children: <Widget>[
              new Column(
                children: <Widget>[
                  SizedBox(height: 70.0),
                  SizedBox(
                    height: 0.0,
                    child: new Text(
                      "Home Page",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.005,
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),

                buildSubmitButton(context,
                    AppLocalizations.of(context).translate('language'), null),
              ],
            ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new RaisedButton(
                      elevation: 0.0,

                      padding: EdgeInsets.only(
                           bottom: 0.0, right: 15.0 , left: 30.0 , top: 0.0),
                      onPressed: () =>  (Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Diagnosis()))),
                      child: new Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Image.asset(
                            'images/homebg.png',
                            height: 140.0,
                            width: 140.0,

                          ),


                        ],
                      ),

                      textColor: Colors.transparent,
                      color: Colors.transparent),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 0.0, right: 0.0, top: 1.0, bottom: 0.0),
                    child: new RaisedButton(
                        elevation: 0.0,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(0.0)),
                        padding: EdgeInsets.only(
                            top: 0, bottom: 0, right: 0.0, left: 5.0),
                        onPressed: () =>  (Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CurrentReport()))),
                        child: new Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Image.asset('images/homebg1.png',
                                height: 140.0, width: 140.0),

                          ],
                        ),
                        textColor: Colors.transparent,
                        color: Colors.transparent),
                  ),

                ],
              ),
              new Row(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: <Widget>[
              Padding(
              padding: const EdgeInsets.only(
                  left: 40.0, right: 10.0, top: 310.0, bottom: 0.0),
              child: new RaisedButton(

                      elevation: 0.0,
                       shape: new RoundedRectangleBorder(
                           borderRadius: new BorderRadius.circular(0.0)),
                      padding: EdgeInsets.only(
                          top: 0, bottom: 0, right: 0.0, left: 0.0),

                      onPressed: () =>  (Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ContactUS()))),

                      child: new Row(

                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Image.asset(
                            'images/homebg3.png',
                            height: 140.0,
                            width: 140.0,

                          ),


                        ],
                      ),

                      textColor: Colors.transparent,
                      color: Colors.transparent),
              ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 0.0, right: 0.0, top: 300.0, bottom: 0.0),
                    child: new RaisedButton(
                        elevation: 0.0,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(0.0)),
                        padding: EdgeInsets.only(
                            top: 0, bottom: 0, right: 0.0, left: 0.0),
                        onPressed: () =>  (Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Instructions()))),
                        child: new Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Image.asset('images/homebg2.png',
                                height: 140.0, width: 140.0),

                          ],
                        ),
                        textColor: Colors.transparent,
                        color: Colors.transparent),
                  ),


                ],
              )
            ],
          ),
    )

    ),
        );

  }
  Widget buildSubmitButton(context, title, route) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: ButtonTheme(
        buttonColor: Colors.white70,
        minWidth: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.height * 0.08,
        child: RaisedButton(
          textColor: Color(0xFF45746E),
          onPressed: () {
            if (route != null)
              Navigator.of(context).pushNamed(route);
            else {
              if (AppLocalizations.of(context).translate('language') ==
                  "English") {
                widget.changeLocale(Locale('en', 'US'));
              } else {
                widget.changeLocale(Locale('ar', 'EG'));
              }
            }
          },
          child: Text(title),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
            side: BorderSide(color: Color(0xFF45746E)),
          ),
        ),
      ),
    );
  }
}