import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:abnormal_autonomous_web/view/detail/sessions/visualizations/components/_components.dart' as components;
import 'package:abnormal_autonomous_web/view/detail/sessions/visualizations/session_styles.dart' as styles;

class VisualizationsSession extends StatelessWidget {
    const VisualizationsSession({super.key});

    @override
    Widget build(BuildContext context) {
        return Column(
            children: [
                components.TitleComponent(),

                Expanded(
                    child: MultiSplitView(
                        axis: Axis.vertical,
                        controller: MultiSplitViewController(areas: [
                            Area(weight: styles.VisualizationsSessionStyle.video_component_weight),
                            Area(weight: styles.VisualizationsSessionStyle.map_component_weight),
                        ]),

                        dividerBuilder: (axis, index, resizable, dragging, highlighted, themeData) {
                            return components.DividerComponent();
                        },


                        children: [
                            components.VideoComponent(),
                            components.MapComponent(),
                        ],
                    )
                )
            ],
        );
    }
}