import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blink/model/products.dart';
import '../model/user_profile.dart';




class FirestoreDB {
  var box = GetStorage();
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<UserProfile> getUserProfile() async {
    final snapshot = await _firebaseFirestore
        .collection('users')
        .where('email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
        .get();
    final userData = snapshot.docs.map((e) => UserProfile.fromSnapshot(e)).single;
    return userData;
  }


  Future<void> userProfileUpdate(UserProfile user) async {
    await _firebaseFirestore
        .collection('users')
        .doc(user.email)
        .update(user.toJson())
        .then((value) => Get.snackbar('Success', 'Updated Successfully.'));
  }


  Future<List<Product>> getProducts()async{
    final snapshot = await _firebaseFirestore.collection('products').get();
    final productData =  snapshot.docs.map((e) => Product.fromSnapshot(e)).toList();
    return productData;
  }

}
