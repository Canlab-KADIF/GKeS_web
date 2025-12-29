import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class ErrorWidgetStyle {
    static const TextStyle textStyle = TextStyle(color: Colors.red);
}

class TileLayerWidgetStyle {
    static const String urlTemplate = "https://tile.openstreetmap.org/{z}/{x}/{y}.png";

    static Widget darkModeTileBuilder(
        BuildContext context,
        Widget tileWidget,
        TileImage tile,
    ) {
        return ColorFiltered(
            colorFilter: const ColorFilter.matrix(<double>[
                -0.2126, -0.7152, -0.0722, 0, 255,
                -0.2126, -0.7152, -0.0722, 0, 255,
                -0.2126, -0.7152, -0.0722, 0, 255,
                0,       0,       0,       1, 0,
            ]),
            child: tileWidget,
        );
    }
}

class MarkerWidgetStyle {
    static const double baseSize = 10.0;
    static const double sizeFactor = 0.05;
    static const double selectedSizeFactor = 1.5;
    static const double zoomThreshold = 18.5;
    static const double borderWidth = 2.0;
    static const Color borderColor = Colors.white;

    static double size({
        required double zoom,
        required bool isHovered,
        required bool isSelected,
    }) {
        final zoomSize = baseSize + (zoom * sizeFactor);
        return isHovered || isSelected ? zoomSize * selectedSizeFactor : zoomSize;
    }

    static Color color({
        required double zoom,
        required bool isHovered,
        required bool isSelected,
        required Color baseColor,
    }) {
        return (isHovered || isSelected || zoom > zoomThreshold) ? baseColor : Colors.transparent;
    }

    static BoxShape shape = BoxShape.circle;

    static Border border({
        required bool isHovered,
        required bool isSelected,
    }) {
        return isHovered || isSelected ? Border.all(color: borderColor, width: borderWidth) : Border.all(color: Colors.transparent, width: 0);
    }
}

class PolylineWidgetStyle {
    static const double strokeWidth = 4.0;
}