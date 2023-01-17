import 'package:asroo/logic/controller/bloc/app/app_cubit.dart';
import 'package:asroo/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import '../../../../logic/binding/app_binding.dart';
import '../../../../utils/string_manager.dart';
import '../../../Components/text_widget.dart';
import '../../../components/animate_widget.dart';
import '../../product details/product_details.dart';
import '../../shimmer/shimmer_widget.dart';
import 'custom_grid.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  String? _dropDownValue;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                          txt: StringManager.categories,
                          fontSize: 22,
                          color: Get.isDarkMode
                              ? pinkClr
                              : context.theme.primaryColor,
                          notFontFamily: false),
                      Container(
                        width: 100,
                        height: 30,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? pinkClr
                              : context.theme.primaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: DropdownButton(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(10),
                          underline: Container(),
                          hint: _dropDownValue == null
                              ? const Text(
                                  'Select',
                                  style: TextStyle(color: Colors.white),
                                )
                              : Text(
                                  _dropDownValue.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                          isExpanded: true,
                          iconSize: 25.0,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                          style: TextStyle(
                              color: Get.isDarkMode
                                  ? pinkClr
                                  : context.theme.primaryColor),
                          items: ['One', 'Two', 'Three'].map(
                            (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                              () {
                                _dropDownValue = val;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  state is AppLoadingHomeState
                      ? const ShimmerWidget()
                      : GridView.builder(
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
                                  child:  CustomGrid(
                                    image: AppBinding.getApp(context)
                                        .productList[index]
                                        .image,
                                    rate: AppBinding.getApp(context)
                                        .productList[index]
                                        .rating
                                        .rate,
                                    price: AppBinding.getApp(context)
                                        .productList[index]
                                        .price,
                                    favTap: () {
                                      AppBinding.getApp(context).addFavouriteList(
                                          AppBinding.getApp(context)
                                              .productList[index]
                                              .id);
                                      // AppBinding.getApp(context).isFav();
                                    },
                                    productId: AppBinding.getApp(context)
                                        .productList[index]
                                        .id,
                                    cartTap: () {
                                      AppBinding.getApp(context).addProductToCart(
                                          AppBinding.getApp(context)
                                              .productList[index]);
                                      // AppBinding.getApp(context).removeOneProduct(AppBinding.getApp(context).productList[index]);
                                    },
                                    detailsTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => ProductDetails(
                                            productModel:
                                            AppBinding.getApp(context)
                                                .productList[index],
                                          )));
                                    },
                                  ),
                                ),
                              ),
                            );



                          },
                        ),
                ],
              ),
            ),
          );
        }
        // },
        );
  }
}
