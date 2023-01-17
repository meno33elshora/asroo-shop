import 'package:asroo/logic/controller/bloc/app/app_cubit.dart';
import 'package:asroo/view/pages/Cart/pay_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../logic/binding/app_binding.dart';
import '../../../utils/string_manager.dart';
import '../../../utils/theme.dart';
import '../../Components/text_widget.dart';
import 'card_item.dart';
import 'empty_cart.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Get.isDarkMode ? black : Colors.white,
          appBar: AppBar(
            backgroundColor:
                Get.isDarkMode ? pinkClr : context.theme.primaryColor,
            centerTitle: true,
            elevation: 0.0,
            title:  TextWidget(
              txt: StringManager.cart.tr,
              fontSize: 24,
              color: Colors.white,
              notFontFamily: true,
              fontWeight: FontWeight.w600,
            ),
            actions: [
              IconButton(onPressed: (){
                AppBinding.getApp(context).clearAllProduct();
              }, icon: const Icon(CupertinoIcons.clear_circled_solid , color: Colors.white, size: 30.0,)),
            ],
          ),
          body: Center(
            child:
            AppBinding.getApp(context).productMap.isEmpty ?
            const EmptyCart() :
            Column(
              children: [
                Expanded(
                  child:
                  ListView.separated(
                    shrinkWrap: true,
                      padding: const EdgeInsets.all(10.0),
                      itemBuilder: (context, index) =>  CartItem(
                        productModel: AppBinding.getApp(context).productMap.keys.toList()[index],
                        index: index,
                        quantity: AppBinding.getApp(context).productMap.values.toList()[index],
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10.0,
                          ),
                      itemCount: AppBinding.getApp(context).productMap.length),
                ),
                const PayItem()
              ],
            ),
          ),
        );
      },
    );
  }
}
