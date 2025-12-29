import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/theme/_theme.dart' as theme;

class NameWidgetStyle {
    static const TextStyle text_style = TextStyle(
        color: theme.AppColors.contentPrimary,
        fontWeight: FontWeight.w700,
    );
}

class ValuesWidgetStyle {
    static const TextStyle text_style = TextStyle(
        color: theme.AppColors.contentPrimary,
        fontWeight: FontWeight.w100,
    );
}

class CloseButtonWidgetStyle {
    static const IconData close_icon = Icons.close;
    static const double icon_size = 12;
    static const Color color = theme.AppColors.contentPrimary;
}