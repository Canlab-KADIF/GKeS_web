import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/view/home/item_list/sessions/item_list/styles/session_styles.dart' as styles;

class ItemList extends StatelessWidget {
    const ItemList({super.key});

    @override
    Widget build(BuildContext context) {
        return Container(
            color: styles.ItemList.color,
            child: Text('Item List'),
        );
    }
}