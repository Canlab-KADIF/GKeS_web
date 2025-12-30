import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:abnormal_autonomous_web/view/home/item_list/sessions/filter_menu/styles/session_styles.dart' as styles;
import 'package:abnormal_autonomous_web/view/home/item_list/sessions/filter_menu/components.dart' as components;
import 'package:abnormal_autonomous_web/viewmodel/_viewmodel.dart' as vm;

class FilterMenu extends StatelessWidget {
    const FilterMenu({super.key});

    @override
    Widget build(BuildContext context) {
        final view_model = Provider.of<vm.FilterViewModel>(context);

        return Container(
            width: styles.FilterMenu.width,
            height: styles.FilterMenu.height(context),
            decoration: styles.FilterMenu.decoration,

            child: view_model.isLoading
                ? components.LoadingComponent()

                : view_model.error != null
                    ? components.ErrorComponent(error: view_model.error!)

                    : Column(
                        children: [
                            components.FilterHeaderComponent(
                                selected_num: view_model.selectedFiltersKeyNumber,
                                onClearPressed: () {view_model.clearAllSelections();}
                            ),

                            components.FilterBodyComponent(
                                children: [
                                    for (var filter_ui_data in view_model.filterUiDatas) ...[
                                        components.FilterCategoryComponent(
                                            category: filter_ui_data.category,
                                            button_ui_datas: filter_ui_data.buttons,
                                            onPressed: (key) {view_model.toggleButtonSelection(filter_ui_data.category, key);},
                                        ),
                                    ],
                                ],
                            )
                        ]
                    )
        );
    }
}