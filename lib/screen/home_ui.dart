import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_firebase_km1/screen/insert_friend_ui.dart';
import 'package:flutter_app_firebase_km1/screen/update_delete_friend_ui.dart';
import 'package:flutter_app_firebase_km1/service/api_friend.dart';

class HomeUI extends StatefulWidget {
  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  Stream<QuerySnapshot> allFriend;

  getAllFriend() {
    allFriend = apiGetAllFriend();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllFriend();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'เพื่อน Friend',
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return InsertFriendUI();
            }),
          );
        },
        label: Text(
          'เพิ่มเพื่อน',
        ),
        icon: Icon(
          Icons.add,
        ),
        backgroundColor: Color(0xff476cfb),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: allFriend,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('พบข้อผิดพลาดกรุณาลองใหม่อีกครั้ง'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.separated(
            separatorBuilder: (context, index) {
              return Container(
                height: 2,
                width: double.infinity,
                color: Color(0xFFEFEFEF),
              );
            },
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              print(snapshot.data.docs[index].id.toString());
              return ListTile(
                onTap: () {},
                leading: CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.transparent,
                  child: ClipOval(
                    child: FadeInImage.assetNetwork(
                      image: snapshot.data.docs[index]['imagef'],
                      placeholder: 'assets/images/friend.jpg',
                      fit: BoxFit.fill,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
                title: Text(
                  snapshot.data.docs[index]['namef'],
                ),
                subtitle: Text(
                  snapshot.data.docs[index]['phonef'],
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black54,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
