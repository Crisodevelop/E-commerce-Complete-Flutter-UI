import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../constants.dart';

class GoogleSigIn extends GetxController {
  
  
  static GoogleSigIn instance = Get.find();
  late Rx<User?> firebaseUser;
  late Rx<GoogleSignInAccount?> googleSignInAccount;


  void signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSign.signIn();


      print(googleSignInAccount);
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,

          
        );
        //  await  auth.signInWithCredential(credential);

        await auth.signInWithCredential(credential)
            // ignore: invalid_return_type_for_catch_error
            .catchError((onErr) => print(onErr));
      }
    } catch (e) {
        print(e);
      Get.snackbar(
        
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      print(e);
      print(e.toString());
    }
  }
}



  ////Other form or Login
  // GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  // FirebaseAuth _auth = FirebaseAuth.instance;

  // void signInWithGoogle() async {
  //   final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //   print(googleUser);

  //    if (googleUser  != null) {
  //   GoogleSignInAuthentication googleSignInAuthentication =
  //       await googleUser.authentication;

  //   final AuthCredential credential = GoogleAuthProvider.credential(
  //     idToken: googleSignInAuthentication.idToken,
  //     accessToken: googleSignInAuthentication.accessToken,
  //   );

  //   await _auth.signInWithCredential(credential);
  //    }
  // }

  ////////////////////////////////////////////////////////////////////