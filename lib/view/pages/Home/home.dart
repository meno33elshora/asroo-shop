import 'dart:convert';
import 'package:asroo/view/pages/Home/widget/body_home.dart';
import 'package:asroo/view/pages/Home/widget/header_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../logic/binding/app_binding.dart';
import '../../../models/get_home_data_model.dart';
import '../../../services/cache/cache_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    AppBinding.getApp(context).onSavedFavouriteList();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        child: Column(
          children: const [
            HeaderHome(),
            SizedBox(
              height: 15.0,
            ),
            BodyHome(),
          ],
        ),
      ),
    );
  }
}
