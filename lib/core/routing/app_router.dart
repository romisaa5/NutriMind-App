import 'package:go_router/go_router.dart';
import 'package:nutri_mind/core/routing/routes.dart';
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
      ],
    );
  }
}
