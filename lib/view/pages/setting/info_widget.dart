import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/theme.dart';
import '../../Components/text_widget.dart';


class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundColor: mainColor,
              radius: 40,
            ),
            const SizedBox(
              width: 30.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  txt: 'txt@xmail.com',
                  fontSize: 20,
                  color: Get.isDarkMode ? Colors.white : black,
                  notFontFamily: true,
                  fontWeight: FontWeight.bold,
                ),
                TextWidget(
                  txt: 'txt@xmail.com',
                  fontSize: 18,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                  notFontFamily: true,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Divider(
          thickness: 3,
          color: Get.isDarkMode ? pinkClr : mainColor,
          // endIndent: 5.0,
          // indent: 5.0,
        ),
      ],
    );
  }
}
