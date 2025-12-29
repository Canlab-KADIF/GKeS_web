import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/view/common/widgets.dart' as common_widgets;
import 'package:abnormal_autonomous_web/view/detail/sessions/download/styles/components_styles.dart' as styles;

class LoadingComponent {
    static Widget build(BuildContext context) {
        return SizedBox(
            height: styles.CommonDialogComponentStyle.height,
            width: styles.CommonDialogComponentStyle.width,
            child: common_widgets.LoadingWidget(),
        );
    }
}

class ErrorComponent {
    static Widget build(BuildContext context, String error) {
        return SizedBox(
            height: styles.CommonDialogComponentStyle.height,
            width: styles.CommonDialogComponentStyle.width,
            child: common_widgets.ErrorWidget(error: error),
        );
    }
}