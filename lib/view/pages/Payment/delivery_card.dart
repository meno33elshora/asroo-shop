import 'package:asroo/logic/binding/app_binding.dart';
import 'package:asroo/logic/controller/bloc/app/app_cubit.dart';
import 'package:asroo/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../utils/string_manager.dart';
import '../../Components/text_widget.dart';

class DeliveryCard extends StatefulWidget {
  DeliveryCard({Key? key}) : super(key: key);

  @override
  State<DeliveryCard> createState() => _DeliveryCardState();
}

class _DeliveryCardState extends State<DeliveryCard> {
  int valueChange = 1;
  bool changeColor = false;
  String phoneNumber = '';
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppState>(
      listener: (context , state ){},
      builder: (context , state ) {
        return Column(
          children: [
            buildCard(
              title: StringManager.asrooShop,
              name: StringManager.asrooShop,
              address: 'egypt-cairo-talat harb',
              onChange: (int value) {
                setState(() {
                  valueChange = value;
                  changeColor = !changeColor;
                });
              },
              phone: '0123456789',
              color: changeColor ? Colors.white : Colors.grey.shade200,
              value: 1,
              widget: const Text(''),
            ),
            const SizedBox(
              height: 20.0,
            ),
            buildCard(
                title: StringManager.delivery,
                name: StringManager.delivery,
                address: AppBinding.getApp(context).address,
                onChange: (int value) {
                  setState(() {
                    valueChange = value;
                    changeColor = !changeColor;
                    AppBinding.getApp(context).updatePosition();
                  });

                },
                widget: SizedBox(
                    height: 30,
                    width: 30,
                    child: IconButton(
                      onPressed: () {
                        Get.defaultDialog(
                          title: "Enter Your Phone Number",
                          titleStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          backgroundColor: Colors.white,
                          radius: 10,
                          textCancel: " Cancel ",
                          confirmTextColor: Colors.black,
                          textConfirm: " Save ",
                          cancelTextColor: Colors.black,
                          onCancel: () {
                            Navigator.of(context).pop();
                          },
                          onConfirm: () {
                            Get.back();
                            phoneNumber = phoneController.text;
                            setState(() {

                            });
                          },
                          buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                          content: Padding(
                            padding: const EdgeInsets.all(15),
                            child: TextField(
                              controller: phoneController,
                              cursorColor: Colors.black,
                              maxLength: 11,
                              keyboardType: TextInputType.text,
                              onSubmitted: (value) {
                                phoneController.text = value;
                              },
                              decoration: InputDecoration(
                                fillColor: Get.isDarkMode
                                    ? pinkClr.withOpacity(0.1)
                                    : mainColor.withOpacity(0.2),
                                focusColor: Colors.red,
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: Get.isDarkMode ? pinkClr : mainColor,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    phoneController.clear();
                                  },
                                  icon: const Icon(Icons.close, color: Colors.black),
                                ),
                                hintText: "Enter Your Phone Number",
                                hintStyle: const TextStyle(
                                  color: Colors.black45,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      icon:
                      Icon(CupertinoIcons.ellipsis_vertical_circle_fill , color: Get.isDarkMode ? pinkClr : mainColor,),
                      padding: EdgeInsets.zero,
                    )),
                phone: phoneNumber,
                color: changeColor ? Colors.grey.shade200 : Colors.white,
                value: 2),
          ],
        );
      },
    );
  }

  Widget buildCard(
      {required Function(int value)? onChange,
      required String title,
      required String name,
      required String phone,
      required String address,
      required Color color,
      required Widget widget,
      required int value}) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 2.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
            value: value,
            groupValue: valueChange,
            onChanged: (value) => onChange!(value!),
            fillColor: MaterialStateProperty.resolveWith(
                (states) => Get.isDarkMode ? pinkClr : mainColor),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextWidget(
                  txt: title.toString(),
                  fontSize: 20,
                  color: Colors.black,
                  notFontFamily: true,
                  fontWeight: FontWeight.bold,
                ),
                TextWidget(
                  txt: name.toString(),
                  fontSize: 17,
                  color: Get.isDarkMode ? pinkClr : mainColor.withOpacity(0.8),
                  notFontFamily: true,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width/1.5,
                  child: Row(
                    children: [
                      TextWidget(
                        txt: "🇪🇬 +02 $phone",
                        fontSize: 17,
                        color:
                            Get.isDarkMode ? pinkClr : mainColor.withOpacity(0.8),
                        notFontFamily: true,
                        fontWeight: FontWeight.w500,
                      ),
                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width / 4.8,
                      // ),
                      const Spacer(),
                      widget,
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width/1.5,
                  child: TextWidget(
                    txt: address.toString(),
                    fontSize: 17,
                    color: Get.isDarkMode ? pinkClr : mainColor.withOpacity(0.8),
                    notFontFamily: true,
                    fontWeight: FontWeight.w500,
                    textOverflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
