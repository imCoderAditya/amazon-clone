import 'package:amazon_clone/model/user_details_model.dart';
import 'package:amazon_clone/resourse/cloud_FirebaseStore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthenticationMethod {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CloudFirebaseStore cloudFirebaseStore = CloudFirebaseStore();
  final storage = const FlutterSecureStorage();

  Future<String> signUpUser({
    required String email,
    required String password,
    required String address,
    required String name,
  }) async {
    email.trim();
    password.trim();
    address.trim();
    name.trim();
    String output = "Something went wrong";
    if (name != "" && address != "" && email != "" && password != "") {
      try {
        await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        await cloudFirebaseStore.uploadNameAndAddressToDatabase(
            userDetailsModel: UserDetailsModel(name: name, address: address));
        output = "success";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "Please fill up everything";
    }
    return output;
  }

  Future<String> singInUser(
      {required String email, required String password}) async {
    email.trim();
    password.trim();
    String output = "Somthing went wrong";

    if (email != "" && password != "") {
      try {
        await firebaseAuth
            .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
            .then((value) {
          storage.write(key: "uid", value: value.user!.uid);
        });
        output = "Login successfully";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "Please fill up everything ";
    }
    return output;
  }
}
