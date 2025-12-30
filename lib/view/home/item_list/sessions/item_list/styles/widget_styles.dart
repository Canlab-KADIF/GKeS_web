import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/theme/_theme.dart' as theme;

class ItemNumberWidgetStyle {
    static const TextStyle result_text_style = TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: theme.AppColors.contentPrimary,
    );

    static const TextStyle number_text_style = TextStyle(
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontSize: 17,
        height: 1.41,
        letterSpacing: 0.0,
        color: theme.AppColors.contentPrimary,
    );
}

class PageWidgetStyle {
    static const TextStyle text_style = TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w300,
        color: theme.AppColors.contentSecondary,
    );
}

class FilterWidget {
    static const EdgeInsets margin = EdgeInsets.all(2);
    static const EdgeInsets padding = EdgeInsets.all(2);
    
    static final Decoration decoration = BoxDecoration(
        color: theme.AppColors.backgroundPrimary.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(4),
    );

    static TextStyle text_style = TextStyle(
        color: theme.AppColors.contentPrimary,
        fontSize: 13,
        fontWeight: FontWeight.w500,
    );
}