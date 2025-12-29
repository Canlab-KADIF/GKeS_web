import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/view/detail/sessions/visualizations/components/video/styles/widget_styles.dart' as styles;

class WarnningWidget extends StatelessWidget {
    const WarnningWidget({super.key});

    @override
    Widget build(BuildContext context) {
        return Container(
            alignment: styles.WarnningWidgetStyle.alignment,

            child: Text(
                style: styles.WarnningWidgetStyle.textStyle,

                'no video',
            ),
        );
    }
}