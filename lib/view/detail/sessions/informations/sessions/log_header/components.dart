import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/view/detail/sessions/informations/sessions/log_header/widgets.dart' as widgets;
import 'package:abnormal_autonomous_web/view/detail/sessions/informations/sessions/log_header/styles/components_styles.dart' as styles;

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

class TopicTableComponent extends StatelessWidget {
    final Widget header;
    final List<Widget> children;
    const TopicTableComponent({super.key, required this.header, required this.children});

    @override
    Widget build(BuildContext context) {
        return Expanded(

            child: Container(
                decoration: styles.TopicTableComponentStyle.outer_decoration,

                child: Padding(
                    padding: styles.TopicTableComponentStyle.padding,

                    child: Column(
                        children: [
                            header,
                            Expanded(
                                child: SingleChildScrollView(

                                    child: Column(
                                        children: [
                                            for (var child in children) child,
                                        ],
                                    ),
                                )
                            )
                        ]
                    )
                )
            )

        );
    }
}

class TopicTableHeaderComponent extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return TopicRowComponent(
            topic_name: 'Topic Name',
            topic_type: 'Topic Type',
            color: styles.TopicTableHeaderComponentStyle.color,
        );
    }
}

class TopicRowComponent extends StatelessWidget {
    final String topic_name;
    final String topic_type;
    final Color? color;
    const TopicRowComponent({super.key, required this.topic_name, required this.topic_type, this.color});

    @override
    Widget build(BuildContext context) {
        final color = this.color ?? styles.TopicRowComponentStyle.color;
        
        return Container(
            decoration: styles.RowComponentStyle.decoration(color: color),
            
            child: Padding(
                padding: styles.RowComponentStyle.padding,

                child: Row(
                    children: [
                        Expanded(
                            flex: 3,
                            child: widgets.NameWidget(name: topic_name),
                        ),
                        Expanded(
                            flex: 2,
                            child: widgets.ValueWidget(value: topic_type),
                        ),
                    ],
                )
            )
        );
    }
}