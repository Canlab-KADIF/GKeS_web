import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/theme/_theme.dart' as theme;
import 'package:abnormal_autonomous_web/view/home/item_list/sessions/custom_appbar/styles/session_styles.dart' as custom_appbar_styles;

class ItemList {
    static const Color color = Colors.green;
}

class ItemListStyle {
    static const Color background_color = theme.AppColors.backgroundPrimary;
    static double height(BuildContext context) {
        return MediaQuery.of(context).size.height - custom_appbar_styles.CustomAppBar.height;
    }
    static const SliverGridDelegateWithFixedCrossAxisCount gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 16 / 9,
    );
}