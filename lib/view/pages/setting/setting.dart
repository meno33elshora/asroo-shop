import 'package:asroo/logic/binding/app_binding.dart';
import 'package:asroo/logic/controller/bloc/app/app_cubit.dart';
import 'package:asroo/services/cache/cache_helper.dart';
import 'package:asroo/utils/theme.dart';
import 'package:asroo/view/Components/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../language/lang_controller.dart';
import '../../../services/cache/theme_controller.dart';
import '../../../utils/string_manager.dart';
import '../../components/btn_text.dart';
import '../../components/btn_widget.dart';
import '../login_screen.dart';

class Setting extends StatefulWidget {
   Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  String? _dropDownValue;
bool switchTheme = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) => Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              TextWidget(
                txt: StringManager.general.tr,
                fontSize: 18,
                color: Get.isDarkMode ? pinkClr : mainColor,
                notFontFamily: true,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: null,
                      icon: Container(
                        height: 40,width: 40,
                        padding: const EdgeInsets.all(4.0),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: purple,
                        ),
                        child: const Icon(
                          Icons.dark_mode,
                          color: Colors.white,
                        ),
                      )),
                  TextWidget(
                    txt: StringManager.themeMode.tr,
                    fontSize: 18,
                    color: Get.isDarkMode ? Colors.white : black,
                    notFontFamily: true,
                    fontWeight: FontWeight.bold,
                  ),
                  const Spacer(),
                  Switch(
                    // value: switchTheme,
                    value: ThemeController().getThemeDataFromBox(),
                    onChanged: (val) {
                        switchTheme =  val;
                      // ThemeController().getThemeDataFromBox() ==  val;
                        ThemeController().changesTheme();
                        setState(() {

                        });
                    },
                    // focusColor: Get.isDarkMode ? pinkClr : mainColor,
                    activeColor: Get.isDarkMode ?  pinkClr : mainColor,
                    inactiveTrackColor: Get.isDarkMode ? pinkClr : mainColor,
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  const IconButton(
                      onPressed: null,
                      icon: Icon(
                        CupertinoIcons.globe,
                        // color: Get.isDarkMode ? languageSettings : mainColor,
                        color:languageSettings ,
                        size: 30.0,

                      )),
                  TextWidget(
                    txt: StringManager.language.tr,
                    fontSize: 18,
                    color: Get.isDarkMode ? Colors.white : black,
                    notFontFamily: true,
                    fontWeight: FontWeight.bold,
                  ),
                  const Spacer(),
                  Container(
                    width: 105,
                    height: 35,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? pinkClr
                          : context.theme.primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: DropdownButton(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(10),
                      underline: Container(),
                      hint: _dropDownValue == null
                          ?  const Text(
                        StringManager.language,
                        style: TextStyle(color: Colors.white),
                      )
                          : Text(
                        _dropDownValue.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                      isExpanded: true,
                      iconSize: 25.0,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                      style: TextStyle(
                          color: Get.isDarkMode
                              ? pinkClr
                              : context.theme.primaryColor),
                      items: [
                        DropdownMenuItem(value:  ene,child: Text(english.tr ) ,),
                        DropdownMenuItem(value:  ara,child: Text(arabic.tr ) ,),
                        DropdownMenuItem(value:  frf,child: Text(france.tr ) ,),

                      ],
                      onChanged: (val) {
                        AppBinding.getApp(context).changeLang(val!);
                        Get.updateLocale( Locale( val));
                        setState(() {
                            _dropDownValue = val;
                            },
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              InkWell(
                onTap: (){
                  CacheHelper.removeData(key: 'login').then((value) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) =>  LoginScreen()),
                            (route) => false);
                  });

                },
                child: Row(
                  children: [
                    const IconButton(
                        onPressed: null,
                        icon: Icon(
                          CupertinoIcons.lock_open_fill,
                          // color: Get.isDarkMode ? blue : mainColor,
                          color:  blue ,
                          size: 30.0,
                        )),
                    TextWidget(
                      txt: StringManager.logout.tr,
                      fontSize: 18,
                      color: Get.isDarkMode ? Colors.white : black,
                      notFontFamily: true,
                      fontWeight: FontWeight.bold,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              // BtnWidget(
              //   onPressed: () {
              //     AppBinding.getApp(context).changeMode();
              //   },
              //   txt: "Theme",
              //   color: mainColor,
              //   iconData: CupertinoIcons.refresh_thick,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
