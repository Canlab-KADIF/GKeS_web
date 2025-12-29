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

class NormalRowComponentStyle {
    static const Color? value_color = null;
}

class BoxRowComponentStyle {
    static const Color value_color = theme.AppColors.backgroundSecondary;
}

class ValueComponentStyle {
    static const double spacing = 10;
    static const double run_spacing = 10;
}

class BoxComponentStyle {
    static const EdgeInsets padding = EdgeInsets.fromLTRB(10, 10, 10, 20);
    
    static const BoxDecoration outer_decoration = BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: theme.AppColors.backgroundTertiary,
                width: 1,
            ),
        ),
    );

    static const BoxDecoration inner_decoration = BoxDecoration(
        color: theme.AppColors.backgroundTertiary,
    );
}