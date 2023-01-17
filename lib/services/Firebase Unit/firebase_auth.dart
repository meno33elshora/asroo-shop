
import 'package:asroo/services/cache/cache_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/pages/login_screen.dart';
import '../../view/pages/main_screen.dart';

abstract class AuthUserToFirebase {
  Future<void> addUserAccount({required String emailAddress, required String password, required String name});

  Future<void> loginUser({required String emailAddress, required String password});

  Future<void> resetUser({required String email});
}



class AuthUserAccount implements AuthUserToFirebase {

    @override
    Future<void> addUserAccount({
      required String emailAddress,
      required String password,
      required String name,
    }) async {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailAddress,
          password: password,
        ).then((value) {
          FirebaseAuth.instance.currentUser!.updateDisplayName(name);
        });
        Get.snackbar(
          "Great !",
          "Thanks To Add Account...",
          backgroundColor: Colors.green,
          margin: const EdgeInsets.all(10),
          colorText: Colors.white,
        );
        CacheHelper.saveData(key: 'addUser', value: true).then((value){
          Get.offAll(() => LoginScreen());
        });
      } on FirebaseAuthException catch (e) {
        String title = e.code.replaceAll(RegExp("-"), ' ').capitalize!;
        String message = "${e.message}";
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          title = 'The password provided is too weak.';
        } else if (e.code == 'Email Already In Use') {
          print('The account already exists for that email.');
          message = 'The account already exists for that email.';
        } else {
          message = e.message.toString();
        }
        Get.snackbar(
          title,
          message,
          backgroundColor: Colors.red,
          margin: const EdgeInsets.all(10),
          colorText: Colors.white,
        );
      } catch (e) {
        Get.snackbar(
          "Error !",
          e.toString(),
          backgroundColor: Colors.red,
          margin: const EdgeInsets.all(10),
          colorText: Colors.white,
        );
      }
      return;
    }

    @override
    Future<void> loginUser({
      required String emailAddress,
      required String password,
    }) async {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: emailAddress, password: password);
        Get.snackbar(
          "Great Pass !",
          "Thanks To Login...",
          backgroundColor: Colors.green,
          margin: const EdgeInsets.all(10),
          colorText: Colors.white,
        );
        CacheHelper.saveData(key: "login", value: true).then((value) {
          Get.offAll(() =>const MainScreen());
        });
      } on FirebaseAuthException catch (e) {
        String title = e.code.replaceAll(RegExp("-"), ' ').capitalize!;
        String message = "${e.message}";

        if (e.code == 'log in wrong') {
          print('The Log in user not correct.');
          title = 'The Login user not correct.';
        } else if (e.code == 'email-already-in-find') {
          print('The account already exists for that email.');
          message = 'Wrong Login..';
        }else{
          message = e.message.toString();
        }
        Get.snackbar(
          title,
          message,
          backgroundColor: Colors.red,
          margin: const EdgeInsets.all(10),
          colorText: Colors.white,
        );
      }catch(e){
        Get.snackbar(
          "Error !",
          e.toString(),
          backgroundColor: Colors.red,
          margin: const EdgeInsets.all(10),
          colorText: Colors.white,
        );
      }
      return;
    }

    @override
    Future<void> resetUser({
      required String email,
    }) async{
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        Get.offAll( () => LoginScreen());
        Get.snackbar(
          "Great Pass !",
          "Thanks Check Your Email ...",
          backgroundColor: Colors.green,
          margin: const EdgeInsets.all(10),
          colorText: Colors.white,
        );
      } on FirebaseAuthException catch (e) {
        String title = e.code.replaceAll(RegExp("-"), ' ').capitalize!;
        String message = "${e.message}";

        if (e.code == 'log in wrong') {
          print('The Log in user not correct.');
          title = 'The Login user not correct.';
        } else if (e.code == 'email-already-in-find') {
          print('The account already exists for that email.');
          message = 'Wrong Login..';
        }else{
          message = e.message.toString();
        }
        Get.snackbar(
          title,
          message,
          backgroundColor: Colors.red,
          margin: const EdgeInsets.all(10),
          colorText: Colors.white,
        );
      }catch(e){
        Get.snackbar(
          "Error !",
          e.toString(),
          backgroundColor: Colors.red,
          margin: const EdgeInsets.all(10),
          colorText: Colors.white,
        );
      }
      return;
    }
    }
