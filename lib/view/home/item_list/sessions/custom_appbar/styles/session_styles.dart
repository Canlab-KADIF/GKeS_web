import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/theme/_theme.dart' as theme;

class CustomAppBar {
    static const double width = double.infinity;
    static const double height = 124;

    static const BoxDecoration decoration = BoxDecoration(
        color: theme.AppColors.backgroundPrimary,
        border: Border(
            bottom: BorderSide(
                color: theme.AppColors.backgroundTertiary,
                width: 1,
            ),
        )
    );
}