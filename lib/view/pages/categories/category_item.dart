import 'package:asroo/models/get_home_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../logic/binding/app_binding.dart';
import '../../../logic/controller/bloc/app/app_cubit.dart';
import '../../../utils/assets_manager.dart';
import '../../../utils/theme.dart';
import '../../Components/text_widget.dart';

class CategoryItem extends StatelessWidget {
  final String image;
  final double rate;
  final double price;
  final int productId;
  // final int index;
  final Function() favTap;
  final Function() cartTap;
  final Function() detailsTap;
  // final ProductModel productModel;

  const CategoryItem(
      {Key? key,
        required this.image,
        required this.rate,
        required this.price,
        required this.favTap,
        required this.productId,
        required this.cartTap,
        required this.detailsTap,
        // required this.productModel
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return  Container(
          padding: const EdgeInsets.all(10.0),
          color: Get.isDarkMode ? black :Colors.white,
          child: GridView.builder(
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 1.0,
            ),
            itemCount:
            AppBinding.getApp(context).productList.length,
            // itemCount: 5,
            shrinkWrap: true,
            controller: ScrollController(),
            itemBuilder: (context, index) {
              return   AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(seconds: 1),
                columnCount: 2,
                child: SlideAnimation(
                  // horizontalOffset: -100,
                  verticalOffset: -10,
                  child: FadeInAnimation(
                    child:   Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? pinkClr.withOpacity(0.2)
                              : mainColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12.0)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: favTap,
                                  splashColor: Colors.transparent,
                                  icon: Icon(
                                    AppBinding.getApp(context).isFavouriteItem(productId)
                                        ? CupertinoIcons.heart_fill
                                        : CupertinoIcons.heart,
                                    color: Get.isDarkMode ? pinkClr : mainColor,
                                  )),
                              Image.asset(
                                ImageAssets.facebook,
                                height: 30,
                                width: 30,
                              ),
                              IconButton(
                                  onPressed: cartTap,
                                  splashColor: Colors.transparent,
                                  icon: Icon(
                                    // AppBinding.getApp(context).isCartItem(productId)
                                    //     ? CupertinoIcons.cart_fill :
                                    CupertinoIcons.cart,
                                    color: Get.isDarkMode ? pinkClr : mainColor,
                                  )),
                            ],
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: detailsTap,
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 2.0,
                                ),
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.network(
                                      image,
                                      fit: BoxFit.cover,
                                    ),
                                    Container(
                                      height: 25,
                                      width: MediaQuery.of(context).size.width / 3,
                                      margin: const EdgeInsets.only(top: 70.0),
                                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                      decoration: BoxDecoration(
                                        color: black.withOpacity(0.7),
                                        borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(7),
                                          topLeft: Radius.circular(7),
                                          bottomRight: Radius.circular(7),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Icon(
                                            CupertinoIcons.star_fill,
                                            color: Colors.amber,
                                            size: 15,
                                          ),
                                          TextWidget(
                                              txt: "$rate",
                                              fontSize: 16,
                                              color: Colors.white,
                                              notFontFamily: false),
                                          Container(
                                            width: 2,
                                            color: Colors.white,
                                            margin: const EdgeInsets.all(3.0),
                                          ),
                                          TextWidget(
                                              txt: '\$ $price',
                                              fontSize: 16,
                                              color: Colors.white,
                                              notFontFamily: false),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );



            },
          ),
        );



      },
    );
  }
}
