import 'package:nutri_mind/core/helpers/enums.dart';
import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/core/utils/common_imports.dart';

class MealTypeTile extends StatelessWidget {
  final MealType type;
  final VoidCallback onTap;
  const MealTypeTile({super.key, required this.type, required this.onTap});

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
