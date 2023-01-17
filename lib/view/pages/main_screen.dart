import 'package:asroo/logic/binding/app_binding.dart';
import 'package:asroo/logic/controller/bloc/app/app_cubit.dart';
import 'package:asroo/utils/string_manager.dart';
import 'package:asroo/utils/theme.dart';
import 'package:asroo/view/components/text_widget.dart';
import 'package:badges/badges.dart';
import 'package:asroo/view/pages/setting/setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:persistent_bottom_nav_bar/persistent_tab_view.dart";
import 'package:get/get.dart';
import 'Cart/cart.dart';
import 'Home/home.dart';
import 'categories/categories.dart';
import 'favourite.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        backgroundColor: Get.isDarkMode ? black : Colors.white,
        appBar: AppBar(
          backgroundColor:
              Get.isDarkMode ? pinkClr : context.theme.primaryColor,
          centerTitle: true,
          elevation: 0.0,
          title: const TextWidget(
            txt: StringManager.asrooShop,
            fontSize: 24,
            color: Colors.white,
            notFontFamily: true,
            fontWeight: FontWeight.w600,
          ),
          actions: [
            BlocBuilder<AppCubit, AppState>(
              builder: (context, state) => Badge(
                position: BadgePosition.topEnd(top: 1, end: 3),
                animationDuration: const Duration(milliseconds: 300),
                animationType: BadgeAnimationType.slide,
                badgeColor: Colors.white,
                badgeContent: Text(
                  AppBinding.getApp(context).quantity().toString(),
                  style: TextStyle(
                      color: Get.isDarkMode ? pinkClr : mainColor,
                      fontWeight: FontWeight.bold),
                ),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Cart()));
                    },
                    icon: Icon(
                      CupertinoIcons.cart,
                      color: Get.isDarkMode ? Colors.white : Colors.white,
                    )),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0.0,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          selectedItemColor: Get.isDarkMode ? pinkClr : mainColor,
          unselectedItemColor: purple,
          backgroundColor: Colors.white,
          items:  [
            BottomNavigationBarItem(
                icon: const Icon(
                  CupertinoIcons.house_alt_fill,
                  color: mainColor,
                ),
                label: StringManager.home,
                backgroundColor:Get.isDarkMode ?  black : Colors.white),
            const  BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.app_badge,
                  color: Colors.redAccent,
                ),
                label: StringManager.categories),
            const BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.heart_fill),
                label: StringManager.favourite),
            const BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.settings,
                  color: languageSettings,
                ),
                label: StringManager.settings),
          ],
        ),
        body: _buildScreens[currentIndex],
        // PersistentTabView(
        //   context,
        //   controller: PersistentTabController(),
        //   screens: ,
        //   items: _navBarsItems(),
        //   confineInSafeArea: true,
        //   // backgroundColor: Colors.white,
        //   backgroundColor: Get.isDarkMode ? black : Colors.white,
        //   handleAndroidBackButtonPress: true,
        //   resizeToAvoidBottomInset: true,
        //   stateManagement: true,
        //   hideNavigationBarWhenKeyboardShows: true,
        //   decoration: NavBarDecoration(
        //     borderRadius: BorderRadius.circular(10.0),
        //     colorBehindNavBar: Get.isDarkMode ? black : Colors.white,
        //   ),
        //   popAllScreensOnTapOfSelectedTab: true,
        //   popActionScreens: PopActionScreensType.all,
        //   itemAnimationProperties: const ItemAnimationProperties(
        //     duration: Duration(milliseconds: 200),
        //     curve: Curves.decelerate,
        //   ),
        //   screenTransitionAnimation: const ScreenTransitionAnimation(
        //     animateTabTransition: true,
        //     curve: Curves.decelerate,
        //     duration: Duration(milliseconds: 200),
        //   ),
        //   navBarStyle: NavBarStyle.style1,
        // ),
      ),
    );
  }

  final List<Widget> _buildScreens = [
    const HomeScreen(),
    Categories(),
    const Favourite(),
    Setting(),
  ];

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: (StringManager.home),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.activeBlue,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.app_badge_fill),
        title: (StringManager.categories),
        activeColorPrimary: CupertinoColors.activeGreen,
        inactiveColorPrimary: CupertinoColors.activeGreen,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.heart_fill),
        title: (StringManager.favourite),
        activeColorPrimary: CupertinoColors.destructiveRed,
        inactiveColorPrimary: CupertinoColors.destructiveRed,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.settings),
        title: (StringManager.settings),
        activeColorPrimary: purple,
        inactiveColorPrimary: purple,
      ),
    ];
  }
}
