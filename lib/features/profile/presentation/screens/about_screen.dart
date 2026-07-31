import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_mind/core/common/widgets/app_images.dart';
import 'package:nutri_mind/core/common/widgets/shared_widgets.dart';
import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/generated/l10n.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  static const String _appVersion = '1.0.0';

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final colors = context.customAppColors;

    final features = [
      (Icons.camera_alt_rounded, s.aboutFeatureScan),
      (Icons.history_rounded, s.aboutFeatureHistory),
      (Icons.lightbulb_rounded, s.aboutFeatureTips),
      (Icons.smart_toy_rounded, s.aboutFeatureChat),
    ];

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        backgroundColor: colors.background,
        elevation: 0,
        centerTitle: true,
        title: Text(
          s.aboutTitle,
          style: AppTextStyles.font16Bold.copyWith(color: colors.neutral900),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 40.h),
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 500),
            child: Center(
              child: Container(
                width: 92.w,
                height: 92.w,
                decoration: BoxDecoration(
                  color: colors.primary100,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: colors.primary500.withValues(alpha: 0.05),
                      blurRadius: 24,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: AppImages(
                  imagePath: 'app_image.png',
                  width: 48.w,
                  height: 48.h,
                ),
              ),
            ),
          ),
          SizedBox(height: 18.h),
          FadeInUp(
            delay: const Duration(milliseconds: 100),
            child: Text(
              'NutriMind',
              textAlign: TextAlign.center,
              style: AppTextStyles.font24Bold.copyWith(
                color: colors.neutral900,
              ),
            ),
          ),
          SizedBox(height: 6.h),
          FadeInUp(
            delay: const Duration(milliseconds: 150),
            child: Text(
              s.appTagline,
              textAlign: TextAlign.center,
              style: AppTextStyles.font13Regular.copyWith(
                color: colors.neutral700,
              ),
            ),
          ),
          SizedBox(height: 14.h),
          FadeInUp(
            delay: const Duration(milliseconds: 180),
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: colors.primary100,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  '${s.aboutVersionLabel} $_appVersion',
                  style: AppTextStyles.font12SemiBold.copyWith(
                    color: colors.primary700,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 28.h),

          // ---------- الوصف ----------
          FadeInUp(
            delay: const Duration(milliseconds: 220),
            child: SoftCard(
              child: Text(
                s.aboutDescription,
                style: AppTextStyles.font14Regular.copyWith(
                  color: colors.neutral800,
                  height: 1.7,
                ),
              ),
            ),
          ),

          SizedBox(height: 26.h),

          // ---------- المميزات ----------
          FadeInLeft(
            delay: const Duration(milliseconds: 250),
            child: Text(
              s.aboutFeaturesTitle,
              style: AppTextStyles.font16Bold.copyWith(
                color: colors.neutral900,
              ),
            ),
          ),
          SizedBox(height: 12.h),
          ...List.generate(features.length, (index) {
            final (icon, label) = features[index];
            return Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: FadeInUp(
                delay: Duration(milliseconds: 280 + (index * 80)),
                duration: const Duration(milliseconds: 400),
                child: SoftCard(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 12.h,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.w,
                        decoration: BoxDecoration(
                          color: colors.primary100,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Icon(
                          icon,
                          color: colors.primary700,
                          size: 20.sp,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Text(
                          label,
                          style: AppTextStyles.font13Regular.copyWith(
                            color: colors.neutral800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),

          SizedBox(height: 26.h),

          // ---------- المطوّرة ----------
          FadeInLeft(
            delay: const Duration(milliseconds: 300),
            child: Text(
              s.aboutDeveloperSectionTitle,
              style: AppTextStyles.font16Bold.copyWith(
                color: colors.neutral900,
              ),
            ),
          ),
          SizedBox(height: 12.h),
          FadeInUp(
            delay: const Duration(milliseconds: 350),
            child: SoftCard(
              child: Row(
                children: [
                  Container(
                    width: 52.w,
                    height: 52.w,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: colors.greenGradient),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person_rounded,
                      color: colors.white,
                      size: 26.sp,
                    ),
                  ),
                  SizedBox(width: 14.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          s.developerName,
                          style: AppTextStyles.font14Bold.copyWith(
                            color: colors.neutral900,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          s.aboutDeveloperRole,
                          style: AppTextStyles.font12Regular.copyWith(
                            color: colors.grey600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}
