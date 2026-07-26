import 'package:flutter/material.dart';
import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/features/scan/presentation/screens/idle_view.dart';
import 'package:nutri_mind/features/scan/presentation/screens/result_view.dart';
import 'package:nutri_mind/features/scan/presentation/screens/scanning_view.dart';
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
      backgroundColor: context.customAppColors.background,
      appBar: AppBar(
        backgroundColor: context.customAppColors.background,
        elevation: 0,
        centerTitle: true,
        title: Text(
          S.of(context).scanTitle,
          style: AppTextStyles.font16Bold.copyWith(
            color: context.customAppColors.neutral900,
          ),
        ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        child: switch (_state) {
          ScanState.idle => IdleView(
            key: const ValueKey('idle'),
            onScan: _startScan,
          ),
          ScanState.scanning => ScanningView(
            key: const ValueKey('scanning'),
            lineController: _lineController,
            pulseController: _pulseController,
          ),
          ScanState.result => ResultView(
            key: const ValueKey('result'),
            onReset: _reset,
          ),
        },
      ),
    );
  }
}
