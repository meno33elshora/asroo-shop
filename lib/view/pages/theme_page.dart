import 'package:asroo/utils/theme.dart';
import 'package:asroo/view/components/btn_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/string_manager.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:  const BoxDecoration(
          gradient: LinearGradient(
            tileMode: TileMode.repeated,
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
            mainColor,
            pinkClr,
          ]),

        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BtnWidget(
                  onPressed: () {},
                  txt: StringManager.lightMode,
                  color: mainColor,
                  iconData: CupertinoIcons.light_max),
              BtnWidget(
                  onPressed: () {},
                  txt: StringManager.darkMode,
                  color: pinkClr,
                  iconData: CupertinoIcons.light_min),
            ],
          ),
        ),
      ),
    );
  }
}
