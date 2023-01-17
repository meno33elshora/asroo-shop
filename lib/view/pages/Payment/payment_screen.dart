import 'package:asroo/logic/binding/app_binding.dart';
import 'package:asroo/logic/controller/bloc/app/app_cubit.dart';
import 'package:asroo/view/components/btn_text.dart';
import 'package:asroo/view/pages/Payment/payment_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../utils/string_manager.dart';
import '../../../utils/theme.dart';
import '../../Components/text_widget.dart';
import 'delivery_card.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit  , AppState>(
      listener: (context , state){},
      builder: (context , state ) => Scaffold(
        backgroundColor: Get.isDarkMode ? black : Colors.white,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? pinkClr : context.theme.primaryColor,
          centerTitle: true,
          elevation: 0.0,
          title: TextWidget(
            txt: StringManager.payment.tr,
            fontSize: 24,
            color: Colors.white,
            notFontFamily: true,
            fontWeight: FontWeight.w600,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    txt: StringManager.shipping.tr,
                    fontSize: 22,
                    color: Get.isDarkMode ? Colors.white : black,
                    notFontFamily: true,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 20.0,),
                  DeliveryCard(),
                  const SizedBox(height: 20.0,),
                  TextWidget(
                    txt: StringManager.paymentMethod.tr,
                    fontSize: 22,
                    color: Get.isDarkMode ? Colors.white : black,
                    notFontFamily: true,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 20.0,),
                  const PaymentMethod(),
                  const SizedBox(height: 20.0,),
                  Center(child: TextWidget(txt: 'Total : ${AppBinding.getApp(context).productTotal} \$ ', fontSize: 18, color:Get.isDarkMode ? pinkClr : mainColor, notFontFamily: false)),
                  const SizedBox(height: 20.0,),
                  Center(child: BtnText(onPressed: (){}, txt: StringManager.payNow.tr, color: Get.isDarkMode? pinkClr : mainColor)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
