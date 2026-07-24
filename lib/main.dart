import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_mind/core/di/service_locator.dart';
import 'package:nutri_mind/core/helpers/bloc_observer.dart';
import 'package:nutri_mind/core/routing/app_router.dart';
import 'core/helpers/shared_pref_helper.dart';
import 'my_app.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await initServiceLocator();
  await ScreenUtil.ensureScreenSize();
  AppRouter.initRouter();
  await SharedPrefHelper.init();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}
