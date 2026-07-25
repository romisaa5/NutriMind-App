import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/features/chatbot/presentation/screens/chatbot_screen.dart';
import 'package:nutri_mind/features/home/presentation/screens/home_screen.dart';
import 'package:nutri_mind/features/profile/presentation/screens/profile_screen.dart';
import 'package:nutri_mind/features/scan/presentation/screens/scan_screen.dart';
import 'package:nutri_mind/features/tips/presentation/screens/tips_screen.dart';
import 'package:nutri_mind/generated/l10n.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  int _index = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    TipsScreen(),
    ScanScreen(),
    ChatbotScreen(),
    ProfileScreen(),
  ];

  List<_NavItem> _items(BuildContext context) {
    return [
      _NavItem(icon: Icons.home_rounded, label: S.of(context).home),
      _NavItem(icon: Icons.lightbulb_rounded, label: S.of(context).tips),
      _NavItem(
        icon: Icons.center_focus_strong_rounded,
        label: S.of(context).scan,
      ),
      _NavItem(icon: Icons.smart_toy_rounded, label: S.of(context).chat),
      _NavItem(icon: Icons.person_rounded, label: S.of(context).profile),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.customAppColors.background,
      body: IndexedStack(index: _index, children: _screens),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 12.h),
          child: FadeInUp(
            duration: const Duration(milliseconds: 500),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              decoration: BoxDecoration(
                color: context.customAppColors.neutral100,
                borderRadius: BorderRadius.circular(26.r),
                boxShadow: [
                  BoxShadow(
                    color: context.customAppColors.neutral900.withValues(
                      alpha: 0.08,
                    ),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(_items(context).length, (i) {
                  final selected = i == _index;
                  final item = _items(context)[i];
                  final bool isCenterScan = i == 2;
                  if (isCenterScan) {
                    return GestureDetector(
                      onTap: () => setState(() => _index = i),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        width: 56.w,
                        height: 56.w,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: context.customAppColors.greenGradient,
                          ),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: context.customAppColors.primary500
                                  .withValues(alpha: 0.4),
                              blurRadius: 14,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Icon(
                          item.icon,
                          color: context.customAppColors.white,
                          size: 24.sp,
                        ),
                      ),
                    );
                  }
                  return GestureDetector(
                    onTap: () => setState(() => _index = i),
                    behavior: HitTestBehavior.opaque,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            item.icon,
                            color: selected
                                ? context.customAppColors.primary500
                                : context.customAppColors.grey400,
                            size: 22.sp,
                          ),
                          SizedBox(height: 3.h),
                          Text(
                            item.label,
                            style: AppTextStyles.font12Regular.copyWith(
                              color: selected
                                  ? context.customAppColors.primary700
                                  : context.customAppColors.grey400,
                              fontWeight: selected
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;
  const _NavItem({required this.icon, required this.label});
}
