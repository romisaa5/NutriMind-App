import 'package:flutter/material.dart';

class DarkAppColors {
  // ---------- Primary Palette ----------
  static const Color primary100 = Color(0xFFD4F5C8);
  static const Color primary200 = Color(0xFFA8E99B);
  static const Color primary300 = Color(0xFF7CDB70);
  static const Color primary400 = Color(0xFF5BCB61);
  static const Color primary500 = Color(0xFF4CAF62);
  static const Color primary600 = Color(0xFF429653);
  static const Color primary700 = Color(0xFF34763F);
  static const Color primary800 = Color(0xFF24552F);
  static const Color primary900 = Color(0xFF14351F);

  // ---------- Secondary ----------
  static const Color secondary100 = Color(0xFFEAF5D8);
  static const Color secondary200 = Color(0xFFD5EAAF);
  static const Color secondary300 = Color(0xFFBDD989);
  static const Color secondary400 = Color(0xFFA4C86B);
  static const Color secondary500 = Color(0xFF8DBB55);
  static const Color secondary600 = Color(0xFF729A43);
  static const Color secondary700 = Color(0xFF587832);
  static const Color secondary800 = Color(0xFF3B5425);
  static const Color secondary900 = Color(0xFF243719);

  // ---------- Neutral ----------
  static const Color neutral900 = Color(0xFFF4F7F2);
  static const Color neutral800 = Color(0xFFDCE3DC);
  static const Color neutral700 = Color(0xFFB8C2B8);
  static const Color neutral600 = Color(0xFF929D92);
  static const Color neutral500 = Color(0xFF707A70);
  static const Color neutral400 = Color(0xFF566056);
  static const Color neutral300 = Color(0xFF3D473F);
  static const Color neutral200 = Color(0xFF2D3730);
  static const Color neutral100 = Color(0xFF1F2923);

  // ---------- Grey Scale ----------
  static const Color grey900 = Color(0xFF0D1711);
  static const Color grey800 = Color(0xFF202A23);
  static const Color grey700 = Color(0xFF354038);
  static const Color grey600 = Color(0xFF4B564D);
  static const Color grey500 = Color(0xFF68736A);
  static const Color grey400 = Color(0xFF879187);
  static const Color grey300 = Color(0xFFAEB7AE);
  static const Color grey200 = Color(0xFFC9D0C8);
  static const Color grey100 = Color(0xFFE1E6DE);
  static const Color grey50 = Color(0xFFF0F3ED);
  static const Color grey0 = Color(0xFFFFFFFF);

  // ---------- Neutral ----------
  static const Color background = Color(0xFF101A16);
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
  static const Color accent300 = Color(0xFF344038);

  // ---------- Gradients ----------
  static const List<Color> greenGradient = [
    Color(0xFF7CDB70),
    Color(0xFF4CAF62),
  ];

  static const List<Color> orangeGradient = [
    Color(0xFFF4B942),
    Color(0xFFE07835),
  ];

  static const List<Color> yellowGradient = [
    Color(0xFFD9E88A),
    Color(0xFF8DBB55),
  ];

  static List<Color> greenYellowGradient = [
    const Color(0xFF4CAF62).withValues(alpha: .15),
    const Color(0xFFA8D36F).withValues(alpha: .15),
  ];
}
