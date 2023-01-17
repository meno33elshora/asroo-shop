import 'package:asroo/logic/controller/bloc/app/app_cubit.dart';
import 'package:asroo/utils/assets_manager.dart';
import 'package:asroo/utils/theme.dart';
import 'package:asroo/view/Components/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class CategoryCard extends StatelessWidget {
  final Function() onTap;
  final String text;
  final String image;

  const CategoryCard(
      {Key? key, required this.onTap, required this.text, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return InkWell(
          onTap: onTap,
          child: Container(
            height: MediaQuery.of(context).size.height / 5,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(image)),
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
                border: Border.all(
                    color: Get.isDarkMode ? pinkClr : mainColor,
                    width: 2,
                    strokeAlign: StrokeAlign.outside,
                  style: BorderStyle.solid
                ),
                // color: Get.isDarkMode ? pinkClr :  mainColor ,
                ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Card(
                  shadowColor: Get.isDarkMode ? pinkClr.withOpacity(0.5) : mainColor.withOpacity(0.5),
                  elevation: 2,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    topLeft: Radius.circular(5.0),
                    bottomRight: Radius.circular(5.0),
                  )),
                  // color: Get.isDarkMode ? pinkClr :  mainColor ,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextWidget(
                      txt: text,
                      fontSize: 22,
                      // color: Get.isDarkMode ? pinkClr :  mainColor,
                      color: Get.isDarkMode ? pinkClr : mainColor,
                      notFontFamily: true,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
