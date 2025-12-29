import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/theme/app_colors.dart' as app_colors;

class LoginBoxStyles {
    static const double width = 500;
    static const double height = 547;
    static const EdgeInsets padding = EdgeInsets.fromLTRB(72, 80, 72, 80);

    static BoxDecoration decoration  = BoxDecoration(
        color: app_colors.AppColors.backgroundSecondary.withOpacity(0.6),
        borderRadius: BorderRadius.circular(24),
    );
}