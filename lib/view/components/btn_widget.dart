import 'package:asroo/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BtnWidget extends StatelessWidget {
  final Function() onPressed;
  final String txt;
  final Color color;
  final IconData iconData;

  const BtnWidget(
      {Key? key,
      required this.onPressed,
      required this.txt,
      required this.color,
      required this.iconData,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
      ),
      icon: Icon(iconData),
      label: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          txt,
        ),
      ),
    );
  }
}
