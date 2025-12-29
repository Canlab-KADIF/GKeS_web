import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:abnormal_autonomous_web/theme/_theme.dart' as theme;
import 'package:abnormal_autonomous_web/view/home/sessions/custom_appbar/styles/session_styles.dart' as custom_appbar_styles;

class HeaderComponentStyle {
    static final Color color = theme.AppColors.backgroundPrimary;
    static const double width = double.infinity;
    static const double height = 78;

    static const EdgeInsets padding = EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16);
}

class CardContainerComponentStyle {
    static const EdgeInsets padding = EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 0);

    static final Color color = theme.AppColors.backgroundPrimary;
    static double height(BuildContext context) {
        return MediaQuery.of(context).size.height
            - custom_appbar_styles.CustomAppBar.height
            - HeaderComponentStyle.height;
    }
}

class CardComponentStyle {
    static final MouseCursor cursor = SystemMouseCursors.click;

    static final Color color = theme.AppColors.contentStateDisabled;
}