import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/viewmodel/uidata/_uidata.dart' as uidata;
import 'package:abnormal_autonomous_web/view/home/item_list/sessions/filter_menu/styles/widget_styles.dart' as styles;

class FilterHeaderGapWidget extends StatelessWidget {
    final double width;
    const FilterHeaderGapWidget({super.key, required this.width});

    @override
    Widget build(BuildContext context) {
        return SizedBox(width: width);
    }
}

class FilterHeaderImageWidget extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return SizedBox(
            width: styles.FilterHeaderImageWidgetStyle.width,
            height: styles.FilterHeaderImageWidgetStyle.height,

            child: Center(
                child: Image.asset(
                    width: styles.FilterHeaderImageWidgetStyle.image_width,
                    height: styles.FilterHeaderImageWidgetStyle.image_height,
                    fit: styles.FilterHeaderImageWidgetStyle.image_fit,

                    styles.FilterHeaderImageWidgetStyle.image_path,

                ),
            ),
        );
    }
}

class FilterHeaderTextWidget extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Text(
            style: styles.FilterHeaderTextWidgetStyle.text_style,

            styles.FilterHeaderTextWidgetStyle.text,
            
        );
    }
}

class FilterHeaderSelectedNumWidget extends StatelessWidget {
    final int selected_num;
    const FilterHeaderSelectedNumWidget({super.key, required this.selected_num});

    @override
    Widget build(BuildContext context) {
        return Text(
            style: styles.FilterHeaderSelectedNumWidgetStyle.text_style,

            selected_num.toString(),

        );
    }
}

class FilterHeaderClearButtonWidget extends StatelessWidget {
    final Function() onPressed;
    const FilterHeaderClearButtonWidget({super.key, required this.onPressed});

    @override
    Widget build(BuildContext context) {
        return TextButton(
            onPressed: onPressed,

            child: Text(
                style: styles.FilterHeaderClearButtonWidgetStyle.text_style,

                styles.FilterHeaderClearButtonWidgetStyle.text,

            ),
        );
    }
}

class FilterCircleWidget extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Center(
            child: CircularProgressIndicator(
                color: styles.FilterCircleWidgetStyle.color,
            ),
        );
    }
}

class FilterErrorTextWidget extends StatelessWidget {
    final String error;
    const FilterErrorTextWidget({super.key, required this.error});

    @override
    Widget build(BuildContext context) {
        return Center(
            child: Text(
                style: styles.FilterErrorTextWidgetStyle.text_style,

                error,

            ),
        );
    }
}

class FilterScrollbarWidget extends StatelessWidget {
    final Widget child;
    const FilterScrollbarWidget({super.key, required this.child});

    @override
    Widget build(BuildContext context) {
        return ScrollbarTheme(
            data: ScrollbarThemeData(
                thumbColor: MaterialStateProperty.all(styles.FilterScrollbarWidgetStyle.thumbColor),
                thickness: MaterialStateProperty.all(styles.FilterScrollbarWidgetStyle.thickness),
                radius: styles.FilterScrollbarWidgetStyle.radius,
            ),

            child: SingleChildScrollView(

                child: child,
                
            ),
        );
    }
}

class FilterCategoryTitleWidget extends StatelessWidget {
    final String category;
    const FilterCategoryTitleWidget({super.key, required this.category});
    
    @override
    Widget build(BuildContext context) {
        return Container(
            width: styles.FilterCategoryTitleWidgetStyle.width,

            child: Text(
                style: styles.FilterCategoryTitleWidgetStyle.text_style,

                category,

            ),
        );
    }
}

class FilterCategoryBlankWidget extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return SizedBox(height: styles.FilterCategoryBlankWidgetStyle.height);
    }
}

class FilterWrapWidget extends StatelessWidget {
    final List<Widget> children;
    const FilterWrapWidget({super.key, required this.children});

    @override
    Widget build(BuildContext context) {
        return Container(
            width: styles.FilterWrapWidgetStyle.width,
            
            child: Wrap(
                spacing: styles.FilterWrapWidgetStyle.spacing,
                runSpacing: styles.FilterWrapWidgetStyle.run_spacing,

                children: children,
                
            ),
        );
    }
}

class FilterButtonWidget extends StatelessWidget {
    final uidata.FilterButtonUiData button_ui_data;
    final Function(int) onPressed;
    const FilterButtonWidget({super.key, required this.button_ui_data, required this.onPressed});
    
    @override
    Widget build(BuildContext context) {
        return ElevatedButton(
            style: button_ui_data.isSelected
                ? styles.FilterButtonWidgetStyle.selected_style
                : styles.FilterButtonWidgetStyle.unselected_style,

            onPressed: () {onPressed(button_ui_data.key);},

            child: Text(button_ui_data.text),

        );
    }
}