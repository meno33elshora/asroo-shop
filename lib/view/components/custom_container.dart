import 'package:asroo/utils/theme.dart';
import 'package:asroo/view/components/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomContainer extends StatelessWidget {
  final String status;
  final String textBtn;
  final Function()  onPressed;
  const CustomContainer({Key? key,required this.onPressed , required this.status , required this.textBtn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration:  BoxDecoration(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30)),
        color: Get.isDarkMode ? pinkClr :   mainColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           TextWidget(
            txt:status,
            fontSize: 20,
            color: Colors.white,
            notFontFamily: false,
          ),
          TextButton(
            onPressed: onPressed,
            child: TextWidget(
              txt: textBtn,
              fontSize: 20,
              color: Colors.white,
              notFontFamily: false,
              textDecoration: TextDecoration.underline,
              decorationColor: Colors.white.withOpacity(0.5),
              decorationThickness: 3,
              textDecorationStyle: TextDecorationStyle.solid,
            ),
          )
        ],
      ),
    );
  }
}
