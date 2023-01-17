import 'package:asroo/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:get/get.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
        color: Get.isDarkMode ? pinkClr.withOpacity(0.3) : context.theme.primaryColor.withOpacity(0.3),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: AnimationConfiguration.staggeredGrid(
            position: 10,
            duration: const Duration(seconds: 1),
            columnCount: 2,
            child: SlideAnimation(
              // horizontalOffset: -100,
              verticalOffset: -10,
              child: FadeInAnimation(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                      childAspectRatio: 1.0,
                    ),
                    itemCount: 10,
                    // itemCount: 5,
                    shrinkWrap: true,
                    controller: ScrollController(),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            // color: Colors.grey.withOpacity(0.2),
                            color: Get.isDarkMode ? pinkClr.withOpacity(0.3) : context.theme.primaryColor.withOpacity(0.3)
                        ),
                      );
                    },
                  ),
              ),
            ),
          )



        ));
  }
}
