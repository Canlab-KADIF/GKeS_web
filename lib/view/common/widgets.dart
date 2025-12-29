import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/view/common/styles/widget_styles.dart' as styles;

class LoadingWidget extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Center(
            child: CircularProgressIndicator(
                color: styles.LoadingWidgetStyle.color,
            ),
        );
    }
}

class ErrorWidget extends StatelessWidget {
    final String error;

    ErrorWidget({required this.error});

    @override
    Widget build(BuildContext context) {
        return Text(error, style: styles.ErrorWidgetStyle.textStyle);
    }
}