import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/theme.dart';

class TextItemLoginSignUp extends StatelessWidget {
  final String txt1;
  final String txt2;
  final double? fonts;
  final bool isTrueOrFalse;

  const TextItemLoginSignUp(
      {Key? key,
      required this.txt1,
      required this.txt2,
      this.fonts,
      required this.isTrueOrFalse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: MediaQuery.of(context).size.width / 2,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          // color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: RichText(
          text: TextSpan(
              text: txt1,
              style: GoogleFonts.ptSans(
                color:Get.isDarkMode ? pinkClr :  mainColor,
                fontSize: isTrueOrFalse ? 35 : fonts,
              ),
              children: [
                TextSpan(
                  text: txt2,
                  style: GoogleFonts.ptSans(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: isTrueOrFalse ? 35 : fonts,
                  ),
                ),
              ]),
        ));
  }
}
