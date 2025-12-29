import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/theme/_theme.dart' as theme;

class LoadingWidgetStyle {
    static const Color color = theme.AppColors.contentTertiary;
    static const Color background_color = theme.AppColors.contentPrimary;
    static const double stroke_width = 10;
}

class ErrorWidgetStyle {
    static const TextStyle text_style = TextStyle(color: Colors.red);
}


class ItemNumberWidgetStyle {
    static const TextStyle search_query_text_style = TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w700,
        color: theme.AppColors.contentPrimary,
    );

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
    static const double width = 30;

    static final ButtonStyle button_style = ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
    );

    static TextStyle text_style(bool activate) {
        return TextStyle(
            color: activate ? theme.AppColors.contentPrimary : theme.AppColors.contentTertiary,
            fontSize: 10,
            fontWeight: FontWeight.w100,
        );
    }
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