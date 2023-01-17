import 'package:asroo/utils/theme.dart';
import 'package:asroo/view/pages/product%20details/widget_color_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {
  final String imageUrl;

  const ImageSlider({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  CarouselController controller = CarouselController();
  int activeIndex = 0;
  int activeColor = 0;
List<Color> colors =[
  Colors.white , Colors.black ,
  Colors.blue, Colors.orange
];
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Get.isDarkMode ? pinkClr : mainColor,
      height: MediaQuery.of(context).size.height / 2.2,
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CarouselSlider.builder(
            itemBuilder: (context, index, realIndex) {
              return Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(image: NetworkImage(widget.imageUrl)),
                ),
              );
            },
            carouselController: controller,
            options: CarouselOptions(
              autoPlay: true,
              animateToClosest: true,
              autoPlayAnimationDuration: const Duration(seconds: 2),
              initialPage: 0,
              reverse: true,
              height: MediaQuery.of(context).size.height / 3,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              },
            ),
            itemCount: 3,
          ),
          Positioned(
              bottom: 1.0,
              child: AnimatedSmoothIndicator(
                count: 3,
                activeIndex: activeIndex,
                effect: ExpandingDotsEffect(
                    radius: 10.0,
                    dotColor: Get.isDarkMode ? Colors.white : lightBrown,
                    strokeWidth: 2,
                    activeDotColor: Get.isDarkMode ? pinkClr : mainColor,
                    offset: 10.0,
                    paintStyle: PaintingStyle.fill,
                    dotHeight: 10,
                    dotWidth: 15),
              )),
          Positioned(
            bottom: 1.0,
            right: 10.0,
            child: Container(
                height: 180,
                width: 50,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Get.isDarkMode ? pinkClr.withOpacity(0.4) : mainColor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListView.separated(
                  shrinkWrap: true,

                    itemBuilder: (context, index) {
                      return  InkWell(
                        onTap: (){
                          setState(() {
                            activeColor = index;
                          });
                        },
                        child: WidgetColorSelect(
                          color: colors[index],
                          outerBorder: activeColor == index,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 10.0,
                        ),
                    itemCount: colors.length)),
          ),
        ],
      ),
    );
  }
}
