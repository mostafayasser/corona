import 'package:flutter/material.dart';
import '../models/volunteer_request.dart';
import '../models/auth.dart';
import '../models/app_localizations.dart';

class RequestHelpScreen extends StatefulWidget {
  static const route = "/request_help";
  @override
  _RequestHelpScreenState createState() => _RequestHelpScreenState();
}

class _RequestHelpScreenState extends State<RequestHelpScreen> {
  TextEditingController description = TextEditingController();
  String type;
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
            ),
          ),
          FutureBuilder(
              future: getCurrentUser(),
              builder: (ctx, user) {
                return (user.hasData)
                    ? Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          DropdownButton<String>(
                            items: <String>[
                              AppLocalizations.of(context).translate('transfer_patients'),
                              AppLocalizations.of(context).translate('community_volunteer'),
                              AppLocalizations.of(context).translate('telecom_volunteer')
                            ].map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                type = value;
                              });
                            },
                            value: type,
                            hint: Text(AppLocalizations.of(context).translate('select_item')),
                          ),
                          Container(
                            width: 300,
                            child: TextField(
                              controller: description,
                              maxLength: 100,
                              maxLines: 5,
                              decoration: InputDecoration(
                                  hintText: AppLocalizations.of(context).translate('description'),
                                  border: OutlineInputBorder()),
                              onSubmitted: (value) => description.text = value,
                            ),
                          ),
                          _buildSubmitButton(context, user.data),
                        ],
                      ))
                    : Center(child: CircularProgressIndicator());
              }),
        ],
      ),
    );
  }

  Widget _buildSubmitButton(context, user) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: ButtonTheme(
        buttonColor: Colors.white70,
        minWidth: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.08,
        child: RaisedButton(
          color: Colors.white,
          textColor: Color(0xFF45746E),
          onPressed: () {
            if (type == AppLocalizations.of(context).translate('transfer_patients')) {
              addTransportationRequest(
                  Request(user: user, description: description.text));
            }
          },
          child: Text(AppLocalizations.of(context).translate('send_request')),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
            side: BorderSide(color: Color(0xFF45746E)),
          ),
        ),
      ),
    );
  }
}
