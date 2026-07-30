import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/generated/l10n.dart';

Future<bool?> showLogoutConfirmationDialog(BuildContext context) {
  return showGeneralDialog<bool>(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'logout_confirm',
    barrierColor: Colors.black.withValues(alpha: 0.55),
    transitionDuration: const Duration(milliseconds: 320),
    pageBuilder: (context, anim1, anim2) => const SizedBox.shrink(),
    transitionBuilder: (context, anim1, anim2, child) {
      return Center(
        child: ZoomIn(
          duration: const Duration(milliseconds: 320),
          child: const _LogoutDialogContent(),
        ),
      );
    },
  );
}

class _LogoutDialogContent extends StatelessWidget {
  const _LogoutDialogContent();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 28.w),
      child: Container(
        padding: EdgeInsets.fromLTRB(24.w, 28.h, 24.w, 20.h),
        decoration: BoxDecoration(
          color: context.customAppColors.background,
          borderRadius: BorderRadius.circular(26.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 30,
              offset: const Offset(0, 14),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 64.w,
              height: 64.w,
              decoration: BoxDecoration(
                color: context.customAppColors.error500.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.logout_rounded,
                color: context.customAppColors.error500,
                size: 30.sp,
              ),
            ),
            SizedBox(height: 18.h),
            Text(
              s.logoutConfirmTitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.font16Bold.copyWith(
                color: context.customAppColors.neutral900,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              s.logoutConfirmMessage,
              textAlign: TextAlign.center,
              style: AppTextStyles.font13Regular.copyWith(
                color: context.customAppColors.neutral700,
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                Expanded(
                  child: _DialogButton(
                    label: s.cancel,
                    onTap: () => Navigator.of(context).pop(false),
                    background: context.customAppColors.neutral100,
                    textColor: context.customAppColors.neutral800,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _DialogButton(
                    label: s.profileLogoutTitle,
                    onTap: () => Navigator.of(context).pop(true),
                    background: context.customAppColors.error500,
                    textColor: context.customAppColors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DialogButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color background;
  final Color textColor;

  const _DialogButton({
    required this.label,
    required this.onTap,
    required this.background,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: background,
      borderRadius: BorderRadius.circular(14.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14.r),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 13.h),
          child: Center(
            child: Text(
              label,
              style: AppTextStyles.font14SemiBold.copyWith(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
