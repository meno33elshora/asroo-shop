import 'package:asroo/logic/controller/bloc/app/app_cubit.dart';
import 'package:asroo/utils/string_manager.dart';
import 'package:asroo/utils/theme.dart';
import 'package:asroo/view/pages/product%20details/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../logic/binding/app_binding.dart';
import '../../utils/assets_manager.dart';
import '../Components/text_widget.dart';
import '../components/text_field_widget.dart';

class SearchScreen extends StatelessWidget {
  // final String imageUrl ;
  // final String title ;
  // final String description ;

  SearchScreen({
    Key? key,
    // required this.title ,
    // required this.imageUrl ,
    // required this.description,
  }) : super(key: key);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
          //   elevation: 0.0,
          //   centerTitle: true,
          //   title: Text('Search'),
          // ),
          body: Column(
            children: [
              SizedBox(
                height: 70,
                child: TextFieldWidget(
                  validator: (String? val) {},
                  change: (val) {
                    AppBinding.getApp(context).searchToList(val!);
                  },
                  controller: controller,
                  hintText: StringManager.searchList,
                  obscureText: false,
                  iconDelete: IconButton(
                    onPressed: () {
                      controller.clear();
                      AppBinding.getApp(context).clearSearch();
                    },
                    icon: Icon(
                      CupertinoIcons.clear_circled_solid,
                      color: Get.isDarkMode ? pinkClr : mainColor,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),
              Expanded(
                child: AppBinding.getApp(context).searchList.isNotEmpty
                    ? ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(10.0),
                            height: 120,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ProductDetails(
                                        productModel: AppBinding.getApp(context)
                                            .productList[index])));
                              },
                              child: Card(
                                color: Colors.transparent,
                                elevation: 0.0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        height: 110,
                                        width: 110,
                                        child: Card(
                                          color: Colors.white,
                                          elevation: 0.0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0)),
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          child: Image.network(
                                              AppBinding.getApp(context)
                                                  .productList[index]
                                                  .image),
                                        )),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Expanded(
                                        child: SizedBox(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            txt: AppBinding.getApp(context)
                                                .productList[index]
                                                .title,
                                            fontSize: 17,
                                            color: Get.isDarkMode
                                                ? pinkClr
                                                : context.theme.primaryColor,
                                            notFontFamily: true,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          TextWidget(
                                            txt: AppBinding.getApp(context)
                                                .productList[index]
                                                .description,
                                            fontSize: 14,
                                            color: lightBrown,
                                            notFontFamily: false,
                                          ),
                                        ],
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 0.0,
                            ),
                        itemCount: AppBinding.getApp(context).searchList.length)
                    : Center(
                        child: SizedBox(
                        height: 200,
                        child: Image.asset(Get.isDarkMode ?ImageAssets.searchDark : ImageAssets.searchLight,),
                      )),
              ),
            ],
          ),
        );
      },
    );
  }
}
