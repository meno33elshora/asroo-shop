import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimateWidgetItem extends StatelessWidget {
  final Widget item;
  final double? horizontalOffset;
  final double? verticalOffset;

  const AnimateWidgetItem({
    Key? key,
    required this.item,
    this.horizontalOffset,
    this.verticalOffset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 1,
      duration: const Duration(milliseconds: 375),
      child: SlideAnimation(
        horizontalOffset: horizontalOffset,
        verticalOffset: verticalOffset,
        child: FadeInAnimation(
          child: item,
        ),
      ),
    );
  }
}
