import 'dart:math';

import 'package:asroo/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/string_manager.dart';
import '../../../utils/theme.dart';
import '../../Components/text_widget.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int valueChange = 1;
  bool changeColor = false;

  bool changeColorMethods(){
    if(valueChange == 1){
       changeColor = true;
    }else if(valueChange == 2){
      changeColor = false;
    }else if(valueChange == 3){
      changeColor = false;
    }else{
      changeColor = true;
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildCard(
          value: 1,
          color: Colors.white,
          onChange: (value) {
            setState(() {
              valueChange = value;
            });
          },
          image: ImageAssets.paypal,
          txt: StringManager.paypal,
        ),
        const SizedBox(
          height: 20.0,
        ),
        buildCard(
          value: 2,
          color: Colors.white,
          onChange: (value) {
            setState(() {
              valueChange = value;
            });
          },
          image: ImageAssets.google,
          txt: StringManager.googlePlay,
        ),
        const SizedBox(
          height: 20.0,
        ),
        buildCard(
          value: 3,
          color: Colors.white,
          onChange: (value) {
            setState(() {
              valueChange = value;
            });
          },
          image: ImageAssets.credit,
          txt: StringManager.credit,
        ),
      ],
    );
  }

  Widget buildCard({
    required Function(int value)? onChange,
    required String image,
    required String txt,
    required Color color,
    required int value,
  }) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
        boxShadow: [
          BoxShadow(
            // color: Colors.grey.withOpacity(0.1),
            color: Get.isDarkMode ? pinkClr.withOpacity(0.9) : mainColor.withOpacity(0.3),
            blurRadius: 2.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(image),
          const SizedBox(
            width: 10.0,
          ),
          TextWidget(
            txt: txt,
            fontSize: 22,
            color: Get.isDarkMode ? pinkClr : black,
            notFontFamily: true,
            fontWeight: FontWeight.bold,
          ),
          const Spacer(),
          Radio(
            value: value,
            groupValue: valueChange,
            onChanged: (value) => onChange!(value!),
            fillColor: MaterialStateProperty.resolveWith(
                (states) => Get.isDarkMode ? pinkClr : mainColor),
          ),
        ],
      ),
    );
  }
}
