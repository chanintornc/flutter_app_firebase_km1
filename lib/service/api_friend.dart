import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_firebase_km1/model/friend.dart';

Future<bool> apiInsertFriend(String namef, String phonef, String emailf, String imagef) async {

  Friend friend = Friend(namef: namef, phonef: phonef, emailf: emailf, imagef: imagef);

  try {
    await FirebaseFirestore.instance.collection("friend")
        .add(friend.toJson());
    return true;
  } catch (ex) {
    return false;
  }
}

Stream<QuerySnapshot> apiGetAllFriend() {
  try {
    return FirebaseFirestore.instance.collection('friend').snapshots();
  } catch (ex) {
    return null;
  }
}