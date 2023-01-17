import 'package:asroo/utils/theme.dart';
import 'package:asroo/view/components/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BtnText extends StatelessWidget {
  final Function() onPressed;
  final String txt;
  final Color color;

  const BtnText(
      {Key? key,
        required this.onPressed,
        required this.txt,
        required this.color,
       })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
        elevation: MaterialStateProperty.all(0.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextWidget(
          txt: txt, fontSize: 21, color:  Colors.white, notFontFamily: false,

        ),
      ),
    );
  }
}
