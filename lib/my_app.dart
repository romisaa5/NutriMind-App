import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_mind/core/common/screens/no_internet_screen.dart';
import 'package:nutri_mind/core/routing/app_router.dart';
import 'package:nutri_mind/features/profile/presentation/cubit/local_cubit.dart';
import 'core/theme/theme_data/dark_them_data.dart';
import 'core/theme/theme_data/light_theme_data.dart';
import 'core/theme/theme_manager/theme_cubit.dart';
import 'generated/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => ThemeCubit()),
            BlocProvider(create: (_) => LocaleCubit()),
          ],
          child: BlocBuilder<LocaleCubit, Locale>(
            builder: (context, state) {
              return BlocBuilder<ThemeCubit, ThemeMode>(
                builder: (context, newMode) {
                  return ConnectivityWrapper(
                    child: MaterialApp.router(
                      debugShowCheckedModeBanner: false,
                      theme: getLightTheme(context),
                      darkTheme: getDarkTheme(context),
                      themeMode: newMode,
                      locale: state,
                      supportedLocales: S.delegate.supportedLocales,
                      localizationsDelegates: const [
                        S.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      routerConfig: AppRouter.router,
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
