import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/viewmodel/uidata/_uidata.dart' as uidata;
import 'package:abnormal_autonomous_web/view/home/item_list/sessions/filter_menu/widgets.dart' as widgets;
import 'package:abnormal_autonomous_web/view/home/item_list/sessions/filter_menu/styles/components_styles.dart' as styles;

class FilterHeaderComponent extends StatelessWidget {
    final int selected_num;
    final Function() onClearPressed;
    const FilterHeaderComponent({super.key, required this.selected_num, required this.onClearPressed});

    @override
    Widget build(BuildContext context) {
        return Container(
            width: styles.FilterHeaderComponentStyle.width,
            height: styles.FilterHeaderComponentStyle.height,
            color: styles.FilterHeaderComponentStyle.background_color,

            child: Padding(
                padding: styles.FilterHeaderComponentStyle.padding,

                child: Row(
                    children: [

                        widgets.FilterHeaderImageWidget(),
                        widgets.FilterHeaderGapWidget(width: 4),

                        widgets.FilterHeaderTextWidget(),
                        widgets.FilterHeaderGapWidget(width: 12),

                        widgets.FilterHeaderSelectedNumWidget(selected_num: selected_num),
                        Spacer(),

                        widgets.FilterHeaderClearButtonWidget(onPressed: onClearPressed)

                    ]
                )
            )
        );
    }
}

class FilterCircleComponent extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return widgets.FilterCircleWidget();
    }
}

class FilterErrorTextComponent extends StatelessWidget {
    final String error;
    const FilterErrorTextComponent({super.key, required this.error});

    @override
    Widget build(BuildContext context) {
        return widgets.FilterErrorTextWidget(error: error);
    }
}

class FilterBodyComponent extends StatelessWidget {
    final List<FilterCategoryComponent> children;
    const FilterBodyComponent({super.key, required this.children});

    @override
    Widget build(BuildContext context) {
        return Expanded(

            child: Container(
                color: styles.FilterBodyComponentStyle.background_color,

                child: widgets.FilterScrollbarWidget(

                    child: Column(
                        children: children,
                    ),

                ),
            )
        );
    }
}

class FilterCategoryComponent extends StatelessWidget {
    final String category;
    final List<uidata.FilterButtonUiData> button_ui_datas;
    final Function(int) onPressed;
    const FilterCategoryComponent({super.key, required this.category, required this.button_ui_datas, required this.onPressed});
    
    @override
    Widget build(BuildContext context) {
        return Container(
            decoration: styles.FilterCategoryComponentStyle.decoration,

            child: Padding(
                padding: styles.FilterCategoryComponentStyle.padding,

                child: Container(
                    color: styles.FilterCategoryComponentStyle.background_color,

                    child: Column(
                        children: [

                            widgets.FilterCategoryTitleWidget(category: category),
                            widgets.FilterCategoryBlankWidget(),
                            widgets.FilterWrapWidget(
                                children: [
                                    for (var button_ui_data in button_ui_datas)
                                        widgets.FilterButtonWidget(button_ui_data: button_ui_data, onPressed: onPressed),
                                ],
                            ),

                        ],
                    ),
                )
            )
        );
    }
}