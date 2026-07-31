import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_mind/core/common/models/app_models.dart';
import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/generated/l10n.dart';

class MealTypeSelectView extends StatelessWidget {
  final ValueChanged<MealType> onSelect;
  const MealTypeSelectView({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 500),
            child: Container(
              width: 84.w,
              height: 84.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: context.customAppColors.greenGradient,
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.restaurant_menu_rounded,
                color: context.customAppColors.white,
                size: 40.sp,
              ),
            ),
          ),
          SizedBox(height: 22.h),
          FadeInUp(
            delay: const Duration(milliseconds: 100),
            child: Text(
              S.of(context).chooseMealTypeTitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.font18Bold.copyWith(
                color: context.customAppColors.neutral900,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          FadeInUp(
            delay: const Duration(milliseconds: 150),
            child: Text(
              S.of(context).chooseMealTypeSubtitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.font13Regular.copyWith(
                color: context.customAppColors.neutral700,
              ),
            ),
          ),
          SizedBox(height: 32.h),
          ...List.generate(MealType.values.length, (index) {
            final type = MealType.values[index];
            return Padding(
              padding: EdgeInsets.only(bottom: 14.h),
              child: FadeInUp(
                delay: Duration(milliseconds: 200 + (index * 90)),
                duration: const Duration(milliseconds: 450),
                child: _MealTypeTile(type: type, onTap: () => onSelect(type)),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _MealTypeTile extends StatelessWidget {
  final MealType type;
  final VoidCallback onTap;
  const _MealTypeTile({required this.type, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.customAppColors.neutral100,
      borderRadius: BorderRadius.circular(20.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20.r),
        child: Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: context.customAppColors.grey200),
          ),
          child: Row(
            children: [
              Container(
                width: 52.w,
                height: 52.w,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: context.customAppColors.greenGradient,
                  ),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Icon(
                  type.icon,
                  color: context.customAppColors.white,
                  size: 26.sp,
                ),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Text(
                  type.label(context),
                  style: AppTextStyles.font16Bold.copyWith(
                    color: context.customAppColors.neutral900,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16.sp,
                color: context.customAppColors.grey400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
