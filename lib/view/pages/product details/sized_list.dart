import 'package:asroo/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Components/text_widget.dart';

class ListSized extends StatefulWidget {
  ListSized({Key? key}) : super(key: key);

  @override
  State<ListSized> createState() => _ListSizedState();
}

class _ListSizedState extends State<ListSized> {
  final List<String> listSize = ['S', 'M', 'L', 'XL', 'XXl'];

  int currentSelect = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.all(10.0),
      child: ListView.separated(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  currentSelect = index;
                });
              },
              child: Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? (currentSelect == index
                            ? pinkClr.withOpacity(0.5)
                            : Colors.white)
                        : (currentSelect == index
                            ? mainColor.withOpacity(0.5)
                            : Colors.white),
                    border: Border.all(
                        color: Get.isDarkMode ? Colors.white : black, width: 1),
                    borderRadius: BorderRadius.circular(10.0)),
                child: TextWidget(
                    txt: listSize[index],
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? (currentSelect == index ? Colors.white : black) : (currentSelect == index ?Colors .white :  black),
                    notFontFamily: true),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: listSize.length),
    );
  }
}
