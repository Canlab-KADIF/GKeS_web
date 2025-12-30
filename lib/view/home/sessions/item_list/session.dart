import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:abnormal_autonomous_web/viewmodel/_viewmodel.dart' as vm;
import 'package:abnormal_autonomous_web/view/home/sessions/item_list/components.dart' as components;
import 'package:abnormal_autonomous_web/view/home/sessions/item_list/styles/session_styles.dart' as styles;

class ItemList extends StatelessWidget {
    const ItemList({super.key});

    @override
    Widget build(BuildContext context) {
        final item_view_model = Provider.of<vm.ItemListViewModel>(context);
        final page_view_model = Provider.of<vm.PageViewModel>(context);
        final detail_view_model = Provider.of<vm.ItemDetailViewModel>(context);
        final item_ui_datas = item_view_model.itemUiDatas;
        return Container(
            height: styles.ItemListStyle.height(context),
            decoration: styles.ItemListStyle.decoration,

            child: item_view_model.isLoading
                ? components.LoadingComponent()

                : item_view_model.error != null
                    ? components.ErrorComponent(error: item_view_model.error!)

                    : Column(
                        children: [
                            components.HeaderComponent(
                                item_number: page_view_model.totalItems,
                                current_page: page_view_model.currentPage,
                                total_pages: page_view_model.totalPages,
                                onPageChanged: page_view_model.setCurrentPage,
                            ),
                            
                            components.CardContainerComponent(
                                child: GridView.builder(
                                    gridDelegate: styles.ItemListStyle.gridDelegate,

                                    itemCount: item_ui_datas.length,
                                    itemBuilder: (context, index) {
                                        return components.CardComponent(
                                            image_path: item_ui_datas[index].image_path,
                                            filters: item_ui_datas[index].filters,
                                            onFilterPressed: () {
                                                detail_view_model.setItemDetail(item_view_model.returnItemModel(index));
                                                Navigator.pushNamed(context, '/detail');
                                            },
                                        );
                                    },
                                ),
                            )
                        ]
                    ),
        );
    }
}