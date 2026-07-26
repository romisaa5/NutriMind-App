import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/core/utils/common_imports.dart';
import 'package:nutri_mind/features/onboarding/pages/onboarding_first_page.dart';
import 'package:nutri_mind/features/onboarding/pages/onboarding_second_page.dart';
import 'package:nutri_mind/features/onboarding/pages/onboarding_third_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  void _goToPage(int page) {
    _controller.animateToPage(
      page,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.customAppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: (i) => setState(() => _currentPage = i),
              children: const [
                OnboardingPage1(),
                OnboardingPage2(),
                OnboardingPage3(),
              ],
            ),

            if (_currentPage < 2) ...[
              if (Localizations.localeOf(context).languageCode == 'ar') ...[
                Positioned(
                  bottom: 28,
                  left: 10,
                  child: Container(
                    height: 60.w,
                    width: 60.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.customAppColors.primary500,
                    ),
                    child: IconButton(
                      onPressed: () {
                        if (_currentPage < 2) {
                          _goToPage(_currentPage + 1);
                        }
                      },
                      icon: const Icon(Icons.arrow_forward_ios_rounded),
                      color: Colors.white,
                      iconSize: 24.sp,
                    ),
                  ),
                ),
              ] else ...[
                Positioned(
                  bottom: 28,
                  right: 10,
                  child: Container(
                    height: 60.w,
                    width: 60.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.customAppColors.primary500,
                    ),
                    child: IconButton(
                      onPressed: () {
                        if (_currentPage < 2) {
                          _goToPage(_currentPage + 1);
                        }
                      },
                      icon: const Icon(Icons.arrow_forward_ios_rounded),
                      color: Colors.white,
                      iconSize: 24.sp,
                    ),
                  ),
                ),
              ],
            ],
            Positioned(
              bottom: 35.h,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  final active = index == _currentPage;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    width: active ? 22.w : 8.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      color: active
                          ? context.customAppColors.primary500
                          : context.customAppColors.primary500.withValues(
                              alpha: 0.25,
                            ),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
