import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/theme/_theme.dart' as theme;

class DownloadSessionStyle {
    static const Color backgroundColor = theme.AppColors.backgroundPrimary;
    static const TextStyle textStyle = TextStyle(
        color: theme.AppColors.contentPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w500,
    );

    static const double height = 400;
}

class ContentStyle {
    static const TextStyle textStyle = TextStyle(
        color: theme.AppColors.contentPrimary,
    );

    static const TextStyle buttonTextStyle = TextStyle(
        color: theme.AppColors.contentTertiary,
    );

    static final ButtonStyle textButtonTextStyle = TextButton.styleFrom(
        overlayColor: Colors.transparent,
    );
}