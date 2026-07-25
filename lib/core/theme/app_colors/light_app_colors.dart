import 'package:flutter/material.dart';

class LightAppColors {
  // ---------- Primary Palette ----------
  static const Color primary100 = Color(0xFFD9F0D5);
  static const Color primary200 = Color(0xFFB8DFAF);
  static const Color primary300 = Color(0xFF8FCF8A);
  static const Color primary400 = Color(0xFF65B96A);
  static const Color primary500 = Color(0xFF4CAF62);
  static const Color primary600 = Color(0xFF3D9954);
  static const Color primary700 = Color(0xFF2F7D45);
  static const Color primary800 = Color(0xFF205A34);
  static const Color primary900 = Color(0xFF123B24);

  // ---------- Secondary ----------
  static const Color secondary100 = Color(0xFFF1F7E8);
  static const Color secondary200 = Color(0xFFE2EED0);
  static const Color secondary300 = Color(0xFFD0E5B1);
  static const Color secondary400 = Color(0xFFB9D78D);
  static const Color secondary500 = Color(0xFFA8D36F);
  static const Color secondary600 = Color(0xFF8DBB55);
  static const Color secondary700 = Color(0xFF6F963F);
  static const Color secondary800 = Color(0xFF4E6E2D);
  static const Color secondary900 = Color(0xFF30471E);

  // ---------- Neutral ----------
  static const Color neutral900 = Color(0xFF1B241D);
  static const Color neutral800 = Color(0xFF303830);
  static const Color neutral700 = Color(0xFF4D554D);
  static const Color neutral600 = Color(0xFF687068);
  static const Color neutral500 = Color(0xFF929992);
  static const Color neutral400 = Color(0xFFB8BDB8);
  static const Color neutral300 = Color(0xFFD5D9D5);
  static const Color neutral200 = Color(0xFFE7EAE5);
  static const Color neutral100 = Color(0xFFFFFFFF);

  // ---------- Grey Scale ----------
  static const Color grey900 = Color(0xFF0F1A12);
  static const Color grey800 = Color(0xFF424842);
  static const Color grey700 = Color(0xFF626862);
  static const Color grey600 = Color(0xFF7C827C);
  static const Color grey500 = Color(0xFFA0A5A0);
  static const Color grey400 = Color(0xFFC1C5C1);
  static const Color grey300 = Color(0xFFE0E3DE);
  static const Color grey200 = Color(0xFFEBEEE9);
  static const Color grey100 = Color(0xFFF3F5F0);
  static const Color grey50 = Color(0xFFF8FAF6);
  static const Color grey0 = Color(0xFFFFFFFF);

  // ---------- Neutral ----------
  static const Color background = Color(0xFFFAFBF7);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);

  // ---------- Status ----------
  static const Color error900 = Color(0xFF8B1E24);
  static const Color error700 = Color(0xFFD64545);
  static const Color error500 = Color(0xFFEF5350);

  static const Color warning500 = Color(0xFFF4B942);

  static const Color info900 = Color(0xFF1E5B8F);
  static const Color info700 = Color(0xFF3182CE);

  static const Color info500 = Color(0xFF6B5CA5);
  static const Color info300 = Color(0xFF8B7BC4);

  static const Color accent700 = Color(0xFFE07835);
  static const Color accent600 = Color(0xFF687068);
  static const Color accent300 = Color(0xFFE5EAE3);

  // ---------- Gradients ----------
  static const List<Color> greenGradient = [
    Color(0xFF65B96A),
    Color(0xFF3D9954),
  ];

  static const List<Color> orangeGradient = [
    Color(0xFFF4B942),
    Color(0xFFE07835),
  ];

  static const List<Color> yellowGradient = [
    Color(0xFFD9E88A),
    Color(0xFFA8D36F),
  ];

  static List<Color> greenYellowGradient = [
    const Color(0xFF4CAF62).withValues(alpha: .1),
    const Color(0xFFA8D36F).withValues(alpha: .1),
  ];
}
