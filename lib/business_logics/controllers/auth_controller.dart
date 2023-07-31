import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthonController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  signUp(name, email, password) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user!.uid.isNotEmpty){

        CollectionReference collectionReference = FirebaseFirestore.instance.collection('users');
        collectionReference.doc(email).set({
          'uid': credential.user!.uid,
          'email': email,
          'name': name
        });
      }


    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
  login() async {}
  forgetPassword() async {}
  logout() async {}
}
