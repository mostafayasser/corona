import 'package:flutter/material.dart';
import './transportation_requests_screen.dart';
import '../models/app_localizations.dart';
class VolunteerScreen extends StatelessWidget {
  static const route = "/vol";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            "images/BG.png",
            fit: BoxFit.fill,
          ),
          Positioned(
            left: 20,
            top: 20,
              child: IconButton(
            icon: Icon((AppLocalizations.of(context).translate('language') ==
                            "English")
                        ? Icons.arrow_forward
                        : Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          )),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      onTap: () => Navigator.of(context).pushNamed(TransportationRequestScreen.route),
                      child: Image.asset(
                        "assets/images/trans.png",
                        fit: BoxFit.cover,
                        
                      ),
                    ),
                    InkWell(
                      onTap: () => print("done"),
                      child: Image.asset(
                        "assets/images/tele.png",
                        fit: BoxFit.cover,
                        
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () => print("done"),
                  child: Image.asset(
                    "assets/images/comm.png",
                    fit: BoxFit.cover,
                    
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}