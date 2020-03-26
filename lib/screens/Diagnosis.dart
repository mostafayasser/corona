import 'package:corona/screens/DailyReport.dart';
import 'package:flutter/material.dart';
import '../models/app_localizations.dart';
import 'package:corona/screens/ContactUS.dart';
import '../screens/main_screen.dart';
import '../screens/MainDiagnosis.dart';
import '../screens/Instructions.dart';
class Diagnosis extends StatelessWidget {

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
      child: DefaultTabController(

        length: 4,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.white,
            bottom: TabBar(

              tabs: [

    new Image.asset(
    'images/homebg.png',
    height: 80.0,
    width: 80.0,

    ),
                new Image.asset(
                  'images/homebg1.png',
                  height: 80.0,
                  width: 80.0,

                ),
                new Image.asset(
                  'images/homebg2.png',
                  height: 80.0,
                  width: 80.0,

                ),
                new Image.asset(
                  'images/homebg3.png',
                  height: 80.0,
                  width: 80.0,

                ),

              ],
            ),

          ),
          body: TabBarView(
            children: <Widget>[
              Center(
                  child: new Container(
                      child : Scaffold(
                          backgroundColor: Colors.transparent,
                          body: new Stack(
                              fit: StackFit.expand,
                              children: <Widget>[

                                      new Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,

                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0, right: 15.0, top: 0.0, bottom: 0.0),
                                              child: new  RaisedButton(
                                              elevation: 0.0,

                                              padding: EdgeInsets.only(
                                                  bottom: 0.0, right: 0.0 , left: 0.0 , top: 0.0),
                                              onPressed: () =>  (Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => DailyReport()))),
                                              child: new Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  new Image.asset(
                                                    'images/report.png',
                                                    height: 150.0,
                                                    width: 150.0,

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
                                                    top: 0, bottom: 0, right: 0.0, left: 5.0),
                                                onPressed: () =>  (Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (int) => MainDiagnosis(1)))),
                                                child: new Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    new Image.asset('images/fastdiagnosis.png',
                                                        height: 150.0, width: 150.0),

                                                  ],
                                                ),
                                                textColor: Colors.transparent,
                                                color: Colors.transparent),
                                          ),

                                        ],
                                      ),
                                    ]



                          )


                      )
                  )

              ),





              Center(
                  child: new Container(
                      child : Scaffold(
                          body: new Stack(
                              fit: StackFit.expand,
                              children: <Widget>[
                                new Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      new Image.asset(
                                          '' +diag+'',
                                          height: 500.0,
                                          width: 500.0,

                                        ),

                                              ]

                                          )
                              ]
                                    )


                          )
                      )

              ),
              Column(
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
                                borderRadius: new BorderRadius.circular(40.0),
                                side: BorderSide(color: Color(0xFF45746E)),
                              ),
                            ))),
                    SizedBox(height: 100),
                    new Image.asset(

                      'images/Contactus.png',
                      height: 360.0,
                      width: 260.0,

                    ),
                  ]

              ),
              Column(
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
                borderRadius: new BorderRadius.circular(40.0),
                side: BorderSide(color: Color(0xFF45746E)),
              ),
            ))),
                    SizedBox(height: 100),
                    new Image.asset(

                      'images/Contactus.png',
                      height: 360.0,
                      width: 260.0,

                    ),
                  ]

              ),
            ],

          ),

        ),
      ),
        ),
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