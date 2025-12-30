import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:abnormal_autonomous_web/viewmodel/_viewmodel.dart' as vm;
import 'package:abnormal_autonomous_web/view/home/item_list/sessions/item_list/components.dart' as components;
import 'package:abnormal_autonomous_web/view/home/item_list/sessions/item_list/styles/session_styles.dart' as styles;

class ItemList extends StatelessWidget {
    const ItemList({super.key});

    @override
    Widget build(BuildContext context) {
        final view_model = Provider.of<vm.ItemListViewModel>(context);
        final item_ui_datas = view_model.itemUiDatas;
        return Container(
            height: styles.ItemListStyle.height(context),
            decoration: styles.ItemListStyle.decoration,

            child: Column(
                children: [
                    components.HeaderComponent(item_number: item_ui_datas.length),
                    
                    components.CardContainerComponent(
                        child: GridView.builder(
                            gridDelegate: styles.ItemListStyle.gridDelegate,

                            itemCount: item_ui_datas.length,
                            itemBuilder: (context, index) {
                                return components.CardComponent(
                                    image_path: item_ui_datas[index].image_path,
                                    filters: item_ui_datas[index].filters,
                                    onFilterPressed: () {print('filter pressed');},
                                );
                            },
                        ),
                    )
                ]
            ),
            
        );
    }
}