import 'package:asroo/logic/controller/bloc/app/app_cubit.dart';
import 'package:asroo/utils/string_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../logic/binding/app_binding.dart';
import '../../../utils/theme.dart';
import '../../Components/text_widget.dart';
import '../../components/btn_text.dart';
import '../Payment/payment_screen.dart';

class PayItem extends StatelessWidget {
  const PayItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
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
                          txt: StringManager.total.tr,
                          fontSize: 20,
                          // color: Get.isDarkMode ? pinkClr : mainColor,
                          color: Colors.white,
                          notFontFamily: false),
                      TextWidget(
                          txt: '\$ ${AppBinding.getApp(context).productTotal}',
                          fontSize: 20,
                          // color: Get.isDarkMode ? pinkClr : mainColor,
                          color: Colors.white,
                          notFontFamily: false),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2,
                    child: ElevatedButton.icon(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(15.0)))),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const PaymentScreen()));
                        },
                        icon: Icon(
                          CupertinoIcons.cart_fill,
                          color: Get.isDarkMode ? pinkClr : mainColor,
                        ),
                        label: TextWidget(
                            txt: StringManager.checkOut.tr,
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
