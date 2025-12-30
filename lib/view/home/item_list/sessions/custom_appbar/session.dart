import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/view/home/item_list/sessions/custom_appbar/styles/session_styles.dart' as styles;
import 'package:abnormal_autonomous_web/view/home/item_list/sessions/custom_appbar/widgets.dart' as widgets;

class CustomAppBar extends StatelessWidget {
    const CustomAppBar({super.key});

    @override
    Widget build(BuildContext context) {
        return Container(
            width: styles.CustomAppBar.width,
            height: styles.CustomAppBar.height,
            decoration: styles.CustomAppBar.decoration,

            child: Row(
                children: [
                    widgets.ServiceLogo(),
                    widgets.SearchIcon(),
                    widgets.SearchBar(),
                    Expanded(child: widgets.OrganizationLogo(),)
                ]
            ),
        );
    }
}