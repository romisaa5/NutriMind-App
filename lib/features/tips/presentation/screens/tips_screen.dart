import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import 'package:nutri_mind/core/common/models/app_models.dart';
import 'package:nutri_mind/core/helpers/extensions.dart';
import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/features/tips/presentation/widgets/tip_card.dart';
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
    'sleepCategory',
    'habitsCategory',
  ];

  @override
  Widget build(BuildContext context) {
    final tips = _selectedCategory == 'all'
        ? DummyData.tips
        : DummyData.tips
              .where((t) => t.categoryKey == _selectedCategory)
              .toList();
    return Scaffold(
      backgroundColor: context.customAppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 6.h),
              child: FadeInDown(
                child: Text(
                  S.of(context).tipsTitle,
                  style: AppTextStyles.font20Bold.copyWith(
                    color: context.customAppColors.neutral900,
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
                    color: context.customAppColors.neutral700,
                  ),
                ),
              ),
            ),
            10.h.ph,
            SizedBox(
              height: 42.h,
              child: FadeInLeft(
                delay: const Duration(milliseconds: 150),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  itemCount: _categories.length,
                  separatorBuilder: (_, a) => SizedBox(width: 8.w),
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
                              ? context.customAppColors.primary500
                              : context.customAppColors.neutral100,
                          borderRadius: BorderRadius.circular(22.r),
                          border: Border.all(
                            color: selected
                                ? context.customAppColors.primary500
                                : Colors.transparent,
                          ),
                        ),
                        child: Text(
                          cat == 'all'
                              ? S.of(context).all
                              : S.of(context).tipCategory(cat),
                          style: AppTextStyles.font13Regular.copyWith(
                            color: selected
                                ? context.customAppColors.white
                                : context.customAppColors.neutral700,
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
            16.h.ph,
            Expanded(
              child: tips.isEmpty
                  ? Center(
                      child: Text(
                        S.of(context).noTipsInCategory,
                        style: AppTextStyles.font13Regular.copyWith(
                          color: context.customAppColors.neutral700,
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 24.h),
                      itemCount: tips.length,
                      itemBuilder: (context, index) {
                        final tip = tips[index];
                        return FadeInUp(
                          delay: Duration(milliseconds: 100 * index),
                          duration: const Duration(milliseconds: 450),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 14.h),
                            child: TipCard(tip: tip),
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
