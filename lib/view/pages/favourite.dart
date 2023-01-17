import 'package:asroo/logic/binding/app_binding.dart';
import 'package:asroo/logic/controller/bloc/app/app_cubit.dart';
import 'package:asroo/utils/assets_manager.dart';
import 'package:asroo/utils/string_manager.dart';
import 'package:asroo/utils/theme.dart';
import 'package:asroo/view/Components/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
class Favourite extends StatelessWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        if(AppBinding.getApp(context).favouriteList.isEmpty ){
         return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImageAssets.heart,height: 200,width: 200,color: Get.isDarkMode ? pinkClr : mainColor,),
                const SizedBox(height: 30.0,),
                TextWidget(txt: StringManager.pleaseAddItem, fontSize: 25, color: Get.isDarkMode ? pinkClr : context.theme.primaryColor, notFontFamily: false),
              ],
            ),
          );
        } else{
         return Center(
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(10.0),
                    itemBuilder: (context, index) => SizedBox(
                      height: 120,
                      width: double.infinity,
                      child: Card(
                        color: Colors.transparent,
                        elevation: 0.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                height: 110,
                                width: 110,
                                child: Card(
                                  color: Colors.white,
                                  elevation: 0.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0)),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Image.network(AppBinding.getApp(context).favouriteList[index].image ,),
                                )),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                                child: SizedBox(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:  [
                                      TextWidget(
                                        txt:
                                        AppBinding.getApp(context).favouriteList[index].title,
                                        fontSize: 17,
                                        color:Get.isDarkMode ? pinkClr :  context.theme.primaryColor,
                                        notFontFamily: true,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      TextWidget(
                                        txt:
                                        AppBinding.getApp(context).favouriteList[index].description,
                                        fontSize: 14,
                                        color: lightBrown,
                                        notFontFamily: false,
                                      ),
                                    ],
                                  ),
                                )),
                            IconButton(
                                onPressed: () {
                                  AppBinding.getApp(context).addFavouriteList( AppBinding.getApp(context).favouriteList[index].id);
                                },
                                icon: const Icon(
                                  CupertinoIcons.heart_fill,
                                  size: 30.0,
                                  color: Colors.red,
                                ))
                          ],
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10.0,
                    ),
                    itemCount: AppBinding.getApp(context).favouriteList.length,
                  ),
                ),
              ],
            ),
          );
        }

      },
    );
  }
}
