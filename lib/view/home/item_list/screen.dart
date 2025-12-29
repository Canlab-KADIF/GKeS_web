import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/view/home/item_list/sessions/_sessions.dart' as sessions;

class ItemListScreen extends StatelessWidget {
    const ItemListScreen({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Column(
                children: [
                    sessions.CustomAppBar(),
                    Row(
                        children: [
                            sessions.FilterMenu(),
                            Expanded(child: sessions.ItemList())
                        ]
                    )
                ]
            )
        );
    }
}