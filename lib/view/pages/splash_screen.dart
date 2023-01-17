import 'dart:async';
import 'package:asroo/services/cache/cache_helper.dart';
import 'package:asroo/view/pages/login_screen.dart';
import 'package:asroo/view/pages/main_screen.dart';
import 'package:asroo/view/pages/theme_page.dart';
import 'package:asroo/view/pages/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/string_manager.dart';
import '../../utils/theme.dart';
import '../components/animate_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool token = CacheHelper.getData(key: "addUser") ??  false ;
  bool login = CacheHelper.getData(key: "login") ??  false ;
  bool welcome = CacheHelper.getData(key: "welcome") ?? false ;
  // bool logout = CacheHelper.getData(key: "logout") ?? false ;
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      //         (route) => false);

      /// welcome
      if(welcome == false) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                (route) => false);
      }else if(welcome == true){
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) =>  LoginScreen()),
                (route) => false);
      }
      /// sign up
      if(token==false ){
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) =>  LoginScreen()),
                (route) => false);
      }else if(token == true){
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) =>  const MainScreen()),
                (route) => false);
      }

      /// login
      if(login==false ){
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) =>  LoginScreen()),
                (route) => false);
      }else if(login == true){
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) =>  const MainScreen()),
                (route) => false);
      }

      // if(logout == false ){
      //   Navigator.of(context).pushAndRemoveUntil(
      //       MaterialPageRoute(builder: (context) =>  LoginScreen()),
      //           (route) => false);
      // }else if(logout == true){
      //   Navigator.of(context).pushAndRemoveUntil(
      //       MaterialPageRoute(builder: (context) =>  const MainScreen()),
      //           (route) => false);
      // }



    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? pinkClr :  mainColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AnimateWidgetItem(
            item: Icon(
              CupertinoIcons.cart_fill,
              size: 100,
              color: Colors.white,
            ),
            // verticalOffset: 100,
            horizontalOffset: 100,
          ),
          const SizedBox(
            height: 20.0,
          ),
          AnimateWidgetItem(
            item: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child:  Text(
                StringManager.asrooShop,
                style: TextStyle(
                  color: Get.isDarkMode ? pinkClr :  mainColor,
                  fontSize: 40.0,
                  // backgroundColor: Colors.white,
                ),
              ),
            ),
            horizontalOffset: -100,
          ),
        ],
      )),
    );
  }
}
