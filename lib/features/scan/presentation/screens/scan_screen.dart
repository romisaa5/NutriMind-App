import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import 'package:nutri_mind/core/common/widgets/shared_widgets.dart';
import 'package:nutri_mind/core/theme/app_colors/light_app_colors.dart';
import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import 'package:nutri_mind/generated/l10n.dart';

enum ScanState { idle, scanning, result }

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> with TickerProviderStateMixin {
  ScanState _state = ScanState.idle;
  late final AnimationController _lineController;
  late final AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _lineController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    )..repeat(reverse: true);
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _lineController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _startScan() {
    setState(() => _state = ScanState.scanning);
    Future.delayed(const Duration(milliseconds: 2200), () {
      if (mounted) setState(() => _state = ScanState.result);
    });
  }

  void _reset() => setState(() => _state = ScanState.idle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightAppColors.background,
      appBar: AppBar(
        backgroundColor: LightAppColors.background,
        elevation: 0,
        centerTitle: true,
        title: Text(
          S.of(context).scanTitle,
          style: AppTextStyles.font16Bold.copyWith(
            color: LightAppColors.neutral900,
          ),
        ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        child: switch (_state) {
          ScanState.idle => _IdleView(
            key: const ValueKey('idle'),
            onScan: _startScan,
          ),
          ScanState.scanning => _ScanningView(
            key: const ValueKey('scanning'),
            lineController: _lineController,
            pulseController: _pulseController,
          ),
          ScanState.result => _ResultView(
            key: const ValueKey('result'),
            onReset: _reset,
          ),
        },
      ),
    );
  }
}

class _IdleView extends StatelessWidget {
  final VoidCallback onScan;
  const _IdleView({super.key, required this.onScan});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ZoomIn(
            duration: const Duration(milliseconds: 500),
            child: Container(
              width: 260.w,
              height: 300.h,
              decoration: BoxDecoration(
                color: LightAppColors.primary100.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(28.r),
                border: Border.all(
                  color: LightAppColors.primary300,
                  width: 2,
                  style: BorderStyle.solid,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.photo_camera_outlined,
                    size: 64.sp,
                    color: LightAppColors.primary600,
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    s.scanIdleHint,
                    style: AppTextStyles.font14SemiBold.copyWith(
                      color: LightAppColors.primary800,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 36.h),
          FadeInUp(
            delay: const Duration(milliseconds: 200),
            child: Text(
              s.scanIdleDescription,
              textAlign: TextAlign.center,
              style: AppTextStyles.font14Regular.copyWith(
                color: LightAppColors.grey600,
                height: 1.6,
              ),
            ),
          ),
          SizedBox(height: 32.h),
          FadeInUp(
            delay: const Duration(milliseconds: 300),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _RoundIconButton(
                  icon: Icons.image_outlined,
                  onTap: onScan,
                  background: LightAppColors.grey100,
                  iconColor: LightAppColors.grey700,
                ),
                SizedBox(width: 20.w),
                Pulse(
                  infinite: true,
                  duration: const Duration(seconds: 2),
                  child: _RoundIconButton(
                    icon: Icons.camera_alt_rounded,
                    onTap: onScan,
                    background: LightAppColors.primary500,
                    iconColor: LightAppColors.white,
                    size: 72,
                  ),
                ),
                SizedBox(width: 20.w),
                _RoundIconButton(
                  icon: Icons.flash_on_rounded,
                  onTap: () {},
                  background: LightAppColors.grey100,
                  iconColor: LightAppColors.grey700,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color background;
  final Color iconColor;
  final double size;

  const _RoundIconButton({
    required this.icon,
    required this.onTap,
    required this.background,
    required this.iconColor,
    this.size = 52,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: background,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Padding(
          padding: EdgeInsets.all(size / 4.5),
          child: Icon(icon, color: iconColor, size: (size / 2.2).sp),
        ),
      ),
    );
  }
}

/// ---------------- Scanning: بيتبعت للـ AI ويتحلل ----------------
class _ScanningView extends StatelessWidget {
  final AnimationController lineController;
  final AnimationController pulseController;
  const _ScanningView({
    super.key,
    required this.lineController,
    required this.pulseController,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 260.w,
                height: 300.h,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: LightAppColors.grey100,
                  borderRadius: BorderRadius.circular(28.r),
                ),
                child: Icon(
                  Icons.restaurant_rounded,
                  size: 90.sp,
                  color: LightAppColors.grey300,
                ),
              ),
              // خط السكان
              AnimatedBuilder(
                animation: lineController,
                builder: (context, _) {
                  return Positioned(
                    top: 10 + (lineController.value * 280),
                    child: Container(
                      width: 240.w,
                      height: 3.h,
                      decoration: BoxDecoration(
                        color: LightAppColors.primary500,
                        borderRadius: BorderRadius.circular(4.r),
                        boxShadow: [
                          BoxShadow(
                            color: LightAppColors.primary500.withValues(
                              alpha: 0.6,
                            ),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              // شارة AI فوق الصورة توضح إن التحليل بالذكاء الاصطناعي
              Positioned(
                top: 14.h,
                child: FadeIn(
                  child: AnimatedBuilder(
                    animation: pulseController,
                    builder: (context, child) {
                      final scale = 1 + (pulseController.value * 0.06);
                      return Transform.scale(scale: scale, child: child);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: LightAppColors.primary700,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: LightAppColors.primary700.withValues(
                              alpha: 0.4,
                            ),
                            blurRadius: 12,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.auto_awesome_rounded,
                            size: 14.sp,
                            color: LightAppColors.white,
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            s.scanAiBadge,
                            style: AppTextStyles.font12SemiBold.copyWith(
                              color: LightAppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 32.h),
          FadeIn(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 16.w,
                  height: 16.w,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: LightAppColors.primary500,
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  s.scanAnalyzingTitle,
                  style: AppTextStyles.font16SemiBold.copyWith(
                    color: LightAppColors.neutral900,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            s.scanAnalyzingSubtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.font13Regular.copyWith(
              color: LightAppColors.grey600,
            ),
          ),
        ],
      ),
    );
  }
}

/// ---------------- Result: النتيجة ----------------
class _ResultView extends StatelessWidget {
  final VoidCallback onReset;
  const _ResultView({super.key, required this.onReset});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    // بيانات تجريبية - استبدليها برد الـ API الحقيقي
    const calories = 480;
    const protein = 28;
    const carbs = 52;
    const fat = 16;

    return ListView(
      padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 40.h),
      children: [
        FadeInDown(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24.r),
            child: Container(
              height: 200.h,
              width: double.infinity,
              color: LightAppColors.grey100,
              child: Icon(
                Icons.set_meal_rounded,
                size: 70.sp,
                color: LightAppColors.grey400,
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h),
        FadeInUp(
          delay: const Duration(milliseconds: 100),
          child: Text(
            s.scanResultMealName,
            style: AppTextStyles.font18Bold.copyWith(
              color: LightAppColors.neutral900,
            ),
          ),
        ),
        SizedBox(height: 4.h),
        FadeInUp(
          delay: const Duration(milliseconds: 150),
          child: Text(
            s.scanResultEstimateNote,
            style: AppTextStyles.font12Regular.copyWith(
              color: LightAppColors.grey600,
            ),
          ),
        ),
        SizedBox(height: 20.h),
        FadeInUp(
          delay: const Duration(milliseconds: 200),
          child: SoftCard(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      s.scanCaloriesLabel,
                      style: AppTextStyles.font14SemiBold.copyWith(
                        color: LightAppColors.neutral800,
                      ),
                    ),
                    Text(
                      s.scanCaloriesValue(calories),
                      style: AppTextStyles.font18Bold.copyWith(
                        color: LightAppColors.primary700,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18.h),
                Row(
                  children: [
                    Expanded(
                      child: _NutrientPill(
                        label: s.scanProteinLabel,
                        value: protein,
                        color: LightAppColors.info700,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: _NutrientPill(
                        label: s.scanCarbsLabel,
                        value: carbs,
                        color: LightAppColors.warning500,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: _NutrientPill(
                        label: s.scanFatLabel,
                        value: fat,
                        color: LightAppColors.accent700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 28.h),
        FadeInUp(
          delay: const Duration(milliseconds: 300),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: onReset,
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    side: BorderSide(color: LightAppColors.grey300),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  child: Text(
                    s.scanRetryButton,
                    style: AppTextStyles.font14SemiBold.copyWith(
                      color: LightAppColors.grey700,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: LightAppColors.primary500,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    s.scanSaveButton,
                    style: AppTextStyles.font14Bold.copyWith(
                      color: LightAppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _NutrientPill extends StatelessWidget {
  final String label;
  final int value;
  final Color color;
  const _NutrientPill({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        children: [
          Text(
            S.of(context).scanGramValue(value),
            style: AppTextStyles.font16Bold.copyWith(color: color),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: AppTextStyles.font12Regular.copyWith(
              color: LightAppColors.grey700,
            ),
          ),
        ],
      ),
    );
  }
}
