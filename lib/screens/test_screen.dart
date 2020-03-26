import 'package:flutter/material.dart';
import '../models/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;

class TestScreen extends StatefulWidget {
  static const route = "/testScreen";
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: FutureBuilder(
          future: getCurrentUser(),
          builder: (ctx, user) {
            return StreamBuilder<DocumentSnapshot>(
                stream:
                    _firestore.collection('users').document(user.data.email).snapshots(),
                builder: (context, snapshot) {
                  return Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        color: Color(int.parse(snapshot.data.data['status'])),
                        width: 200,
                        height: 200,
                      ),
                      Text('Score: ${snapshot.data.data['score']}'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () {
                              updateUserStatus(5, "0xFF0000FF");
                            },
                            child: Text('set'),
                          ),
                          RaisedButton(
                            onPressed: () {
                              updateUserStatus(0, "0xFF00FF00");
                            },
                            child: Text('reset'),
                          )
                        ],
                      )
                    ],
                  ));
                });
          }),
    );
  }
}
