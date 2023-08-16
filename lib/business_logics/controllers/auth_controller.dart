import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tech_blink/ui/route/route.dart';
import 'package:tech_blink/ui/style/app_styles.dart';


class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final box = GetStorage();

  signUp(name, email, password, context) async {
    AppStyles().progressDialog(context);
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user!.uid.isNotEmpty) {
        CollectionReference collectionReference =
            FirebaseFirestore.instance.collection('users');
        collectionReference
            .doc(email)
            .set({'uid': credential.user!.uid, 'email': email, 'name': name});

        Map user = {'uid': credential.user!.uid, 'email': email, 'name': name};
        box.write('user', user);
        print(box.read('user'));
        Get.back();
        Get.offAndToNamed(bottomNav);
        Get.showSnackbar(AppStyles().successSnacBar('SignUp successfull'));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.back();
        Get.showSnackbar(
            AppStyles().failedSnacBar('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        Get.back();
        Get.showSnackbar(AppStyles()
            .failedSnacBar('The account already exists for that email.'));
      }
    } catch (e) {
      Get.back();
      Get.showSnackbar(AppStyles().failedSnacBar(e));
    }
  }
  login(email, password, context) async {
    AppStyles().progressDialog(context);
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user!.uid.isNotEmpty) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(email)
            .get()
            .then((DocumentSnapshot<Map<String, dynamic>> doc) {
          if (doc.exists) {
            var data = doc.data();
            print(data);
            Map user = {
              'uid': data!['uid'],
              'email': data['email'],
              'name': data['name']
            };
            box.write('user', user);
            print(user);
            Get.back();
            Get.offAndToNamed(bottomNav);
            Get.showSnackbar(AppStyles().successSnacBar('Login successfull'));
          } else {
            Get.showSnackbar(AppStyles()
                .failedSnacBar('document does not exist on the database.'));
          }
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.back();
        Get.showSnackbar(
            AppStyles().failedSnacBar('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        Get.back();
        Get.showSnackbar(AppStyles()
            .failedSnacBar('Wrong password provided for that user.'));
      }
    }
  }

  forgetPassword(email, context) async {
    try{
      AppStyles().progressDialog(context);
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.back();
      Get.showSnackbar(AppStyles()
          .successSnacBar('Please Check Your $email Inbox'));

    }catch(e){
      Get.back();
      Get.showSnackbar(AppStyles()
          .failedSnacBar('$email not a valid email'));
    }
  }
  logout() async {
    _auth.signOut();
  }




  //google sign in
singnInWithGoogle() async{
    // being interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // obtain auth detals form request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;



    //create new crediatinal for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );


    // sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
}
}
