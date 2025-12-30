import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/theme/_theme.dart' as theme;
import 'package:abnormal_autonomous_web/view/home/item_list/sessions/custom_appbar/styles/session_styles.dart' as custom_appbar_styles;

class ItemListStyle {
    static double height(BuildContext context) {
        return MediaQuery.of(context).size.height - custom_appbar_styles.CustomAppBar.height;
    }

    static const BoxDecoration decoration = BoxDecoration(
        color: theme.AppColors.backgroundPrimary,
        border: Border(
            left: BorderSide(
                color: theme.AppColors.backgroundTertiary,
                width: 1,
            ),
        )
    );

    static const SliverGridDelegateWithFixedCrossAxisCount gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 16 / 9,
    );
}