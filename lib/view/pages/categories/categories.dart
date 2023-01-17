import 'package:asroo/logic/binding/app_binding.dart';
import 'package:asroo/logic/controller/bloc/app/app_cubit.dart';
import 'package:asroo/view/pages/shimmer/shimmer_widget.dart';
import 'package:asroo/view/pages/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../product details/product_details.dart';
import 'category_card.dart';
import 'category_item.dart';

class Categories extends StatelessWidget {
   Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String > categoryList = [

      "Women's Clothing",
      "Men's Clothing",
      "Jewelery",
      "Electronics",

    ];

    List<String> imageList = [
      AppBinding.getApp(context).productList[0].image,
      AppBinding.getApp(context).productList[3].image,
      AppBinding.getApp(context).productList[4].image,
      AppBinding.getApp(context).productList[10].image,
    ];
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
          itemBuilder: (context, index) => CategoryCard(
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => CategoryItem(
              //           image: AppBinding.getApp(context)
              //               .productList[index]
              //               .image,
              //           rate: AppBinding.getApp(context)
              //               .productList[index]
              //               .rating
              //               .rate,
              //           price: AppBinding.getApp(context)
              //               .productList[index]
              //               .price,
              //           favTap: () {
              //             AppBinding.getApp(context).addFavouriteList(
              //                 AppBinding.getApp(context)
              //                     .productList[index]
              //                     .id);
              //             // AppBinding.getApp(context).isFav();
              //           },
              //           productId:
              //               AppBinding.getApp(context).productList[index].id,
              //           cartTap: () {
              //             AppBinding.getApp(context).addProductToCart(
              //                 AppBinding.getApp(context).productList[index]);
              //             // AppBinding.getApp(context).removeOneProduct(AppBinding.getApp(context).productList[index]);
              //           },
              //           detailsTap: () {
              //             Navigator.of(context).push(MaterialPageRoute(
              //                 builder: (context) => ProductDetails(
              //                       productModel: AppBinding.getApp(context)
              //                           .productList[index],
              //                     )));
              //           }, productModel: AppBinding.getApp(context).productList[index],
              //         )));
            },
            text: categoryList[index],
            image: imageList[index],
          ),
          separatorBuilder: (context, index) => const SizedBox(
            height: 20.0,
          ),
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          itemCount: categoryList.length,
        );
      },
    );
  }
}
