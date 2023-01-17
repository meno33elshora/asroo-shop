import 'package:asroo/logic/binding/app_binding.dart';
import 'package:asroo/utils/string_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../logic/controller/bloc/app/app_cubit.dart';
import '../../../utils/theme.dart';
import '../../Components/text_widget.dart';

class CustomBottomCart extends StatelessWidget {
  final double productPrice;
  final Function() addToCartDetails;
  const CustomBottomCart({Key? key , required this.productPrice , required this.addToCartDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppState>(
      listener: (context , state ) {},
      builder:  (context , state ){
        return  Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            clipBehavior: Clip.antiAlias,
            child: Container(
              color: Get.isDarkMode ? pinkClr : mainColor,
              height: 100,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                       TextWidget(
                          txt: StringManager.price.tr,
                          fontSize: 20,
                          // color: Get.isDarkMode ? pinkClr : mainColor,
                          color: Colors.white,
                          notFontFamily: false),
                      TextWidget(
                          txt: '\$ $productPrice',
                          fontSize: 20,
                          // color: Get.isDarkMode ? pinkClr : mainColor,
                          color: Colors.white,

                          notFontFamily: false),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width/2,
                    child: ElevatedButton.icon(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.white),
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)))
                        ),
                        onPressed: addToCartDetails,
                        icon:  Icon(CupertinoIcons.cart_fill,color: Get.isDarkMode ? pinkClr : mainColor,),
                        label:  TextWidget(
                            txt: StringManager.addToCart.tr,
                            fontSize: 20,
                            color: Get.isDarkMode ? pinkClr : mainColor,
                            notFontFamily: false)),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
