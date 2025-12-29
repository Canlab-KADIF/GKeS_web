import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/view/detail/sessions/custom_appbar/widgets.dart' as widgets;
import 'package:abnormal_autonomous_web/view/detail/sessions/custom_appbar/styles/components_styles.dart' as styles;

class TitleComponent extends StatelessWidget {
    const TitleComponent({super.key});

    @override
    Widget build(BuildContext context) {
        return widgets.TitleWidget();
    }
}

class DownloadButtonComponent extends StatelessWidget {
    final VoidCallback onPressed;
    const DownloadButtonComponent({super.key, required this.onPressed});

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: styles.DownloadButtonComponentStyle.padding,

            child: widgets.DownloadButtonWidget(onPressed: onPressed),
        );
    }
}

class LabellingButtonComponent extends StatelessWidget {
    final VoidCallback onPressed;
    const LabellingButtonComponent({super.key, required this.onPressed});

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: styles.LabellingButtonComponentStyle.padding,

            child: widgets.LabellingButtonWidget(onPressed: onPressed),
        );
    }
} 

class BackButtonComponent extends StatelessWidget {
    final VoidCallback onPressed;
    const BackButtonComponent({super.key, required this.onPressed});

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: styles.BackButtonComponentStyle.padding,

            child: widgets.BackButtonWidget(onPressed: onPressed),
        );
    }
}

class DividerComponent extends StatelessWidget implements PreferredSizeWidget {
    @override
    Widget build(BuildContext context) {
        return widgets.DividerWidget();
    }
    @override
    Size get preferredSize => const Size.fromHeight(styles.DividerComponentStyle.height);
}   