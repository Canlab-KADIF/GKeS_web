import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/viewmodel/uidata/_uidata.dart' as uidata;
import 'package:abnormal_autonomous_web/view/home/sessions/filter_menu/widgets.dart' as widgets;
import 'package:abnormal_autonomous_web/view/home/sessions/filter_menu/styles/components_styles.dart' as styles;
import 'package:abnormal_autonomous_web/view/common/widgets.dart' as common_widgets;

class FilterHeaderComponent extends StatelessWidget {
    final int selected_num;
    final Function() onClearPressed;
    const FilterHeaderComponent({super.key, required this.selected_num, required this.onClearPressed});

    @override
    Widget build(BuildContext context) {
        return Container(
            width: styles.FilterHeaderComponentStyle.width,
            height: styles.FilterHeaderComponentStyle.height,
            decoration: styles.FilterHeaderComponentStyle.decoration,

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

class LoadingComponent extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return common_widgets.LoadingWidget();
    }
}

class ErrorComponent extends StatelessWidget {
    final String error;
    const ErrorComponent({super.key, required this.error});

    @override
    Widget build(BuildContext context) {
        return widgets.ErrorWidget(error: error);
    }
}

class FilterBodyComponent extends StatelessWidget {
    final List<Widget> children;
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

class ToggleMenuComponent extends StatefulWidget {
    final String category;
    final List<uidata.FilterButtonUiData> button_ui_datas;
    final Function(int) onPressed;

    const ToggleMenuComponent({
        super.key,
        required this.category,
        required this.button_ui_datas,
        required this.onPressed,
    });

    @override
    State<ToggleMenuComponent> createState() => _ToggleMenuComponentState();
}

class _ToggleMenuComponentState extends State<ToggleMenuComponent> {
  bool isOpen = true;

  void toggleMenu() {
    setState(() {
        isOpen = !isOpen;
    });
  }

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
                            
                            Row(
                                children: [
                                    Text(widget.category, style: styles.FilterCategoryComponentStyle.text_style,),
                                    // IconButton(
                                    //     icon: Icon(isOpen ? Icons.close : Icons.menu),
                                    //     onPressed: toggleMenu,
                                    // ),
                                    // widgets.FilterCategoryTitleWidget(category: widget.category),
                                ]
                            ),
                            if (isOpen) ...[
                                widgets.FilterCategoryBlankWidget(),
                                widgets.FilterWrapWidget(
                                    children: [
                                        for (var button_ui_data in widget.button_ui_datas)
                                            widgets.FilterButtonWidget(button_ui_data: button_ui_data, onPressed: widget.onPressed),
                                    ],
                                ),
                            ]

                        ]
                    )
                )
            )
        );
    }
}