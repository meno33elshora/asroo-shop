import 'package:asroo/utils/string_manager.dart';
import 'package:asroo/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Components/text_widget.dart';
import '../../search.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.8,
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Get.isDarkMode ? pinkClr: context.theme.primaryColor,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 0.8,
                blurStyle: BlurStyle.solid,
                offset: const Offset(2, 2)),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextWidget(
              txt: StringManager.findYour,
              fontSize: 19,
              color: Colors.white,
              notFontFamily: false),
          TextWidget(
              txt: StringManager.inspiration..capitalize,
              fontSize: 25,
              color: Colors.white,
              notFontFamily: false),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width / 1.2,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  SearchScreen()));
                    },
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    icon: const Icon(Icons.search,color: black,),
                    label:
                         const TextWidget(txt: StringManager.searchYourLooking,fontSize: 16,color: black, notFontFamily: false,)),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.filter_list,
                  color: Colors.white,
                  size: 30,
                ),
                padding: EdgeInsets.zero,
              )
            ],
          )
        ],
      ),
    );
  }
}
