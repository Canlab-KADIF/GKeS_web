import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/model/_model.dart' as model;

class ItemDetailViewModel extends ChangeNotifier {
    String? _id;
    String? _video_path;
    String? _meta_path;
    String? _route_path;
    model.ItemModel? _itemModel;

    ItemDetailViewModel();

    String? get id => _id;
    String? get video_path => _video_path;
    String? get meta_path => _meta_path;
    String? get route_path => _route_path;



    void setItemDetail(model.ItemModel itemModel) {
        _itemModel = itemModel;
        _setDataPaths();
        notifyListeners();
    }

    void _setDataPaths() {
        _id = _itemModel?.id;

        final data_paths = _itemModel?.data_paths;
        _video_path = data_paths?['video'];
        _meta_path = data_paths?['meta'];
        _route_path = data_paths?['route'];
        notifyListeners();
    }
}
