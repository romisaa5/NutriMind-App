import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_mind/core/common/models/app_models.dart';
import 'package:nutri_mind/core/helpers/extensions.dart';
import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/generated/l10n.dart';

class IdleView extends StatelessWidget {
  final MealType mealType;
  final VoidCallback onCameraTap;
  final VoidCallback onGalleryTap;
  final VoidCallback onChangeMealType;

  const IdleView({
    super.key,
    required this.mealType,
    required this.onCameraTap,
    required this.onGalleryTap,
    required this.onChangeMealType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          70.h.ph,
          FadeInDown(
            duration: const Duration(milliseconds: 400),
            child: GestureDetector(
              onTap: onChangeMealType,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: context.customAppColors.primary100,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      mealType.icon,
                      size: 16.sp,
                      color: context.customAppColors.primary700,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      mealType.label(context),
                      style: AppTextStyles.font12SemiBold.copyWith(
                        color: context.customAppColors.primary700,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Icon(
                      Icons.edit_rounded,
                      size: 14.sp,
                      color: context.customAppColors.primary700,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 28.h),
          ZoomIn(
            duration: const Duration(milliseconds: 500),
            child: Container(
              width: 260.w,
              height: 300.h,
              decoration: BoxDecoration(
                color: context.customAppColors.primary100.withValues(
                  alpha: 0.5,
                ),
                borderRadius: BorderRadius.circular(28.r),
                border: Border.all(
                  color: context.customAppColors.primary300,
                  width: 2,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.photo_camera_outlined,
                    size: 64.sp,
                    color: context.customAppColors.primary600,
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    S.of(context).scanCaptureHint,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.font12SemiBold.copyWith(
                      color: context.customAppColors.primary800,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 36.h),
          FadeInUp(
            delay: const Duration(milliseconds: 200),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onGalleryTap,
                    icon: Icon(
                      Icons.image_outlined,
                      color: context.customAppColors.grey700,
                      size: 18.sp,
                    ),
                    label: Text(
                      S.of(context).chooseFromGallery,
                      style: AppTextStyles.font12SemiBold.copyWith(
                        color: context.customAppColors.grey700,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      side: BorderSide(color: context.customAppColors.grey300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Pulse(
                    infinite: false,
                    duration: const Duration(seconds: 2),
                    child: ElevatedButton.icon(
                      onPressed: onCameraTap,
                      icon: Icon(
                        Icons.camera_alt_rounded,
                        color: context.customAppColors.white,
                        size: 18.sp,
                      ),
                      label: Text(
                        S.of(context).takePhoto,
                        style: AppTextStyles.font12Bold.copyWith(
                          color: context.customAppColors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.customAppColors.primary500,
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
