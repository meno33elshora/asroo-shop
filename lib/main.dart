import 'package:asroo/logic/controller/bloc/app/app_cubit.dart';
import 'package:asroo/logic/controller/bloc/auth/auth_cubit.dart';
import 'package:asroo/routes/routes.dart';
import 'package:asroo/services/cache/cache_helper.dart';
import 'package:asroo/services/cache/theme_controller.dart';
import 'package:asroo/services/network/remote_data_source.dart';
import 'package:asroo/utils/string_manager.dart';
import 'package:asroo/utils/theme.dart';
import 'package:asroo/view/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';
import 'language/lang_controller.dart';
import 'logic/controller/bloc/observer/blocObserver.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await RemoteDataSource.initialDio();
  await GetStorage.init();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(  const MyApp());
}

class MyApp extends StatelessWidget {
    // bool isDark = false;
 const  MyApp({super.key ,  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => AppCubit()..getData()),
      ],
      child: GetMaterialApp(
        title: StringManager.asrooShop,
        debugShowCheckedModeBanner: false,
        theme:  ThemesApp.light,
        darkTheme: ThemesApp.dark,
        themeMode: ThemeController().themeDataGet,
        // locale:  Locale(ene),
        locale:  Locale(CacheHelper.getData(key: 'lang').toString()),
        fallbackLocale:  Locale(ene),
        translations: LangController(),
        home: const SplashScreen(),
        initialRoute: Routes.splashScreen,
        getPages: AppRoutes.routes,
      ),
    );
  }
}
