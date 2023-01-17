import 'package:asroo/models/get_home_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/binding/app_binding.dart';
import '../../../utils/theme.dart';
import '../../Components/text_widget.dart';

class CartItem extends StatelessWidget {
  final ProductModel productModel;
final int index;
final int quantity;
  const CartItem({
    Key? key,
    required this.productModel,
    required this.index,
    required this.quantity,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: SizedBox(
      height: 120,
      width: double.infinity,
      child: Card(
        color: Get.isDarkMode
            ? pinkClr.withOpacity(0.3)
            : context.theme.primaryColor.withOpacity(0.3),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
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
                  child: Image.network(productModel.image,),
                )),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
                child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    txt: productModel.title,
                    // AppBinding.getApp(context).favouriteList[index].title,
                    fontSize: 17,
                    color:
                        Get.isDarkMode ? pinkClr : context.theme.primaryColor,
                    notFontFamily: true,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                   TextWidget(
                    txt: '\$ ${AppBinding.getApp(context).productSubtotal[index].toStringAsFixed(2)}',
                    // AppBinding.getApp(context).favouriteList[index].description,
                    fontSize: 14,
                    color: lightBrown,
                    notFontFamily: false,
                  ),
                ],
              ),
            )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          AppBinding.getApp(context).addProductInCart(productModel);
                        },
                        icon: Icon(
                          CupertinoIcons.add_circled_solid,
                          size: 20.0,
                          color: Get.isDarkMode ? pinkClr : mainColor,
                        )),
                     TextWidget(
                      txt: '$quantity',
                      // AppBinding.getApp(context).favouriteList[index].description,
                      fontSize: 14,
                      color: lightBrown,
                      notFontFamily: false,
                    ),
                    IconButton(
                        onPressed: () {
                          AppBinding.getApp(context).removeProductFromCart(productModel);
                        },
                        icon: const Icon(
                          CupertinoIcons.minus_circle_fill,
                          size: 20.0,
                          color: Colors.white,
                        ))
                  ],
                ),
                IconButton(
                    onPressed: () {
                      AppBinding.getApp(context).removeOneProduct(productModel);
                    },
                    icon: const Icon(
                      CupertinoIcons.delete,
                      size: 20.0,
                      color: Colors.red,
                    ))
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
