import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/theme/_theme.dart' as theme;

class NameWidgetStyle {
    static const TextStyle textStyle = TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        height: 1.45,
        letterSpacing: -0.0004,
        color: theme.AppColors.contentPrimary,
    );
}

class ValueWidgetStyle {
    static const EdgeInsets padding = EdgeInsets.fromLTRB(12, 6, 12, 6);

    static const TextStyle textStyle = TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        height: 1.5,
        letterSpacing: 0.0057,
        color: theme.AppColors.contentPrimary,
    );
}
