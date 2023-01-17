import 'package:asroo/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class BoxCheck extends StatelessWidget {
  final bool isCheck;
  final Function(bool val) onChanged;
  const BoxCheck({Key? key,required this.isCheck , required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.3,
      child: Checkbox(
        value: isCheck,
        onChanged: (val) => onChanged(val!),
        fillColor: MaterialStateProperty.all(Get.isDarkMode ? pinkClr :  mainColor),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)),
        checkColor: Colors.white,
        side:  BorderSide(
          color: Get.isDarkMode ? pinkClr :   mainColor,
          width: 1,
        ),
      ),
    );
  }
}
