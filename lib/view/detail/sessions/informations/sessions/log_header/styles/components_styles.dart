import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/theme/_theme.dart' as theme;

class RowComponentStyle {
    static const EdgeInsets padding = EdgeInsets.symmetric(horizontal: 10, vertical: 10);

    static BoxDecoration decoration({Color? color = null, bool border = true}) {
        return BoxDecoration(
            color: color ?? Colors.transparent,
            border: border ? const Border(
                bottom: BorderSide(
                    color: theme.AppColors.backgroundTertiary,
                        width: 1,
                    ),
                ) : null,
        );
    }
}
class TopicTableComponentStyle {
    static const BoxDecoration outer_decoration = BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: theme.AppColors.backgroundTertiary,
                width: 1,
            ),
        ),
    );

    static const EdgeInsets padding = EdgeInsets.fromLTRB(10, 10, 10, 20);

    static const Color color = theme.AppColors.backgroundTertiary;
}

class TopicTableHeaderComponentStyle {
    static const Color color = theme.AppColors.backgroundPrimary;
}

class TopicRowComponentStyle {
    static const Color color = theme.AppColors.backgroundTertiary;
}