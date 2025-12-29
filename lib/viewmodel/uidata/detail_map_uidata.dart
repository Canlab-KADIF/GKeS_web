import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:abnormal_autonomous_web/model/_model.dart' as model;
import 'package:abnormal_autonomous_web/view/common/functions.dart' as common_functions;

class DetailMapUiData {
    final int idx;
    final List<Map<String, dynamic>> filters;
    final LatLng latLng;
    final Color color;

    DetailMapUiData({
        required this.idx,
        required this.filters,
        required this.latLng,
        required this.color,
    });

    factory DetailMapUiData.fromModel(
        model.MapModel mapModel,
        List<model.FilterModel> filterModels,
    ) {
        final List<Map<String, dynamic>> filters = [];

        final Map<String, dynamic> scenery = mapModel.scenery;
        final Map<String, dynamic> junctions = scenery['junctions'];

        final Map<String, dynamic> newScenery = {
            ...?junctions,
            for (var entry in scenery.entries)
                if (entry.key != 'junctions') entry.key: entry.value,
        };

        for (var entry in newScenery.entries) {
            final key = entry.key;
            final value = _specialKey_roundabouts(key, entry.value);

            final filterModel = filterModels.firstWhere(
                (fm) => fm.category == key,
                orElse: () => throw Exception("FilterModel not found for $key"),
            );

            final valuesList = value is List ? value : [value];
            final List<String> labels = [];

            for (var val in valuesList) {
                final label = _mapEnumValue(filterModel, val).toString();
                labels.add(label);
            }

            filters.add({
                'name': common_functions.snakeToTitleCase(key),
                'values': labels
            });
        }

        final Map<String, dynamic> travel_path = mapModel.travel_path;
        final latLng = LatLng(travel_path['latitude'], travel_path['longitude']);

        final traffic_density = mapModel.dynamic_elements['traffic_density'];
        final color = _mapColor(traffic_density);

        return DetailMapUiData(
            idx: mapModel.idx,
            filters: filters, 
            latLng: latLng,
            color: color,
        );
    }

    static String _mapEnumValue(model.FilterModel filterModel, dynamic value) {
        if (value == null) return 'null';

        final entry = filterModel.enums.entries.firstWhere(
            (e) => e.key.toString() == value.toString(),
            orElse: () => throw Exception("Enum not found for value $value in ${filterModel.category}")
        );
        return entry.value;
    }

    static dynamic _specialKey_roundabouts(String key, dynamic value) {
        if (key == 'roundabouts') {
            return value ? 0 : 1;
        }
        return value;
    }

    static Color _mapColor(dynamic traffic_density) {
        if (traffic_density == 0) {
            return Colors.green;
        } else if (traffic_density == 1) {
            return Colors.yellow;
        } else if (traffic_density == 2) {
            return Colors.red;
        } else {
            return Colors.grey;
        }
    }

}