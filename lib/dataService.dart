import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> getNickNameFromFirestore() async {
    String nickname = "";
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(_auth.currentUser?.uid)
        .get();

    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    nickname = data['nickname'];
    return nickname;
  }
}