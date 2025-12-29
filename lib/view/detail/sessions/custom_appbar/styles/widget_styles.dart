import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/theme/_theme.dart' as theme;

class TitleStyle {
    static const TextStyle textStyle = TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        height: 1.33,
        letterSpacing: -0.552,
        color: theme.AppColors.contentPrimary,
    );
}

class CustomButtonStyle {
    static final ButtonStyle buttonStyle = ButtonStyle(
        backgroundColor: WidgetStateProperty.all(theme.AppColors.backgroundTertiary),
        foregroundColor: WidgetStateProperty.all(theme.AppColors.contentSecondary),
        shape: WidgetStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
        )),
        overlayColor: WidgetStateProperty.all(Colors.transparent), 
        padding: WidgetStateProperty.all(EdgeInsets.all(18)),
    );
    
    static const TextStyle textStyle = TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
        height: 1.41,
        letterSpacing: 0.0,
    );
}

class DownloadButtonWidgetIconStyle {
    static const double size = 15;
    static const String path = 'assets/images/download.png';
    static const Color color = theme.AppColors.contentPrimary;
}

class BackButtonWidgetIconStyle {
    static const EdgeInsets padding = EdgeInsets.zero;
    static const double size = 32;
    static const String path = 'assets/images/back.png';
    static const Color color = theme.AppColors.contentPrimary;
}

class DividerStyle {
    static const Color color = theme.AppColors.backgroundTertiary;
    static const double height = 1;
}