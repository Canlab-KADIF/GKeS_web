import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/view/detail/sessions/visualizations/components/title/styles/widget_styles.dart' as styles;

class TitleWidget extends StatelessWidget {
    final String? id;

    const TitleWidget({super.key, this.id});

    @override
    Widget build(BuildContext context) {
        return Text(
            style: styles.TitleWidgetStyle.textStyle,

            '${id ?? 'no data'}',
        );
    }
}