import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:abnormal_autonomous_web/viewmodel/_viewmodel.dart' as vm;
import 'package:abnormal_autonomous_web/viewmodel/uidata/_uidata.dart' as uidata;

import 'package:abnormal_autonomous_web/view/detail/sessions/visualizations/components/map/styles/component_styles.dart' as styles;
import 'package:abnormal_autonomous_web/view/detail/sessions/visualizations/components/map/widgets.dart' as widgets;

import 'package:abnormal_autonomous_web/view/detail/sessions/visualizations/components/map/popup/components.dart' as components;
import 'package:abnormal_autonomous_web/view/common/widgets.dart' as common_widgets;


class MapComponent extends StatelessWidget {
    const MapComponent({super.key});

    @override
    Widget build(BuildContext context) {
        final view_model = Provider.of<vm.ItemDetailMapViewModel>(context);

        if (view_model.is_loading!) {
            return common_widgets.LoadingWidget();
        }

        if (view_model.error != null) {
            return widgets.ErrorWidget(error: view_model.error!);
        }

        return Padding(
            padding: styles.MapComponentStyle.padding,

            child: _MapComponent(
                points: view_model.detailMapUiDatas,
                center: view_model.center,
                zoom: view_model.zoom,
            ),
        );
    }
}

class _MapComponent extends StatefulWidget {
    final List<uidata.DetailMapUiData> points;
    final LatLng center;
    final double zoom;

    const _MapComponent({
        super.key,
        required this.points,
        required this.center,
        required this.zoom,
    });

    @override
    State<_MapComponent> createState() => _MapComponentState();
}

class _MapComponentState extends State<_MapComponent> {
    uidata.DetailMapUiData? _hoveredPoint;
    uidata.DetailMapUiData? _selectedPoint;
    double _currentZoom = 0;

    @override
    void initState() {
        super.initState();
        _currentZoom = widget.zoom;
    }

    @override
    Widget build(BuildContext context) {

        return Scaffold(
            body: FlutterMap(

                options: MapOptions(
                    center: widget.center,
                    zoom: _currentZoom,

                    onPositionChanged: (position, hasGesture) {
                        setState(() {
                            _currentZoom = position.zoom ?? _currentZoom;
                        });
                    },
                ),

                children: [
                    const widgets.TileLayerWidget(),

                    PolylineLayer(
                        polylines: [
                            for (var i = 0; i < widget.points.length - 1; i++)
                                widgets.polylineBuilder(
                                    point1: widget.points[i].latLng,
                                    point2: widget.points[i + 1].latLng,
                                    color: widget.points[i].color,
                                ),
                        ],
                    ),

                    MarkerLayer(
                        markers: [
                            for (var point in widget.points)
                                widgets.markerBuilder(
                                    color: point.color,
                                    zoom: _currentZoom,

                                    point: point.latLng,

                                    isHovered: _hoveredPoint == point,
                                    isSelected: _selectedPoint == point,

                                    onTap: () {
                                        setState(() {
                                            _selectedPoint = point;
                                            _hoveredPoint = null;
                                        });
                                    },

                                    onHoverEnter: () {
                                        if (_selectedPoint == null) {
                                            setState(() {
                                                _hoveredPoint = point;
                                            });
                                        }
                                    },

                                    onHoverExit: () {
                                        if (_selectedPoint == null) {
                                            setState(() {
                                                if (_hoveredPoint == point) {
                                                    _hoveredPoint = null;
                                                }
                                            });
                                        }
                                    },

                                ),
                        ],
                    ),
                    
                    if (_hoveredPoint != null && _selectedPoint == null)
                        components.PopupComponent(
                            point: _hoveredPoint!.latLng,
                            idx: _hoveredPoint!.idx,
                            filters: _hoveredPoint!.filters,
                            isSelected: false,
                            onClose: () {},
                            
                        ),
                    if (_selectedPoint != null)
                        components.PopupComponent(
                            point: _selectedPoint!.latLng,
                            idx: _selectedPoint!.idx,
                            filters: _selectedPoint!.filters,
                            isSelected: true,
                            onClose: () {
                                setState(() {
                                    _selectedPoint = null;
                                });
                            },
                        ),
                ],
            ),
        );
    }
}