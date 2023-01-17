import 'package:asroo/utils/theme.dart';
import 'package:asroo/view/components/btn_text.dart';
import 'package:asroo/view/pages/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../services/cache/cache_helper.dart';
import '../../utils/assets_manager.dart';
import '../../utils/string_manager.dart';
import '../components/text_widget.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height / 1,
            width: MediaQuery
                .of(context)
                .size
                .width / 1,
            child: Image.asset(
              ImageAssets.background,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 2.5,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child:  const TextWidget(
                    txt: StringManager.welcome,
                    fontSize: 30,
                    color: Colors.white,
                    notFontFamily: false),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                  height: 60,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 1.7,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: RichText(
                    text: TextSpan(
                        text: StringManager.asroo,
                        style: GoogleFonts.ptSans(
                            color:Get.isDarkMode ? pinkClr :   mainColor,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: StringManager.shop,
                            style: GoogleFonts.ptSans(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  )),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 5,
              ),
              SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 2.5,
                  height: 50.0,
                  child: BtnText(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) =>
                           LoginScreen()), (route) => false);
                      CacheHelper.saveData(key: 'welcome', value: true);

                    },
                    txt: StringManager.getStart,
                    color:Get.isDarkMode ? pinkClr :  mainColor,
                  )),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: 100,
                width: double.infinity,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextWidget(
                      txt: StringManager.noAccount,
                      fontSize: 22,
                      color: Colors.white,
                      notFontFamily: false,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) =>
                                 const SignUpScreen()), (route) => false);
                      },
                      child:  TextWidget(
                        txt: StringManager.signUp,
                        textDecoration: TextDecoration.underline,
                        decorationColor: Get.isDarkMode ? pinkClr :  mainColor,
                        decorationThickness: 3,
                        fontSize: 22,
                        color: Colors.white,
                        notFontFamily: false,
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
