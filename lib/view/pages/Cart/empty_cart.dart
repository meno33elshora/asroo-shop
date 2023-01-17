import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/assets_manager.dart';
import '../../../utils/string_manager.dart';
import '../../../utils/theme.dart';
import '../../Components/text_widget.dart';


class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(ImageAssets.cart,height: 200,width: 200,),
        const SizedBox(height: 20.0,),
        RichText(
          text:  TextSpan(
            text: StringManager.yourCartIs,
            style:  TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w500,
              color: Get.isDarkMode ? Colors.white : black,
            ),
            children: [
              TextSpan(
                text: StringManager.empty,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25.0,
                    color: Get.isDarkMode ? pinkClr : context.theme.primaryColor
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0,),
        TextWidget(txt: StringManager.addItemIsGetStarted, fontSize: 16, color: Get.isDarkMode ? pinkClr : context.theme.primaryColor, notFontFamily: false),
      ],
    );
  }
}
