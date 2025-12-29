import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/view/detail/sessions/informations/sessions/abnormal_driving_cause/widgets.dart' as widgets;
import 'package:abnormal_autonomous_web/view/detail/sessions/informations/sessions/abnormal_driving_cause/styles/components_styles.dart' as styles;

class RowComponent extends StatelessWidget {
    final String name;
    final String value;
    final bool border;
    const RowComponent({super.key, required this.name, required this.value, this.border = true});

    @override
    Widget build(BuildContext context) {
        return Container(
            decoration: styles.RowComponentStyle.decoration(border: border),
            
            child: Padding(
                padding: styles.RowComponentStyle.padding,

                child: Row(
                    children: [
                        Expanded(
                            flex: 1,
                            child: widgets.NameWidget(name: name),
                        ),
                        Expanded(
                            flex: 2,
                            child: widgets.ValueWidget(value: value),
                        ),
                    ],
                )
            )
        );
    }
}

class BoxComponent extends StatelessWidget {
    final List<Widget> children;
    const BoxComponent({super.key, required this.children});

    @override
    Widget build(BuildContext context) {
        return Container(
            decoration: styles.BoxComponentStyle.outer_decoration,

            child: Padding(
                padding: styles.BoxComponentStyle.padding,

                child: Container(
                    decoration: styles.BoxComponentStyle.inner_decoration,

                    child: Column(
                        children: children,
                    ),
                )
            )
        );
    }
}