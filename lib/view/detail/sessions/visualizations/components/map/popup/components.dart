import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

import 'package:abnormal_autonomous_web/view/detail/sessions/visualizations/components/map/popup/widgets.dart' as widgets;
import 'package:abnormal_autonomous_web/view/detail/sessions/visualizations/components/map/popup/styles/component_styles.dart' as styles;

class PopupComponent extends StatelessWidget {
    final LatLng point;
    final int idx;
    final List<Map<String, dynamic>> filters;
    final bool isSelected;
    final VoidCallback onClose;

    const PopupComponent({
        super.key,
        required this.point,
        required this.idx,
        required this.filters,
        required this.isSelected,
        required this.onClose,
    });

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: styles.PopupComponentStyle.outer_padding,

            child: Opacity(
                opacity: isSelected
                    ? styles.PopupComponentStyle.selectedOpacity
                    : styles.PopupComponentStyle.unselectedOpacity,
                
                child: Container(
                    color: styles.PopupComponentStyle.color,

                    child: IntrinsicWidth(
                        child: IntrinsicHeight(
                            child: Container(
                                padding: styles.PopupComponentStyle.inner_padding,

                                child: Column(
                                    children: [

                                        HeaderComponent(
                                            idx: idx.toString(),
                                            isSelected: isSelected,
                                            onClose: onClose,
                                        ),

                                        for (var filter in filters)
                                            RowComponent(
                                                name: filter['name'],
                                                values: filter['values'],
                                            ),
                                    ],
                                ),
                            ),
                        ),
                    ),
                ),
            ),
        );
    }
}

class RowComponent extends StatelessWidget {
    final String name;
    final List<String> values;

    const RowComponent({super.key, required this.name, required this.values});

    @override
    Widget build(BuildContext context) {
        return Row(
            
            children: [
                widgets.NameWidget(name: name),

                Expanded(
                    child: widgets.ValuesWidget(values: values),
                )
            ],
        );
    }
}

class HeaderComponent extends StatelessWidget {
    final String idx;
    final bool isSelected;
    final VoidCallback onClose;

    const HeaderComponent({super.key, required this.idx, required this.isSelected, required this.onClose});

    @override
    Widget build(BuildContext context) {
        return Row(
            children: [
                Expanded(
                    child: RowComponent(
                        name: 'idx',
                        values: [idx],
                    ),
                ),

                if (isSelected)
                    widgets.CloseButtonWidget(
                        onPressed: onClose,
                    ),
            ],
        );
    }
}