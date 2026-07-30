import 'package:nutri_mind/core/common/models/app_models.dart';
import 'package:nutri_mind/core/common/widgets/shared_widgets.dart';
import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/core/utils/common_imports.dart';
import 'package:nutri_mind/features/home/presentation/screens/meal_details_screen.dart';
import 'package:nutri_mind/features/home/presentation/widgets/mini_macro_chip.dart';
import 'package:nutri_mind/features/scan/presentation/screens/scan_screen.dart';
import 'package:nutri_mind/generated/l10n.dart';

class MealCard extends StatelessWidget {
  final MealModel meal;
  const MealCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return SoftCard(
      onTap: () {
        if (meal.isLogged) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => MealDetailsScreen(meal: meal)),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ScanScreen()),
          );
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 56.w,
                height: 56.w,
                decoration: BoxDecoration(
                  gradient: meal.isLogged
                      ? LinearGradient(
                          colors: context.customAppColors.greenGradient,
                        )
                      : null,
                  color: meal.isLogged
                      ? null
                      : context.customAppColors.neutral100,
                  borderRadius: BorderRadius.circular(18.r),
                ),
                child: Icon(
                  meal.type.icon,
                  color: meal.isLogged
                      ? context.customAppColors.white
                      : context.customAppColors.neutral700,
                  size: 26.sp,
                ),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).mealLabel(meal.type.label(context)),
                      style: AppTextStyles.font14Bold.copyWith(
                        color: context.customAppColors.neutral900,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      meal.isLogged
                          ? meal.name ?? ''
                          : S.of(context).noMealLogged,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.font12Regular.copyWith(
                        color: context.customAppColors.neutral700,
                      ),
                    ),
                  ],
                ),
              ),
              if (meal.isLogged)
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: context.customAppColors.primary100,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    '${S.of(context).calories} : ${meal.calories}',
                    style: AppTextStyles.font12SemiBold.copyWith(
                      color: context.customAppColors.primary700,
                    ),
                  ),
                )
              else
                Container(
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    color: context.customAppColors.primary500,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(
                    Icons.add_rounded,
                    color: context.customAppColors.white,
                    size: 18.sp,
                  ),
                ),
            ],
          ),
          if (meal.isLogged) ...[
            SizedBox(height: 14.h),
            Divider(color: context.customAppColors.grey100, height: 1),
            SizedBox(height: 12.h),
            Row(
              children: [
                MiniMacroChip(
                  label: S.of(context).protein,
                  value: meal.protein ?? 0,
                  color: context.customAppColors.info700,
                ),
                SizedBox(width: 8.w),
                MiniMacroChip(
                  label: S.of(context).carbs,
                  value: meal.carbs ?? 0,
                  color: context.customAppColors.warning500,
                ),
                SizedBox(width: 8.w),
                MiniMacroChip(
                  label: S.of(context).fat,
                  value: meal.fat ?? 0,
                  color: context.customAppColors.accent700,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
