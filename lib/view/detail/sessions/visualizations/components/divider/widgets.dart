import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/view/detail/sessions/visualizations/components/divider/styles/widget_styles.dart' as styles;

class DividerWidget extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Center(
            child: Container(
                height: styles.DividerWidgetStyle.divider_visual_height,
                color: styles.DividerWidgetStyle.divider_color,
            ),
        );
    }
}