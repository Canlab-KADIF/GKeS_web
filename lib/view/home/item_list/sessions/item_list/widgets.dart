import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/view/home/item_list/sessions/item_list/styles/widget_styles.dart' as styles;

class LoadingWidget extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Center(
            child: CircularProgressIndicator(
                color: styles.LoadingWidgetStyle.color,
            ),
        );
    }
}

class ErrorWidget extends StatelessWidget {
    final String error;
    const ErrorWidget({super.key, required this.error});

    @override
    Widget build(BuildContext context) {
        return Center(
            child: Text(
                style: styles.ErrorWidgetStyle.text_style,

                error,

            ),
        );
    }
}


class ItemNumberWidget extends StatelessWidget {
    final int item_number;
    const ItemNumberWidget({super.key, required this.item_number});

    @override
        Widget build(BuildContext context) {
        return Row(
            children: [
                Text(
                    style: styles.ItemNumberWidgetStyle.result_text_style,

                    "Results ",
                ),
                Text(
                    style: styles.ItemNumberWidgetStyle.number_text_style,

                    "${item_number.toString()} found",
                ),
            ],
        );
    }
}

class PageWidget extends StatelessWidget {
    const PageWidget({super.key});

    @override
    Widget build(BuildContext context) {
        return Text(
            style: styles.PageWidgetStyle.text_style,

            "1 2 3 4 5 6 7 8 9 10",
        );
    }
}

class ImageWidget extends StatelessWidget {
    final String image_path;
    const ImageWidget({super.key, required this.image_path});

    @override
    Widget build(BuildContext context) {
        return Image.network(image_path);
    }
}

class FilterWidget extends StatelessWidget {
    final String filter;
    const FilterWidget({super.key, required this.filter});

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: styles.FilterWidget.margin,
            
            child: Container(
                decoration: styles.FilterWidget.decoration,

                child:Padding(
                    padding: styles.FilterWidget.padding,

                    child: Text(
                        style: styles.FilterWidget.text_style,

                        filter,
                    ),
                ),
            ),
        );
    }
}