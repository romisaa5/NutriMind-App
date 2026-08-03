import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart'
    show AppTextStyles;
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/core/utils/common_imports.dart';
import 'package:nutri_mind/generated/l10n.dart';

class ProfileHeaderCard extends StatelessWidget {
  const ProfileHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    const userName = 'Romisaa Fadel';
    const userEmail = 'romisaafadel@email.com';

    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.customAppColors.primary900,
            context.customAppColors.primary700,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(26.r),
        boxShadow: [
          BoxShadow(
            color: context.customAppColors.primary700.withValues(alpha: 0.3),
            blurRadius: 22,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 64.w,
                height: 64.w,
                decoration: BoxDecoration(
                  color: context.customAppColors.white.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: context.customAppColors.white.withValues(alpha: 0.4),
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.person_rounded,
                  color: context.customAppColors.white,
                  size: 32.sp,
                ),
              ),
              Positioned(
                bottom: -2,
                right: -2,
                child: Container(
                  padding: EdgeInsets.all(5.r),
                  decoration: BoxDecoration(
                    color: context.customAppColors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: context.customAppColors.primary700,
                      width: 1.5,
                    ),
                  ),
                  child: Icon(
                    Icons.edit_rounded,
                    size: 12.sp,
                    color: context.customAppColors.primary700,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: AppTextStyles.font16Bold.copyWith(
                    color: context.customAppColors.white,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  userEmail,
                  style: AppTextStyles.font12Regular.copyWith(
                    color: context.customAppColors.white.withValues(
                      alpha: 0.75,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 5.h,
                  ),
                  decoration: BoxDecoration(
                    color: context.customAppColors.white.withValues(
                      alpha: 0.15,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    s.profileEditProfile,
                    style: AppTextStyles.font12SemiBold.copyWith(
                      color: context.customAppColors.white,
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
