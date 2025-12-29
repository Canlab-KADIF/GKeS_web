import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:abnormal_autonomous_web/viewmodel/_viewmodel.dart' as vm;
import 'package:abnormal_autonomous_web/view/_view.dart' as view;

class ItemListScreen extends StatelessWidget {
    const ItemListScreen({super.key});

    @override
    Widget build(BuildContext context) {
        final view_model = context.watch<vm.ItemListViewModel>();

        return Scaffold(
            appBar: AppBar(title: const Text("Item List")),
            body: Column(
                children: [
                    _buildSearchBar(context),
                    _buildCategoryFilter(context),
                    _buildItemList(context, view_model),
                ]
            )
        );
    }

    Widget _buildSearchBar(BuildContext context) {
        final searchController = TextEditingController();
        return Row(
            children: [
                Expanded(child: TextField(controller: searchController)),
                IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () => context.read<vm.ItemListViewModel>().searchItems(searchController.text),
                )
            ]
        );
    }

    Widget _buildCategoryFilter(BuildContext context) {
        final view_model = context.read<vm.ItemListViewModel>();
        return Row(
            children: ['tag1', 'tag2', 'tag3'].map((tag) {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () => view_model.addTag(tag),
                        child: Text(tag),
                    ),
                );
            }).toList(),
        );
    }

    Widget _buildItemList(BuildContext context, vm.ItemListViewModel view_model) {
        if (view_model.isLoading) return const Center(child: CircularProgressIndicator());
        if (view_model.error != null) return Center(child: Text(view_model.error!));

        return Expanded(
            child: ListView.builder(
                itemCount: view_model.items.length,
                itemBuilder: (_, index) {
                    final item = view_model.items[index];
                    return ListTile(
                        leading: CachedNetworkImage(
                            imageUrl: item.imageUrl,
                            width: 50,
                            height: 50,
                            placeholder: (context, _) => const CircularProgressIndicator(),
                            errorWidget: (context, _, _) => const Icon(Icons.error),
                        ),
                        // onTap: () => Navigator.pushNamed(context, '/item/${item['id']}'),   
                        onTap: () {
                            final detail_view_model = context.read<vm.ItemDetailViewModel>();
                            detail_view_model.setItemModel(item);
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => const view.ItemDetailScreen()),
                            );
                        }
                    );
                }
            )
        );
    }
}