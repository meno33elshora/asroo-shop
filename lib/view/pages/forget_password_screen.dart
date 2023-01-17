import 'package:asroo/logic/binding/app_binding.dart';
import 'package:asroo/logic/controller/bloc/auth/auth_cubit.dart';
import 'package:asroo/utils/string_manager.dart';
import 'package:asroo/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../utils/assets_manager.dart';
import '../components/btn_text.dart';
import '../components/text_field_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController forget = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit , AuthState>(
      listener: (context , state){},
      builder: (context , state){
        return Scaffold(
          backgroundColor: Get.isDarkMode ? black : Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: const Text(StringManager.forgetPassword),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _key,
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10.0),
                      const Image(
                        image: AssetImage(ImageAssets.forgetPass),
                        width: 300,
                        height: 300,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                      ),
                      TextFieldWidget(
                        validator: (String? val) {
                          if (val!.isEmpty) {
                            return StringManager.fieldIsEmpty;
                          }
                        },
                        controller: forget,
                        hintText: StringManager.forgetPassword,
                        obscureText: false,
                        prefixIcon:  Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Image(
                              image:const AssetImage(ImageAssets.user),
                              color:Get.isDarkMode ? pinkClr : mainColor,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child:
                        state is ! LoadingResetState ?
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child:
                          BtnText(
                            onPressed: () {
                              if (_key.currentState!.validate()) {
                                AppBinding.getAuth(context).resetEmailAccount(email: forget.text);
                              }
                            },
                            txt: StringManager.reset,
                            color: Get.isDarkMode ? pinkClr : mainColor,
                          ),
                        ) : CircularProgressIndicator(
                          color: Get.isDarkMode
                              ? pinkClr
                              : mainColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
