import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/view/detail/sessions/custom_appbar/components.dart' as components;
import 'package:abnormal_autonomous_web/view/detail/sessions/custom_appbar/styles/session_styles.dart' as custom_appbar_styles;

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
    final VoidCallback download_button_pressed;
    final VoidCallback labeling_button_pressed;

    const CustomAppBar({super.key, required this.download_button_pressed, required this.labeling_button_pressed});

    @override
    Widget build(BuildContext context) {
        return AppBar(
            centerTitle: custom_appbar_styles.CustomAppBar.centerTitle,
            backgroundColor: custom_appbar_styles.CustomAppBar.backgroundColor,
            toolbarHeight: custom_appbar_styles.CustomAppBar.height,
            
            leading: components.BackButtonComponent(onPressed: () {Navigator.pop(context);}),

            title: components.TitleComponent(),
            
            actions: [
                components.DownloadButtonComponent(onPressed: download_button_pressed),
                components.LabellingButtonComponent(onPressed: labeling_button_pressed),
            ],

            bottom: components.DividerComponent(),
        );
    }

    @override
    Size get preferredSize => Size.fromHeight(custom_appbar_styles.CustomAppBar.height);
}