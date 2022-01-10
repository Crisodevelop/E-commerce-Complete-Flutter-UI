import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/auth/error_handler.dart';
import 'package:shop_app/core/services/firetore.dart';
import 'package:shop_app/models/user_model.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';

import '../../constants.dart';
import 'error_handler.dart';
import 'error_handler.dart';

class AuthService extends GetxController {
  // FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> _user = Rxn<User>();
  String? get user => _user.value?.email;

  // void onInit(){
  //   super.onInit();
  //   // _user.bindStream(auth.authStateChanges());
  // }



  handleAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else
            return SplashScreen();
        });
  }

  sigOut() {
    FirebaseAuth.instance.signOut();
    Get.offAll(SignInScreen());
  }

  signIn(email, password, context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
     
      print('2');
      Get.offAll(LoginSuccessScreen());

      print('signed in');
    } catch (e) {
      print('3');
      ErrorHandler().errorDialog(context, e);
    }
  }

   void signup(email, password, name, context) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveUser(user);
      });

       Get.offAll(LoginSuccessScreen());
    } catch (e) {
     print('3');
      ErrorHandler().errorDialog(context, e);
    }
  }

    void saveUser(UserCredential user) async {
    await FireStoreUser().addUserToFireStore(UserModel(
      userId: user.user!.uid,
      email: user.user!.email,
      name: '',
      pic: '',
    ));
  }

  
}
