import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import 'package:nutri_mind/core/common/models/app_models.dart';
import 'package:nutri_mind/core/common/widgets/shared_widgets.dart';
import 'package:nutri_mind/core/helpers/extensions.dart';
import 'package:nutri_mind/core/theme/app_colors/light_app_colors.dart';
import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import 'package:nutri_mind/generated/l10n.dart';

class TipsScreen extends StatefulWidget {
  const TipsScreen({super.key});

  @override
  State<TipsScreen> createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  String _selectedCategory = 'all';

  final List<String> _categories = [
    'all',
    'nutritionCategory',
    'mentalCategory',
    'sportCategory',
  ];

  @override
  Widget build(BuildContext context) {
    final tips = _selectedCategory == 'all'
        ? DummyData.tips
        : DummyData.tips
              .where((t) => t.categoryKey == _selectedCategory)
              .toList();
    return Scaffold(
      backgroundColor: LightAppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // ---------- Header ----------
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 6.h),
              child: FadeInDown(
                child: Text(
                  S.of(context).tipsTitle,
                  style: AppTextStyles.font20Bold.copyWith(
                    color: LightAppColors.neutral900,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 14.h),
              child: FadeInDown(
                delay: const Duration(milliseconds: 100),
                child: Text(
                  S.of(context).tipsSubtitle,
                  style: AppTextStyles.font13Regular.copyWith(
                    color: LightAppColors.grey600,
                  ),
                ),
              ),
            ),

            // ---------- Category Chips ----------
            SizedBox(
              height: 42.h,
              child: FadeInLeft(
                delay: const Duration(milliseconds: 150),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  itemCount: _categories.length,
                  separatorBuilder: (_, __) => SizedBox(width: 8.w),
                  itemBuilder: (context, i) {
                    final cat = _categories[i];
                    final selected = cat == _selectedCategory;
                    return GestureDetector(
                      onTap: () => setState(() => _selectedCategory = cat),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        padding: EdgeInsets.symmetric(
                          horizontal: 18.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color: selected
                              ? LightAppColors.primary500
                              : LightAppColors.white,
                          borderRadius: BorderRadius.circular(22.r),
                          border: Border.all(
                            color: selected
                                ? LightAppColors.primary500
                                : LightAppColors.grey200,
                          ),
                        ),
                        child: Text(
                          cat == 'all'
                              ? S.of(context).all
                              : S.of(context).tipCategory(cat),
                          style: AppTextStyles.font13Regular.copyWith(
                            color: selected
                                ? LightAppColors.white
                                : LightAppColors.grey700,
                            fontWeight: selected
                                ? FontWeight.w600
                                : FontWeight.w400,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            SizedBox(height: 16.h),

            // ---------- Tips List ----------
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 24.h),
                itemCount: tips.length,
                itemBuilder: (context, index) {
                  final tip = tips[index];
                  return FadeInUp(
                    delay: Duration(milliseconds: 100 * index),
                    duration: const Duration(milliseconds: 450),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 14.h),
                      child: _TipCard(tip: tip),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TipCard extends StatelessWidget {
  final TipModel tip;
  const _TipCard({required this.tip});

  Color _accent(BuildContext context) {
    switch (S.of(context).tipCategory(tip.categoryKey)) {
      case 'تغذية':
      case 'Nutrition':
        return LightAppColors.primary600;

      case 'نفسية':
      case 'Mental Health':
        return LightAppColors.info500;

      case 'رياضة':
      case 'Fitness':
        return LightAppColors.accent700;

      default:
        return LightAppColors.primary600;
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
                          color: LightAppColors.neutral900,
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
                    color: LightAppColors.grey600,
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
