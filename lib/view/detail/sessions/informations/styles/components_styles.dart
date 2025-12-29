import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/theme/_theme.dart' as theme;

class TabBarComponentStyle {
    static const double height = 55;

    static const BoxDecoration outer_decoration = BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: theme.AppColors.backgroundSecondary,
                width: 8,
            ),
        ),
    );

    static const TabBarIndicatorSize indicator_size = TabBarIndicatorSize.tab;

    static const BoxDecoration indicator_decoration = BoxDecoration(
        color: theme.AppColors.backgroundSecondary,
    );


    static const TextStyle label_style = TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 18,
        height: 1.0,
        letterSpacing: 0.0,
        color: theme.AppColors.contentPrimary,
    );

    static const TextStyle unselected_label_style = TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 18,
        height: 1.0,
        letterSpacing: 0.0,
        color: theme.AppColors.contentTertiary,
    );

    static const Color divider_color = Colors.transparent;

    static const Color overlay_color = Colors.transparent;

    static const bool is_scrollable = true;

    static const TabAlignment tab_alignment = TabAlignment.start;

}