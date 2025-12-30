import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/view/home/sessions/item_list/widgets.dart' as widgets;
import 'package:abnormal_autonomous_web/view/home/sessions/item_list/styles/components_styles.dart' as styles;

class LoadingComponent extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return widgets.LoadingWidget();
    }
}

class ErrorComponent extends StatelessWidget {
    final String error;
    const ErrorComponent({super.key, required this.error});

    @override
    Widget build(BuildContext context) {
        return widgets.ErrorWidget(error: error);
    }
}

class HeaderComponent extends StatelessWidget {
    final int item_number;
    final int current_page;
    final int total_pages;
    final Function(int) onPageChanged;
    const HeaderComponent({super.key, required this.item_number, required this.current_page, required this.total_pages, required this.onPageChanged});

    @override
    Widget build(BuildContext context) {
        return Container(
            height: styles.HeaderComponentStyle.height,
            width: styles.HeaderComponentStyle.width,
            color: styles.HeaderComponentStyle.color,

            child: Padding(
                padding: styles.HeaderComponentStyle.padding,

                child: Row(
                    children: [
                        widgets.ItemNumberWidget(item_number: item_number),
                        Spacer(),
                        for (var page in List.generate(total_pages, (i) => i + 1))
                            widgets.PageWidget(
                                page: page,
                                activate: page == current_page,
                                onPageChanged: onPageChanged,
                            ),
                    ],
                ),
            ),
        );
    }
}

class CardContainerComponent extends StatelessWidget {
    final Widget child;
    const CardContainerComponent({super.key, required this.child});

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: styles.CardContainerComponentStyle.padding,

            child: Container(
                height: styles.CardContainerComponentStyle.height(context),
                color: styles.CardContainerComponentStyle.color,

                child: child,
            ),
        );
    }
}

class CardComponent extends StatelessWidget {
    final String image_path;
    final List<String> filters;
    final Function() onFilterPressed;
    const CardComponent({super.key, required this.image_path, required this.filters, required this.onFilterPressed});

    @override
    Widget build(BuildContext context) {
        return MouseRegion(
            cursor: styles.CardComponentStyle.cursor,

            child: GestureDetector(
                onTap: onFilterPressed,
                
                child: Container(
                    color: styles.CardComponentStyle.color,
                    
                    child: Stack(
                        children: [
                            widgets.ImageWidget(image_path: image_path),
                            FiltersComponent(filters: filters),
                        ],
                    ),
                ),
            ),
        );
    }
}

class FiltersComponent extends StatelessWidget {
    final List<String> filters;
    const FiltersComponent({super.key, required this.filters});

    @override
    Widget build(BuildContext context) {
        return Wrap(
            children: [
                for (var filter in filters)
                    widgets.FilterWidget(filter: filter),
            ],
        );
    }
}