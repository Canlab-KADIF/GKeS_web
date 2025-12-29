import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/view/detail/sessions/informations/sessions/information/widgets.dart' as widgets;
import 'package:abnormal_autonomous_web/view/detail/sessions/informations/sessions/information/styles/components_styles.dart' as styles;

class RowComponent extends StatelessWidget {
    final String name;
    final List<String> values;
    final bool border;
    final Color? value_color;
    const RowComponent({super.key, required this.name, required this.values, this.border = true, this.value_color = null});

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
                            child: ValueComponent(values: values, color: value_color),
                        ),
                    ],
                )
            )
        );
    }
}

class NormalRowComponent extends RowComponent {
    const NormalRowComponent({
        super.key,
        required super.name,
        required super.values,
        super.border,
    }) : super(value_color: styles.NormalRowComponentStyle.value_color);
}

class BoxRowComponent extends RowComponent {
    const BoxRowComponent({
        super.key,
        required super.name,
        required super.values,
        super.border,
    }) : super(value_color: styles.BoxRowComponentStyle.value_color);
}

class ValueComponent extends StatelessWidget {
    final List<String> values;
    final Color? color;
    const ValueComponent({super.key, required this.values, this.color = null});

    @override
    Widget build(BuildContext context) {
        
        return Container(
            child: Wrap(
                spacing: styles.ValueComponentStyle.spacing,
                runSpacing: styles.ValueComponentStyle.run_spacing,

                children: [
                    for (var value in values)
                        widgets.ValueWidget(value: value, color: color),
                ],
            ),
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