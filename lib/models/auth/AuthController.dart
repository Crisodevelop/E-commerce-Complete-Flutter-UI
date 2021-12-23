import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';

import '../../constants.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;
  late Rx<GoogleSignInAccount?> googleSignInAccount;

  @override
  void onReady() {
    super.onReady();
    // auth is comning from the constants.dart file but it is basically FirebaseAuth.instance.
    // Since we have to use that many times I just made a constant file and declared there

    firebaseUser = Rx<User?>(auth.currentUser);
    googleSignInAccount = Rx<GoogleSignInAccount?>(googleSign.currentUser);

    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);

    googleSignInAccount.bindStream(googleSign.onCurrentUserChanged);
    ever(googleSignInAccount, _setInitialScreenGoogle);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAll(() => SignInScreen());
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
      Get.offAll(() => LoginSuccessScreen());
    }
  }

  _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
    print(googleSignInAccount);
    if (googleSignInAccount == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAll(() => SignInScreen());
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
      Get.offAll(() => LoginSuccessScreen());
    }
  }

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

    void register(String email, password) async {
      try {
        await auth.createUserWithEmailAndPassword(
            email: email, password: password);
      } catch (firebaseAuthException) {}
    }

    void login(String email, password) async {
      try {
        await auth.signInWithEmailAndPassword(email: email, password: password);
      } catch (firebaseAuthException) {}
    }

    void signOut() async {
      await auth.signOut();
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