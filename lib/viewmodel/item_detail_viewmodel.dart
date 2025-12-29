import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/model/_model.dart' as model;
import 'package:abnormal_autonomous_web/viewmodel/_viewmodel.dart' as vm;

class ItemDetailViewModel extends ChangeNotifier {

    final vm.ItemDetailTitleViewModel _itemDetailTitleViewModel;
    final vm.ItemDetailVideoViewModel _itemDetailVideoViewModel;
    final vm.ItemDetailInfoViewModel _itemDetailInfoViewModel;
    final vm.ItemDetailLogHeaderViewModel _itemDetailLogHeaderViewModel;
    final vm.ItemDetailCauseViewModel _itemDetailCauseViewModel;
    final vm.ItemDetailMapViewModel _itemDetailMapViewModel;

    String? _id;
    model.ItemModel? _itemModel;

    ItemDetailViewModel(
        this._itemDetailTitleViewModel,
        this._itemDetailVideoViewModel,
        this._itemDetailInfoViewModel,
        this._itemDetailLogHeaderViewModel,
        this._itemDetailCauseViewModel,
        this._itemDetailMapViewModel,
    );

    String? get id => _id;
    Map<String, dynamic>? get filters => _itemModel?.filters;


    void setItemDetail(model.ItemModel itemModel) {
        _itemModel = itemModel;
        _setDetails();
        notifyListeners();
    }

    void _setDetails() {
        final id = _itemModel?.id;
        final data_paths = _itemModel?.data_paths;
        final video_path = data_paths?['video'];
        final meta_data_path = data_paths?['meta'];
        final route_data_path = data_paths?['route'];
        
        _itemDetailTitleViewModel.setId(id!);
        _itemDetailVideoViewModel.setVideoPath(video_path!);
        _itemDetailInfoViewModel.setFilters(_itemModel!.filters!);
        _itemDetailLogHeaderViewModel.setLogHeader(meta_data_path!);
        _itemDetailCauseViewModel.setDescription(meta_data_path!);
        _itemDetailMapViewModel.setMapData(route_data_path!);
        _id = id;
        
        notifyListeners();
    }
}
