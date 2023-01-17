import 'package:asroo/logic/binding/app_binding.dart';
import 'package:asroo/view/pages/product%20details/product_detail_item.dart';
import 'package:asroo/view/pages/product%20details/sized_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/get_home_data_model.dart';
import '../../../utils/string_manager.dart';
import '../../../utils/theme.dart';
import '../../Components/text_widget.dart';
import 'custom_bottom_cart.dart';
import 'image_slider.dart';

class ProductDetails extends StatelessWidget {
  ProductModel productModel;

  ProductDetails({Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
        Get.isDarkMode ? pinkClr : context.theme.primaryColor,
        centerTitle: true,
        elevation: 0.0,
        title:  TextWidget(
          txt: StringManager.details.tr,
          fontSize: 24,
          color: Colors.white,
          notFontFamily: true,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                ImageSlider(
                  imageUrl: productModel.image,
                ),
                ProductDetailItem(
                  title: productModel.title,
                  productId: productModel.id,
                  rate: productModel.rating.rate,
                  description: productModel.description,
                ),
                ListSized(),
              ],
            ),
             CustomBottomCart(productPrice: productModel.price, addToCartDetails: () {
               AppBinding.getApp(context).addProductToCart(productModel);
             },),
          ],
        ),
      ),
    );
  }
}
