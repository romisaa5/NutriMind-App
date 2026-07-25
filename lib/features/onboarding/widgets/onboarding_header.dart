import 'package:nutri_mind/core/theme/theme_manager/theme_extensions.dart';

import '../../../core/utils/common_imports.dart';

class OnboardingHeader extends StatelessWidget {
  final String titleLine1;
  final String titleLine2;
  final String description;

  const OnboardingHeader({
    super.key,
    required this.titleLine1,
    required this.titleLine2,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 48, left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleLine1,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: context.customAppColors.primary500,
              height: 1.2,
            ),
          ),
          Text(
            titleLine2,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: context.customAppColors.neutral900,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            description,
            style: TextStyle(
              fontSize: 15,
              color: context.customAppColors.neutral700,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
