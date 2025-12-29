import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/theme/_theme.dart' as theme;

class FilterHeaderComponentStyle {
    static const double width = double.infinity;
    static const double height = 78;
    static const BoxDecoration decoration = BoxDecoration(
        color: theme.AppColors.backgroundSecondary,
        border: Border(
            bottom: BorderSide(
                color: theme.AppColors.backgroundTertiary,
                width: 1,
            ),
        )
    );
    
    static const EdgeInsets padding = EdgeInsets.only(left: 32, right: 32, top: 24, bottom: 24);
}

class FilterBodyComponentStyle {
    static const Color background_color = theme.AppColors.backgroundPrimary;
}

class FilterCategoryComponentStyle {
    static const BoxDecoration decoration = BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: theme.AppColors.backgroundTertiary,
                width: 1,
            ),
        )
    );

    static const EdgeInsets padding = EdgeInsets.only(left: 32, right: 32, top: 20, bottom: 20);

    static const Color background_color = theme.AppColors.backgroundPrimary;

    static const TextStyle text_style = TextStyle(color: theme.AppColors.contentPrimary, fontSize: 22, fontWeight: FontWeight.w500);
}