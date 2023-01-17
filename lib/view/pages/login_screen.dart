import 'package:asroo/logic/binding/app_binding.dart';
import 'package:asroo/logic/controller/bloc/auth/auth_cubit.dart';
import 'package:asroo/view/pages/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../utils/assets_manager.dart';
import '../../utils/string_manager.dart';
import '../../utils/theme.dart';
import '../components/box_check.dart';
import '../components/btn_text.dart';
import '../components/custom_container.dart';
import '../components/text_field_widget.dart';
import '../components/text_item_login_signup.dart';
import '../components/text_widget.dart';
import 'forget_password_screen.dart';
import 'main_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Get.isDarkMode ? black : Colors.white,
          appBar: AppBar(
            backgroundColor: Get.isDarkMode ? black : Colors.transparent,
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: Form(
                    key: _key,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 1.3,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10.0),
                              const TextItemLoginSignUp(
                                txt1: "LOG",
                                txt2: " IN",
                                isTrueOrFalse: true,
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.06),
                              TextFieldWidget(
                                validator: (String? val) {
                                  if (val.toString().length <= 2 ||
                                      !RegExp(validationEmail)
                                          .hasMatch(val!)) {
                                    return "Email Not Valid";
                                  } else {
                                    return null;
                                  }
                                },
                                controller: emailController,
                                hintText: 'Email',
                                obscureText: false,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Image(
                                      image:
                                          const AssetImage(ImageAssets.email),
                                      color: Get.isDarkMode
                                          ? pinkClr
                                          : mainColor,
                                    ),
                                  ),
                                ),
                              ),
                              TextFieldWidget(
                                validator: (String? val) {
                                  if (val!.isEmpty) {
                                    return StringManager.passwordEmpty;
                                  }
                                },
                                controller: passwordController,
                                hintText: StringManager.password,
                                obscureText:
                                    AppBinding.getAuth(context).isVisible,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Image(
                                      image:
                                          const AssetImage(ImageAssets.lock),
                                      color: Get.isDarkMode
                                          ? pinkClr
                                          : mainColor,
                                    ),
                                  ),
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      AppBinding.getAuth(context)
                                          .changeVisible();
                                    },
                                    icon: Icon(
                                      AppBinding.getAuth(context).isVisible
                                          ? CupertinoIcons.eye_slash_fill
                                          : CupertinoIcons.eye,
                                      color: Get.isDarkMode
                                          ? pinkClr
                                          : mainColor,
                                    )),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ForgetPasswordScreen()),
                                      );
                                    },
                                    child: TextWidget(
                                      txt: StringManager.forget,
                                      fontSize: 17,
                                      color: Get.isDarkMode ? pinkClr : black,
                                      notFontFamily: false,
                                      textDecoration:
                                          TextDecoration.underline,
                                      decorationColor: Get.isDarkMode
                                          ? pinkClr
                                          : mainColor,
                                      decorationThickness: 1.5,
                                      textDecorationStyle:
                                          TextDecorationStyle.solid,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  BoxCheck(
                                    isCheck:
                                        AppBinding.getAuth(context).isCheck,
                                    onChanged: (bool val) {
                                      AppBinding.getAuth(context)
                                          .changeCheck();
                                    },
                                  ),
                                  TextWidget(
                                    txt: StringManager.remember,
                                    fontSize: 18,
                                    color: Get.isDarkMode ? pinkClr : black,
                                    notFontFamily: false,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10.0),
                              Center(
                                child: state is! LoadingLoginUserState
                                    ? SizedBox(
                                        width: MediaQuery.of(context)
                                                .size
                                                .width /
                                            1,
                                        height: 70,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: BtnText(
                                            onPressed: () {
                                              if (_key.currentState!
                                                      .validate() &&
                                                  AppBinding.getAuth(context)
                                                      .isCheck) {
                                                AppBinding.getAuth(context)
                                                    .loginUserAccount(
                                                        email: emailController
                                                            .text,
                                                        password:
                                                            passwordController
                                                                .text);

                                                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainScreen()));
                                              } else {
                                                Get.snackbar(
                                                  StringManager.rememberPassword,
                                                  StringManager.pleaseAcceptRemember,
                                                  backgroundColor:
                                                      Get.isDarkMode
                                                          ? pinkClr
                                                          : mainColor,
                                                  margin:
                                                      const EdgeInsets.all(
                                                          10),
                                                  colorText: Colors.white,
                                                );
                                              }
                                            },
                                            txt: StringManager.login,
                                            color: Get.isDarkMode
                                                ? pinkClr
                                                : mainColor,
                                          ),
                                        ))
                                    : CircularProgressIndicator(
                                        color: Get.isDarkMode
                                            ? pinkClr
                                            : mainColor,
                                      ),
                              ),
                              const SizedBox(height: 20.0),
                              Center(
                                child: TextWidget(
                                  txt:StringManager.or,
                                  fontSize: 18,
                                  color: Get.isDarkMode ? pinkClr : mainColor,
                                  notFontFamily: false,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                      onTap: () {},
                                      child: CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Get.isDarkMode
                                            ? Colors.white
                                            : mainColor.withOpacity(0.3),
                                        child: const Image(
                                            image: AssetImage(
                                                ImageAssets.google)),
                                      )),
                                  const SizedBox(width: 30.0),
                                  InkWell(
                                      onTap: () {
                                        // LocalDataSource.removeData(key: "getStart").then((value) {
                                        //   Navigator.of(context).pushAndRemoveUntil(
                                        //       MaterialPageRoute(builder: (context) => const GetStart()),
                                        //           (route) => false);
                                        // });
                                      },
                                      child: CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Get.isDarkMode
                                            ? Colors.white
                                            : mainColor.withOpacity(0.3),
                                        child: const Image(
                                          image: AssetImage(
                                              ImageAssets.facebook),
                                        ),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomContainer(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()),
                        (route) => false);
                  },
                  status: StringManager.noAccount,
                  textBtn: StringManager.signUp,
                ),
              ],
            ),
          ),
          // BlocConsumer<AuthCubit, AuthState>(
          //   listener: (context, state) {},
          //   builder: (context, state) {
          //     return ;
          //   },
          // ),
        );
      },
    );
  }
}
