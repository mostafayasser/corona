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
          color: Color(0xffDBFCF4),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      image: new DecorationImage(
                          image: new AssetImage('images/BG.png'),
                          fit: BoxFit.cover)),
                ),
                SingleChildScrollView(
                  child: Center(
                    child: _buildForm(context),
                  ),
                ),
              ],
            )),
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
                      top: MediaQuery.of(context).size.height * 0.06),
                  icon: Icon(
                    (AppLocalizations.of(context).translate('language') ==
                            "English")
                        ? Icons.arrow_forward
                        : Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () => sendData(context))),
          // SizedBox(height: 100),
          // Expanded(
            // child: 
            new Image.asset(
              'images/Contactus.png',
              height: 360.0,
              width: 260.0,
            ),
          // ),

          Align(
              alignment: FractionalOffset.center,
              child: ButtonTheme(
                  buttonColor: Colors.white70,
                  minWidth: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: RaisedButton(
                    textColor: Color(0xFF45746E),
                    onPressed: () {
                      Navigator.pop(context,
                          MaterialPageRoute(builder: (context) => ContactUS()));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Instructions()));
                    },
                    color: Colors.white,
                    child: Text(
                        AppLocalizations.of(context).translate('Instructions')),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(40.0),
                      side: BorderSide(color: Color(0xFF45746E)),
                    ),
                  ))),
        ]));
  }

  void sendData(BuildContext context) {
    Navigator.pop(
        context, MaterialPageRoute(builder: (context) => ContactUS()));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Diagnosis()));
  }
}
