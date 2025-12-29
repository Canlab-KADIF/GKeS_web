import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/model/_model.dart' as model;

class ItemDetailViewModel extends ChangeNotifier {
    model.ItemModel? _itemModel;

    String _id = '';
    String _imageUrl = '';
    String _description = '';
    bool _isLoading = false;
    String? _error = null;

    ItemDetailViewModel();

    model.ItemModel? get itemModel => _itemModel;
    String get id => _id;
    String get imageUrl => _imageUrl;
    String get description => _description;
    bool get isLoading => _isLoading;
    String? get error => _error;

    void setItemModel(model.ItemModel itemModel) {
        _itemModel = itemModel;
        _id = itemModel.id;
        _imageUrl = itemModel.imageUrl;
        _description = itemModel.description ?? '';
        notifyListeners();
    }

}