import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/view/detail/sessions/informations/widgets.dart' as widgets;
import 'package:abnormal_autonomous_web/view/detail/sessions/informations/styles/components_styles.dart' as styles;

class TabBarComponent extends StatelessWidget {
    const TabBarComponent({super.key});

    @override
    Widget build(BuildContext context) {
        return Container(
            height: styles.TabBarComponentStyle.height,
            decoration: styles.TabBarComponentStyle.outer_decoration,

            child: TabBar(
                indicatorSize: styles.TabBarComponentStyle.indicator_size,
                indicator: styles.TabBarComponentStyle.indicator_decoration,

                labelStyle: styles.TabBarComponentStyle.label_style,
                unselectedLabelStyle: styles.TabBarComponentStyle.unselected_label_style,

                dividerColor: styles.TabBarComponentStyle.divider_color,
                overlayColor: MaterialStateProperty.all(styles.TabBarComponentStyle.overlay_color),

                isScrollable: styles.TabBarComponentStyle.is_scrollable,
                tabAlignment: styles.TabBarComponentStyle.tab_alignment,

                tabs: [
                    Tab(child: widgets.InformationsTabButtonWidget(title: 'Information')),
                    Tab(child: widgets.InformationsTabButtonWidget(title: 'Log Header')),
                    Tab(child: widgets.InformationsTabButtonWidget(title: 'Abnormal Driving Cause')),
                    Tab(child: widgets.InformationsTabButtonWidget(title: 'User History')),
                ],
            )
        );
    }
}

class TarBarViewComponent extends StatelessWidget {
    final List<Widget> children;
    const TarBarViewComponent({super.key, required this.children});

    @override
    Widget build(BuildContext context) {
        return Expanded(
            child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: children,
            ),
        );
    }
}