import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/theme/_theme.dart' as theme;

class FilterHeaderImageWidgetStyle {
    static const double width = 28;
    static const double height = 28;

    static const String image_path = theme.AppAssets.filterIconPath;
    
    static const double image_width = 21;
    static const double image_height = 14;
    static const BoxFit image_fit = BoxFit.contain;
}

class FilterHeaderTextWidgetStyle {
    static const TextStyle text_style = TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 22,
        height: 1.36,
        letterSpacing: -1.94 / 100 * 22,
        color: theme.AppColors.contentPrimary,
    );

    static const String text = "Filters";
}

class FilterHeaderSelectedNumWidgetStyle {
    static const TextStyle text_style = TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        height: 1.36,
        letterSpacing: -0.4268,
        color: theme.AppColors.accentLight,
    );
}

class FilterHeaderClearButtonWidgetStyle {
    static const String text = "Clear All";

    static final ButtonStyle button_style = ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
    );
    
    static const TextStyle text_style = TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        height: 1.41,
        letterSpacing: 0,
        color: theme.AppColors.accentLight,
    );
}

class LoadingWidgetStyle {
    static const Color color = theme.AppColors.contentTertiary;
    static const Color background_color = theme.AppColors.contentPrimary;
    static const double stroke_width = 10;
}

class ErrorWidgetStyle {
    static const TextStyle text_style = TextStyle(color: Colors.red);
}

class FilterCategoryTitleWidgetStyle {
    static const double width = double.infinity;

    static const TextStyle text_style = TextStyle(
        color: theme.AppColors.contentPrimary,
        fontSize: 22,
        fontWeight: FontWeight.w500,
    );
}

class FilterCategoryBlankWidgetStyle {
    static const double height = 20;
}

class FilterWrapWidgetStyle {
    static const double width = double.infinity;

    static const double spacing = 10;
    static const double run_spacing = 10;
}

class FilterButtonWidgetStyle {
    static const TextStyle text_style = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
    );
    static final TextStyle selected_text_style = text_style.copyWith(
        color: theme.AppColors.contentPrimary,
    );
    static final TextStyle unselected_text_style = text_style.copyWith(
        color: theme.AppColors.contentSecondary,
    );

    static final ButtonStyle button_style = ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
        ),

        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),

        overlayColor: theme.AppColors.contentPrimary,
        shadowColor: Colors.transparent,
    );
    static final ButtonStyle selected_style = button_style.copyWith(
        backgroundColor: MaterialStateProperty.all(theme.AppColors.accentLight),
        foregroundColor: MaterialStateProperty.all(selected_text_style.color),
        textStyle: MaterialStateProperty.all(selected_text_style),
    );
    static final ButtonStyle unselected_style = button_style.copyWith(
        backgroundColor: MaterialStateProperty.all(theme.AppColors.backgroundTertiary),
        foregroundColor: MaterialStateProperty.all(unselected_text_style.color),
        textStyle: MaterialStateProperty.all(unselected_text_style),
    );
}

class FilterScrollbarWidgetStyle {
    static const Color baseThumbColor = Color(0xFFD9D9D9);
    static final Color thumbColor = baseThumbColor.withOpacity(0.2);
    static const double thickness = 6;
    static const Radius radius = Radius.circular(4);
}
