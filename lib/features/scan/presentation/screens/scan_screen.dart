import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nutri_mind/core/common/models/app_models.dart';
import 'package:nutri_mind/core/di/service_locator.dart';
import 'package:nutri_mind/core/helpers/enums.dart';
import 'package:nutri_mind/core/services/firebase/firebase_auth_service.dart';
import 'package:nutri_mind/core/services/groq/groq_nutrition_service.dart';
import 'package:nutri_mind/core/theme/app_texts/app_text_styles.dart';
import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';
import 'package:nutri_mind/features/scan/data/models/meal_analysis_result.dart';
import 'package:nutri_mind/features/scan/data/repos/meal_repository.dart';
import 'package:nutri_mind/features/scan/presentation/screens/idle_view.dart';
import 'package:nutri_mind/features/scan/presentation/screens/meal_type_select_view.dart';
import 'package:nutri_mind/features/scan/presentation/screens/result_view.dart';
import 'package:nutri_mind/features/scan/presentation/screens/scanning_view.dart';
import 'package:nutri_mind/generated/l10n.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> with TickerProviderStateMixin {
  ScanState _state = ScanState.mealTypeSelect;
  late final AnimationController _lineController;
  late final AnimationController _pulseController;

  final ImagePicker _picker = ImagePicker();

  MealType? _selectedMealType;
  Uint8List? _imageBytes;
  MealAnalysisResult? _analysis;
  bool _isSaving = false;

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

  // ---------------- Meal Type ----------------
  void _onMealTypeSelected(MealType type) {
    setState(() {
      _selectedMealType = type;
      _state = ScanState.idle;
    });
  }

  void _onChangeMealType() {
    setState(() {
      _selectedMealType = null;
      _state = ScanState.mealTypeSelect;
    });
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? file = await _picker.pickImage(
        source: source,
        imageQuality: 80,
        maxWidth: 1024,
      );

      if (file == null) return;

      final bytes = await file.readAsBytes();

      debugPrint('📸 Image path: ${file.path}');
      debugPrint('📦 Image size: ${bytes.length}');

      if (!mounted) return;

      setState(() {
        _imageBytes = bytes;
        _state = ScanState.scanning;
      });

      await _analyzeImage(bytes);
    } catch (e, stack) {
      debugPrint('Pick image error: $e');
      debugPrint('$stack');

      if (!mounted) return;
      _showError(S.of(context).errorInvalidAnalysisFormat);
    }
  }

  Future<void> _analyzeImage(Uint8List bytes) async {
    try {
      debugPrint('🚀 Sending image to Groq...');
      debugPrint('Bytes: ${bytes.length}');

      final result = await getIt<GroqNutritionService>()
          .analyzeMealImage(imageBytes: bytes, mealType: _selectedMealType!)
          .timeout(
            const Duration(seconds: 40),
            onTimeout: () {
              throw Exception('Groq request timeout');
            },
          );

      debugPrint('✅ Groq returned');

      if (!mounted) return;

      result.when(
        success: (analysis) {
          debugPrint('🍽️ Meal: ${analysis.name}');

          setState(() {
            _analysis = analysis;
            _state = ScanState.result;
          });
        },
        error: (failure) {
          debugPrint(
            '❌ Groq error: ${failure.code} - ${failure.debugMessage ?? S.of(context).errorUnknown}',
          );

          setState(() {
            _state = ScanState.idle;
          });

          _showError(
            failure.debugMessage ?? S.of(context).errorInvalidAnalysisFormat,
          );
        },
      );
    } catch (e, stack) {
      debugPrint('🔥 Analyze error: $e');
      debugPrint('$stack');

      if (!mounted) return;

      setState(() {
        _state = ScanState.idle;
      });

      _showError(e.toString());
    }
  }

  Future<void> _saveMeal() async {
    if (_analysis == null || _selectedMealType == null) return;

    final uid = getIt<FirebaseAuthService>().currentUser?.uid;
    if (uid == null) {
      _showError(S.of(context).mustBeLoggedIn);
      return;
    }

    setState(() => _isSaving = true);

    final meal = MealModel(
      type: _selectedMealType!,
      name: _analysis!.name,
      calories: _analysis!.calories,
      protein: _analysis!.protein,
      carbs: _analysis!.carbs,
      fat: _analysis!.fat,
      fiber: _analysis!.fiber,
      sugar: _analysis!.sugar,
      sodium: _analysis!.sodium,
      advice: _analysis!.advice,
      loggedAt: DateTime.now(),
    );

    final result = await getIt<MealRepository>().saveMeal(uid: uid, meal: meal);

    if (!mounted) return;
    setState(() => _isSaving = false);

    result.when(
      success: (_) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(S.of(context).mealSavedSuccess)));
        _resetToIdle();
      },
      error: (failure) =>
          _showError(failure.debugMessage ?? S.of(context).errorFirestoreSave),
    );
  }

  void _resetToIdle() {
    setState(() {
      _state = ScanState.idle;
      _imageBytes = null;
      _analysis = null;
    });
  }

  void _showError(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

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
          ScanState.mealTypeSelect => MealTypeSelectView(
            key: const ValueKey('mealType'),
            onSelect: _onMealTypeSelected,
          ),
          ScanState.idle => IdleView(
            key: const ValueKey('idle'),
            mealType: _selectedMealType!,
            onCameraTap: () => _pickImage(ImageSource.camera),
            onGalleryTap: () => _pickImage(ImageSource.gallery),
            onChangeMealType: _onChangeMealType,
          ),
          ScanState.scanning => ScanningView(
            key: const ValueKey('scanning'),
            lineController: _lineController,
            pulseController: _pulseController,
            imageBytes: _imageBytes,
          ),
          ScanState.result => ResultView(
            key: const ValueKey('result'),
            analysis: _analysis!,
            mealType: _selectedMealType!,
            imageBytes: _imageBytes!,
            isSaving: _isSaving,
            onReset: _resetToIdle,
            onSave: _saveMeal,
          ),
        },
      ),
    );
  }
}
