import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_mind/core/di/service_locator.dart';
import 'package:nutri_mind/core/routing/routes.dart';
import 'package:nutri_mind/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:nutri_mind/features/auth/presentation/screens/forget_password.dart';
import 'package:nutri_mind/features/auth/presentation/screens/login_screen.dart';
import 'package:nutri_mind/features/auth/presentation/screens/register_screen.dart';
import 'package:nutri_mind/features/auth/presentation/screens/verify_email_screen.dart';
import 'package:nutri_mind/features/nav_bar/main_nav_screen.dart';
import 'package:nutri_mind/features/onboarding/screens/onboarding_screen.dart';
import 'package:nutri_mind/features/splash/screens/splash_screen.dart';

abstract class AppRouter {
  static late final GoRouter router;

  static void initRouter() {
    router = GoRouter(
      initialLocation: Routes.splashScreen,
      routes: [
        GoRoute(
          path: Routes.splashScreen,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: Routes.onboardingScreen,
          builder: (context, state) => const OnboardingScreen(),
        ),
        ShellRoute(
          builder: (context, state, child) {
            return BlocProvider(
              create: (_) => getIt<AuthCubit>(),
              child: child,
            );
          },
          routes: [
            GoRoute(
              path: Routes.loginScreen,
              builder: (context, state) => LoginScreen(),
            ),
            GoRoute(
              path: Routes.registerScreen,
              builder: (context, state) => const RegisterScreen(),
            ),
            GoRoute(
              path: Routes.forgetPasswordScreen,
              builder: (context, state) => const ForgetPassword(),
            ),
            GoRoute(
              path: Routes.verifyEmailScreen,
              builder: (context, state) => const VerifyEmailScreen(),
            ),
            GoRoute(
              path: Routes.mainNavScreen,
              builder: (context, state) => const MainNavScreen(),
            ),
          ],
        ),
      ],
    );
  }
}
