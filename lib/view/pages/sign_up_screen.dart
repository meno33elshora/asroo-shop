import 'package:asroo/logic/binding/app_binding.dart';
import 'package:asroo/logic/controller/bloc/auth/auth_cubit.dart';
import 'package:asroo/view/pages/login_screen.dart';
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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // final getController = Get.find<AuthController>();

  @override
  void initState() {
    userController.text = "test name";
    emailController.text = "test@gmail.com";
    passwordController.text = "123456";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 1.3,
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 10.0),
                                      const TextItemLoginSignUp(
                                          txt1: StringManager.sign,
                                          txt2:  StringManager.up,
                                          isTrueOrFalse: true),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                      ),
                                      TextFieldWidget(
                                        validator: (String? val) {
                                          if (val.toString().length <= 2 ||
                                              !RegExp(validationName)
                                                  .hasMatch(val!)) {
                                            return StringManager.userValid;
                                          } else {
                                            return null;
                                          }
                                        },
                                        controller: userController,
                                        hintText: StringManager.user,
                                        obscureText: false,
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: Image(
                                              image: const AssetImage(
                                                  ImageAssets.user),
                                              color: Get.isDarkMode
                                                  ? pinkClr
                                                  : mainColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                      TextFieldWidget(
                                        validator: (String? val) {
                                          if (val.toString().length <= 2 ||
                                              !RegExp(validationEmail)
                                                  .hasMatch(val!)) {
                                            return StringManager.emailValid;
                                          } else {
                                            return null;
                                          }
                                        },
                                        controller: emailController,
                                        hintText: StringManager.email,
                                        obscureText: false,
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: Image(
                                              image: const AssetImage(
                                                  ImageAssets.email),
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
                                        obscureText: AppBinding.getAuth(context)
                                            .isVisible1,
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: Image(
                                              image: const AssetImage(
                                                  ImageAssets.lock),
                                              color: Get.isDarkMode
                                                  ? pinkClr
                                                  : mainColor,
                                            ),
                                          ),
                                        ),
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              AppBinding.getAuth(context)
                                                  .changeVisible1();
                                            },
                                            icon: Icon(
                                              AppBinding.getAuth(context)
                                                      .isVisible1
                                                  ? CupertinoIcons
                                                      .eye_slash_fill
                                                  : CupertinoIcons.eye,
                                              color: Get.isDarkMode
                                                  ? pinkClr
                                                  : mainColor,
                                            )),
                                      ),
                                      const SizedBox(height: 20.0),
                                      Row(
                                        children: [
                                          BoxCheck(
                                            isCheck: AppBinding.getAuth(context)
                                                .isCheck1,
                                            onChanged: (bool val) {
                                              AppBinding.getAuth(context)
                                                  .changeCheck1();
                                            },
                                          ),
                                          TextWidget(
                                            txt: StringManager.iAccept,
                                            fontSize: 18,
                                            color: Get.isDarkMode
                                                ? pinkClr
                                                : black,
                                            notFontFamily: false,
                                          ),
                                          TextButton(
                                            onPressed: () {},
                                            child: TextWidget(
                                              txt: StringManager.terms1,
                                              fontSize: 20,
                                              color: Get.isDarkMode
                                                  ? pinkClr
                                                  : black,
                                              notFontFamily: false,
                                              textDecoration:
                                                  TextDecoration.underline,
                                              decorationColor: Get.isDarkMode
                                                  ? pinkClr
                                                  : mainColor.withOpacity(0.5),
                                              decorationThickness: 1.5,
                                              textDecorationStyle:
                                                  TextDecorationStyle.solid,
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 20.0),
                                      Center(
                                        child: state is! LoadingAddUserState
                                            ? SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: BtnText(
                                                    onPressed: () {
                                                      if (_key.currentState!
                                                              .validate() &&
                                                          AppBinding.getAuth(context)
                                                              .isCheck1) {
                                                        AppBinding.getAuth(
                                                                context)
                                                            .addUserAccount(
                                                          user: userController
                                                              .text,
                                                          email: emailController
                                                              .text,
                                                          password:
                                                              passwordController
                                                                  .text,
                                                        );
                                                      } else {
                                                        Get.snackbar(
                                                         StringManager.checkBox,
                                                          StringManager.terms,
                                                          backgroundColor:
                                                              Get.isDarkMode
                                                                  ? pinkClr
                                                                  : mainColor,
                                                          margin:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          colorText:
                                                              Colors.white,
                                                        );
                                                      }
                                                    },
                                                    txt: StringManager.signUp,
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
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ),
                      CustomContainer(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                              (route) => false);
                        },
                        status: StringManager.exitAccount,
                        textBtn: StringManager.login,
                      ),
                    ],
                  ),
                )),
          );
        },
        listener: (context, state) {});
  }
}
