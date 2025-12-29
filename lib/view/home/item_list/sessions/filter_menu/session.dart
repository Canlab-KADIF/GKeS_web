import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/view/home/item_list/sessions/filter_menu/styles/session_styles.dart' as styles;

class FilterMenu extends StatelessWidget {
    const FilterMenu({super.key});

    @override
    Widget build(BuildContext context) {
        return Container(
            width: styles.FilterMenu.width,
            color: styles.FilterMenu.color,
            child: Text('Filter Menu'),
        );
    }
}