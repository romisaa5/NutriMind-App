import 'dart:typed_data';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/generated/l10n.dart';

class ScanningView extends StatelessWidget {
  final AnimationController lineController;
  final AnimationController pulseController;
  final Uint8List? imageBytes;

  const ScanningView({
    super.key,
    required this.lineController,
    required this.pulseController,
    this.imageBytes,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 260.w,
                  height: 300.h,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: context.customAppColors.grey100,
                    borderRadius: BorderRadius.circular(28.r),
                  ),
                  child: imageBytes != null
                      ? Image.memory(imageBytes!, fit: BoxFit.cover)
                      : Icon(
                          Icons.restaurant_rounded,
                          size: 90.sp,
                          color: context.customAppColors.grey300,
                        ),
                ),
                AnimatedBuilder(
                  animation: lineController,
                  builder: (context, _) {
                    return Positioned(
                      top: 10 + (lineController.value * 280),
                      child: Container(
                        width: 240.w,
                        height: 3.h,
                        decoration: BoxDecoration(
                          color: context.customAppColors.primary500,
                          borderRadius: BorderRadius.circular(4.r),
                          boxShadow: [
                            BoxShadow(
                              color: context.customAppColors.primary500
                                  .withValues(alpha: 0.6),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: pulseController,
                  builder: (context, _) {
                    final double scale = 0.9 + (pulseController.value * 0.15);
                    return Positioned(
                      bottom: 16.h,
                      child: Transform.scale(
                        scale: scale,
                        child: Container(
                          padding: EdgeInsets.all(10.r),
                          decoration: BoxDecoration(
                            color: context.customAppColors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: context.customAppColors.neutral900
                                    .withValues(alpha: 0.1),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.auto_awesome_rounded,
                            color: context.customAppColors.primary600,
                            size: 20.sp,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 32.h),
            FadeIn(
              child: Text(
                S.of(context).analyzingMessage,
                style: AppTextStyles.font16SemiBold.copyWith(
                  color: context.customAppColors.neutral900,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              S.of(context).analyzingSubtitle,
              style: AppTextStyles.font13Regular.copyWith(
                color: context.customAppColors.grey600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
