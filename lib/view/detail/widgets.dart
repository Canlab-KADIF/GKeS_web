import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/view/detail/styles/widget_styles.dart' as styles;

class DividerWidget extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Center(
            child: Container(
                width: styles.DividerWidgetStyle.divider_visual_width,
                color: styles.DividerWidgetStyle.divider_color,
            ),
        );
    }
}