// ignore: file_names
import 'package:amazon_clone/model/user_details_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CloudFirebaseStore {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future uploadNameAndAddressToDatabase(
      {required UserDetailsModel userDetailsModel}) async {
    await firebaseFirestore
        .collection("users")
        .doc(
          firebaseAuth.currentUser!.uid,
        )
        .set(userDetailsModel.getJson());
  }
}
