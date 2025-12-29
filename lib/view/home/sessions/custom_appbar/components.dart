import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/view/home/sessions/custom_appbar/widgets.dart' as widgets;
import 'package:abnormal_autonomous_web/view/home/sessions/custom_appbar/styles/components_styles.dart' as styles;

class ServiceLogoComponent extends StatelessWidget {
    const ServiceLogoComponent({super.key});

    @override
    Widget build(BuildContext context) {
        return Container(
            width: styles.ServiceLogoComponentStyle.width,
            child: Padding(
                padding: styles.ServiceLogoComponentStyle.padding,
                child: widgets.ServiceLogoWidget(),
            )
        );
    }
}

class SearchComponent extends StatelessWidget {
    final Function() onSearch;
    final Function(String) onChanged;
    const SearchComponent({super.key, required this.onSearch, required this.onChanged});

    @override
    Widget build(BuildContext context) {
        return Container(
            width: styles.SearchComponentStyle.width,
            height: styles.SearchComponentStyle.height,
            color: styles.SearchComponentStyle.color,

            child: Row(
                children: [
                    widgets.SearchIconWidget(onSearch: onSearch),
                    widgets.SearchInputWidget(onChanged: onChanged, onSearch: onSearch),
                ],
            ),
        );
    }
}
