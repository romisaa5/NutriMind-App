import 'package:nutri_mind/core/common/widgets/app_images.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/features/onboarding/widgets/onboarding_header.dart';
import 'package:nutri_mind/features/onboarding/widgets/wave_background.dart';
import 'package:nutri_mind/generated/l10n.dart';
import '../../../core/utils/common_imports.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned(bottom: 0, left: 0, right: 0, child: WaveBackground()),
        Column(
          children: [
            OnboardingHeader(
              titleLine1: S.of(context).onboarding2_title_line1,
              titleLine2: S.of(context).onboarding2_title_line2,
              description: S.of(context).onboarding2_description,
            ),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: 340,
                  height: 360,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      const _PhoneMockup(),
                      Positioned(
                        top: -30,
                        left: -10,
                        child: _InfoChip(
                          icon: Icons.local_fire_department_rounded,
                          iconColor: const Color(0xFFFF7043),
                          value: '520',
                          label: S.of(context).calories,
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        left: -10,
                        child: _InfoChip(
                          icon: Icons.eco_rounded,
                          iconColor: context.customAppColors.primary500,
                          value: '32g',
                          label: S.of(context).protein,
                        ),
                      ),
                      Positioned(
                        top: 20,
                        right: -10,
                        child: _InfoChip(
                          icon: Icons.grass_rounded,
                          iconColor: const Color(0xFF8BC34A),
                          value: '48g',
                          label: S.of(context).carbs,
                        ),
                      ),
                      Positioned(
                        bottom: -30,
                        right: -10,
                        child: _InfoChip(
                          icon: Icons.water_drop_rounded,
                          iconColor: const Color(0xFF29B6F6),
                          value: '18g',
                          label: S.of(context).fat,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ],
    );
  }
}

class _PhoneMockup extends StatelessWidget {
  const _PhoneMockup();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.w,
      height: 380.h,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(28.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(28),
        child: AppImages(
          imagePath: 'scan.jpeg',
          fit: BoxFit.cover,
          width: 170.w,
          height: 380.h,
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String value;
  final String label;

  const _InfoChip({
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 84,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: iconColor, size: 22),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: context.customAppColors.neutral900,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: context.customAppColors.neutral700,
            ),
          ),
        ],
      ),
    );
  }
}
