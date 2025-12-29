import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/theme/_theme.dart' as theme;
import 'package:abnormal_autonomous_web/view/home/sessions/filter_menu/styles/components_styles.dart' as styles;
import 'package:abnormal_autonomous_web/view/home/sessions/custom_appbar/styles/session_styles.dart' as custom_appbar_styles;
import 'package:abnormal_autonomous_web/view/home/sessions/custom_appbar/styles/components_styles.dart' as custom_appbar_styles;

class FilterMenu {
    static const double width = custom_appbar_styles.ServiceLogoComponentStyle.width;
    static double height(BuildContext context) {
        return MediaQuery.of(context).size.height - custom_appbar_styles.CustomAppBar.height;
    }
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