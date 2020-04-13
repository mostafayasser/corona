import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/auth.dart';
import '../models/volunteer_request.dart';
import '../models/app_localizations.dart';

class TransportationRequestScreen extends StatefulWidget {
  static const route = "/transportation_screen";
  @override
  _TransportationRequestScreenState createState() =>
      _TransportationRequestScreenState();
}

class _TransportationRequestScreenState
    extends State<TransportationRequestScreen> {
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
          Padding(
            padding: const EdgeInsets.only(top : 50.0),
            child: FutureBuilder(
                future: getCurrentUser(),
                builder: (ctx, user) {
                  return StreamBuilder<QuerySnapshot>(
                      stream: getTransportationRequests(),
                      builder: (context, snapshot) {
                        return (snapshot.hasData)
                            ? Center(
                                child: ListView.builder(
                                itemBuilder: (ctx, index) => Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(snapshot
                                          .data.documents[index].data['user']),
                                      SizedBox(height: 5),
                                      Text(snapshot.data.documents[index]
                                          .data['description']),
                                      SizedBox(height: 20)
                                    ],
                                  ),
                                ),
                                itemCount: snapshot.data.documents.length,
                              ))
                            : Center(child: CircularProgressIndicator());
                      });
                }),
          ),
        ],
      ),
    );
  }
}
