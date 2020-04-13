import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './user.dart';


final  _firestore = Firestore.instance;

class Request{
  User user;
  String description;
Request({@required this.user, this.description });
}

void addTransportationRequest(Request request) async {

await _firestore.collection('tansport_request').add({
'user' : request.user.firstName + " " + request.user.middleName,
'description' : request.description 
});

}

void addCommunityRequest(Request request) async {

await _firestore.collection('community_request').add({
'user' : request.user.firstName + " " + request.user.middleName,
'description' : request.description 
});

}


Stream<QuerySnapshot> getTransportationRequests() {
final requests =  _firestore.collection('tansport_request').snapshots();
return requests;
}


Stream<QuerySnapshot> getCommunityRequests() {
  final requests =  _firestore.collection('community_request').snapshots();
return requests;
}