import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/theme/_theme.dart' as theme;

class LoadingWidgetStyle {
    static const Color color = theme.AppColors.contentTertiary;
    static const Color background_color = theme.AppColors.contentPrimary;
    static const double stroke_width = 10;
}

class ErrorWidgetStyle {
    static const TextStyle textStyle = TextStyle(
        color: Colors.red,
    );
}