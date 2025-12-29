import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:abnormal_autonomous_web/model/_model.dart' as model;
import 'package:abnormal_autonomous_web/viewmodel/_viewmodel.dart' as vm;

class ItemDetailScreen extends StatelessWidget {
    const ItemDetailScreen({super.key});

    @override
    Widget build(BuildContext context) {
        final view_model = context.watch<vm.ItemDetailViewModel>();
        return Scaffold(
            appBar: AppBar(
                title: Text(view_model.id),
            ),
            body: Column(
                children: [
                    Text(view_model.description),
                    Text(view_model.imageUrl),
                ],
            ),
        );
    }
}