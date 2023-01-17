import 'package:asroo/logic/controller/bloc/app/app_cubit.dart';
import 'package:asroo/utils/string_manager.dart';
import 'package:asroo/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../logic/binding/app_binding.dart';
import '../../Components/text_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';
import 'package:google_fonts/google_fonts.dart';


class ProductDetailItem extends StatelessWidget {
  final String title;
  final int productId;
  final double rate;
  final String description;

  const ProductDetailItem({
    Key? key,
    required this.title,
    required this.productId,
    required this.rate,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                            txt: title,
                            fontSize: 18,
                            color: Get.isDarkMode ? Colors.white : black,
                            notFontFamily: false,
                            fontWeight: FontWeight.bold,
                            maxLines: 1),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            TextWidget(
                                txt: "$rate",
                                fontSize: 20,
                                color: Get.isDarkMode ? pinkClr : mainColor,
                                notFontFamily: false,
                                fontWeight: FontWeight.bold,
                                maxLines: 1),
                            const SizedBox(
                              width: 20.0,
                            ),
                            RatingBar(
                              initialRating: rate,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              unratedColor: Colors.grey,
                              itemSize: 20,
                              ratingWidget: RatingWidget(
                                full: Icon(
                                  CupertinoIcons.star_fill,
                                  color: Get.isDarkMode ? pinkClr : mainColor,
                                ),
                                half: Icon(
                                  CupertinoIcons.star_lefthalf_fill,
                                  color: Get.isDarkMode ? pinkClr : mainColor,
                                ),
                                empty: Icon(
                                  CupertinoIcons.star,
                                  color: Get.isDarkMode ? pinkClr : mainColor,
                                ),
                              ),
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    // height: 40,width: 40,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(5.0),
                    child: IconButton(
                        onPressed: () {
                          AppBinding.getApp(context)
                              .addFavouriteList(productId);
                        },
                        icon: Icon(
                          AppBinding.getApp(context).isFavouriteItem(productId)
                              ? CupertinoIcons.heart_fill
                              : CupertinoIcons.heart,
                          size: 30.0,
                          color: Get.isDarkMode ? pinkClr : mainColor,
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
               ReadMoreText(
                description,
                trimLines: 3,
                 textAlign: TextAlign.justify,
                 trimCollapsedText: StringManager.showMore,
                 trimExpandedText: StringManager.lessMore,
                 trimMode: TrimMode.Line,
                 style: GoogleFonts.ptSans(
                   fontWeight: FontWeight.w500,
                   fontSize: 18,
                   height: 1.5,
                   color: Get.isDarkMode ? Colors.white : black,
                 ),
                 moreStyle:  GoogleFonts.ptSans(
                   fontWeight: FontWeight.w600,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                 ),
                 lessStyle:  GoogleFonts.ptSans(
                   fontWeight: FontWeight.w600,
                   color: Get.isDarkMode ? pinkClr : mainColor,
                 ),
              ),

            ],
          ),
        );
      },
    );
  }
}
