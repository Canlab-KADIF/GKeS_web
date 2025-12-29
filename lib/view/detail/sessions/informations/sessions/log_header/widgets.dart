import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/view/detail/sessions/informations/sessions/log_header/styles/widget_styles.dart' as styles;

class NameWidget extends StatelessWidget {
    final String name;
    const NameWidget({super.key, required this.name});

    @override
    Widget build(BuildContext context) {
        return Container(
            child: Text(
                style: styles.NameWidgetStyle.textStyle,

                name
            ),
        );
    }
}

class ValueWidget extends StatelessWidget {
    final String value;
    const ValueWidget({super.key, required this.value});

    @override
    Widget build(BuildContext context) {
        return Container(
            padding: styles.ValueWidgetStyle.padding,
            
            child: Text(
                style: styles.ValueWidgetStyle.textStyle,

                value
            ),
        );
    }
}