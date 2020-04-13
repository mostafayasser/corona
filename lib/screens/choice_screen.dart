import 'package:flutter/material.dart';
import 'vol_screen.dart';
import './request_help_screen.dart';
import '../models/app_localizations.dart';
class ChoiceScreen extends StatelessWidget {
  static const route = "/choice";
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
            child: Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed(VolunteerScreen.route),
                  child: Image.asset(
                    "assets/images/volunt.png",
                    fit: BoxFit.cover,
                    
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed(RequestHelpScreen.route),
                  child: Image.asset(
                    "assets/images/help.png",
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
