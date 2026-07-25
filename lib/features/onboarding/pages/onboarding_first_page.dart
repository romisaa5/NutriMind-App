import 'package:nutri_mind/core/common/widgets/app_images.dart';
import 'package:nutri_mind/core/utils/common_imports.dart';
import 'package:nutri_mind/features/onboarding/widgets/onboarding_header.dart';
import 'package:nutri_mind/features/onboarding/widgets/wave_background.dart';
import 'package:nutri_mind/generated/l10n.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned(bottom: 0, left: 0, right: 0, child: WaveBackground()),
        Column(
          children: [
            OnboardingHeader(
              titleLine1: S.of(context).onboarding1_title_line1,
              titleLine2: S.of(context).onboarding1_title_line2,
              description: S.of(context).onboarding1_description,
            ),
            40.h.ph,
            Center(
              child: AppImages(
                imagePath: 'food.jpg',
                fit: BoxFit.cover,
                height: 400.h,
                width: 300,
              ),
            ),
            SizedBox(height: 100.h),
          ],
        ),
      ],
    );
  }
}
