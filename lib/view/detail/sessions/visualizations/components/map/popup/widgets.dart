import 'package:flutter/material.dart';

import 'package:abnormal_autonomous_web/view/detail/sessions/visualizations/components/map/popup/styles/widget_styles.dart' as styles;

class NameWidget extends StatelessWidget {
    final String name;

    const NameWidget({
        required this.name,
        super.key,
    });

    @override
    Widget build(BuildContext context) {
        return Text(
            style: styles.NameWidgetStyle.text_style,

            '${name}: '
        );
    }
}

class ValuesWidget extends StatelessWidget {
    final List<String> values;

    const ValuesWidget({
        required this.values,
        super.key,
    });

    @override
    Widget build(BuildContext context) {
        return Text(
            style: styles.ValuesWidgetStyle.text_style,

            values.isNotEmpty ? values.join(', ') : '[ ]',
        );
    }
}


class CloseButtonWidget extends StatelessWidget {
    final VoidCallback onPressed;
    
    const CloseButtonWidget({
        required this.onPressed,
        super.key,
    });

    @override
    Widget build(BuildContext context) {
        return IconButton(
            icon: Icon(
                styles.CloseButtonWidgetStyle.close_icon,
                color: styles.CloseButtonWidgetStyle.color,
                size: styles.CloseButtonWidgetStyle.icon_size,
            ),
            onPressed: onPressed,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints()
        );
    }
}