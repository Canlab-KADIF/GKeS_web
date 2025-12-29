import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:abnormal_autonomous_web/service/_service.dart' as service;
import 'package:abnormal_autonomous_web/model/_model.dart' as model;
import 'package:abnormal_autonomous_web/viewmodel/_viewmodel.dart' as vm;
import 'package:abnormal_autonomous_web/viewmodel/uidata/_uidata.dart' as uidata;

class ItemDetailMapViewModel extends ChangeNotifier {
    final service.IJsonService _jsonService;
	final vm.FilterLoadViewModel _filterLoadViewModel;


    ItemDetailMapViewModel(this._jsonService, this._filterLoadViewModel);

    List<model.MapModel> _mapModels = [];
    List<uidata.DetailMapUiData> _detailMapUiDatas = [];
	List<model.FilterModel> _filterModels = [];
    bool? _is_loading;
    String? _error;

    List<uidata.DetailMapUiData> get detailMapUiDatas => _detailMapUiDatas;
    LatLng get center => _calcCenter(_detailMapUiDatas.map((e) => e.latLng).toList());
    double get zoom => _calcZoom(_detailMapUiDatas.map((e) => e.latLng).toList());
    

    bool? get is_loading => _is_loading;
    String? get error => _error;

    Future <void> setMapData(String route_data_path) async {
        _is_loading = true;
        _error = null;
        notifyListeners();

        try {
            final route_data = await _jsonService.getJson(route_data_path);
            _setMapData(route_data);
        } catch (e) {
            print(e);
            _error = e.toString();
        } finally {
            _is_loading = false;
            notifyListeners();
        }
    }

    void _setMapData(Map<String, dynamic> route_data) {
        _mapModels.clear();
        _detailMapUiDatas.clear();

        for (var data in route_data['data']) {
            _mapModels.add(model.MapModel.fromJson(data));
        }

        for (var mapModel in _mapModels) {
            _filterModels = _filterLoadViewModel.filterModels;
            _detailMapUiDatas.add(uidata.DetailMapUiData.fromModel(mapModel, _filterModels));
        }
    }

    LatLng _calcCenter(List<LatLng> points) {
        return LatLng(
            points.map((e) => e.latitude).reduce((a, b) => a + b) / points.length,
            points.map((e) => e.longitude).reduce((a, b) => a + b) / points.length,
        );
    }

    double _calcZoom(List<LatLng> points) {
        final latitudes = points.map((p) => p.latitude).toList();
        final longitudes = points.map((p) => p.longitude).toList();

        final latDiff = (latitudes.reduce((a, b) => a > b ? a : b) - latitudes.reduce((a, b) => a < b ? a : b)).abs();
        final lngDiff = (longitudes.reduce((a, b) => a > b ? a : b) - longitudes.reduce((a, b) => a < b ? a : b)).abs();

        final maxDiff = latDiff > lngDiff ? latDiff : lngDiff;

        if (maxDiff < 0.01) return 15.0;
        if (maxDiff < 0.05) return 13.0;
        if (maxDiff < 0.1) return 12.0;
        if (maxDiff < 0.5) return 10.0;
        return 8.0;
    }
}