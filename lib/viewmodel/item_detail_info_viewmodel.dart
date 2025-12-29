import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/model/_model.dart' as model;
import 'package:abnormal_autonomous_web/viewmodel/_viewmodel.dart' as vm;
import 'package:abnormal_autonomous_web/viewmodel/uidata/_uidata.dart' as uidata;

class ItemDetailInfoViewModel extends ChangeNotifier {
	final vm.FilterLoadViewModel _filterLoadViewModel;

    Map<String, dynamic>? _filters;
	List<model.FilterModel> _filterModels = [];
    uidata.DetailInfoUiData? _infoUiDatas;
    List<Map<String, dynamic>>? get infoUiDatas_normal => _infoUiDatas?.infoUiDatas_normal;
    List<Map<String, dynamic>>? get infoUiDatas_scene_context => _infoUiDatas?.infoUiDatas_scene_context;
    List<Map<String, dynamic>>? get infoUiDatas_environment => _infoUiDatas?.infoUiDatas_environment;

    bool get isLoading => _filterLoadViewModel.isLoading;
    String? get error => _filterLoadViewModel.error;

    ItemDetailInfoViewModel(this._filterLoadViewModel);

    Future<void> setFilters(Map<String, dynamic> filters) async {
        _filters = filters;
        _filterModels = _filterLoadViewModel.filterModels;
        _infoUiDatas = uidata.DetailInfoUiData.fromModel(_filters!, _filterModels);
    }
}