import 'package:nutri_mind/core/common/models/app_models.dart';
import 'package:nutri_mind/core/common/widgets/shared_widgets.dart';
import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/core/utils/common_imports.dart';
import 'package:nutri_mind/generated/l10n.dart';

class TipCard extends StatelessWidget {
  final TipModel tip;
  const TipCard({super.key, required this.tip});

  Color _accent(BuildContext context) {
    switch (S.of(context).tipCategory(tip.categoryKey)) {
      case 'تغذية':
      case 'Nutrition':
        return context.customAppColors.primary600;

      case 'نفسية':
      case 'Mental Health':
        return context.customAppColors.info500;

      case 'رياضة':
      case 'Fitness':
        return context.customAppColors.accent700;

      default:
        return context.customAppColors.primary600;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SoftCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
              color: _accent(context).withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Icon(tip.icon, color: _accent(context), size: 24.sp),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        S.of(context).tipTitle(tip.titleKey),
                        style: AppTextStyles.font14Bold.copyWith(
                          color: context.customAppColors.neutral900,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 3.h,
                      ),
                      decoration: BoxDecoration(
                        color: _accent(context).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        S.of(context).tipCategory(tip.categoryKey),
                        style: AppTextStyles.font12Regular.copyWith(
                          color: _accent(context),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Text(
                  S.of(context).tipDescription(tip.descriptionKey),
                  style: AppTextStyles.font13Regular.copyWith(
                    color: context.customAppColors.neutral700,
                    height: 1.5,
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
