// widgets.dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';

import 'package:abnormal_autonomous_web/view/detail/sessions/visualizations/components/map/styles/widget_styles.dart' as styles;

class ErrorWidget extends StatelessWidget {
    final String error;

    const ErrorWidget({required this.error, super.key});

    @override
    Widget build(BuildContext context) {
        return Center(
            child: Text(
                error,
                style: styles.ErrorWidgetStyle.textStyle,
            ),
        );
    }
}

class TileLayerWidget extends StatelessWidget {
    const TileLayerWidget({super.key});

    @override
    Widget build(BuildContext context) {
        return TileLayer(
            tileBuilder: styles.TileLayerWidgetStyle.darkModeTileBuilder,
            urlTemplate: styles.TileLayerWidgetStyle.urlTemplate,
            
            tileProvider: CancellableNetworkTileProvider(),
        );
    }
}

Marker markerBuilder({
    required LatLng point,
    required Color color,
    required double zoom,
    bool isHovered = false,
    bool isSelected = false,
    VoidCallback? onHoverEnter,
    VoidCallback? onHoverExit,
    VoidCallback? onTap,
}) {

    final iconSize = styles.MarkerWidgetStyle.size(
        zoom: zoom,
        isHovered: isHovered,
        isSelected: isSelected,
    );

    final iconColor = styles.MarkerWidgetStyle.color(
        zoom: zoom,
        isHovered: isHovered,
        isSelected: isSelected,
        baseColor: color,
    );

    final border = styles.MarkerWidgetStyle.border(
        isHovered: isHovered,
        isSelected: isSelected,
    );

    return Marker(
        width: iconSize,
        height: iconSize,

        point: point,
        
        child: GestureDetector(
            onTap: onTap,

            child: MouseRegion(
                onEnter: (_) => onHoverEnter?.call(),
                onExit: (_) => onHoverExit?.call(),
                
                child: Container(
                    decoration: BoxDecoration(
                        color: iconColor,
                        shape: styles.MarkerWidgetStyle.shape,
                        border: border,
                    ),
                ),
            ),
        )
    );
}

Polyline polylineBuilder({
    required LatLng point1,
    required LatLng point2,
    required Color color,
}) {
    return Polyline(
        points: [point1, point2],
        color: color,
        strokeWidth: styles.PolylineWidgetStyle.strokeWidth,
    );
}