import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/service/_service.dart' as service;
import 'package:abnormal_autonomous_web/model/_model.dart' as model;

class ItemLoadViewModel extends ChangeNotifier {
    final service.IItemService _itemService;

    List<model.ItemModel> _itemModels = [];
    bool _isLoading = false;
    String? _error;

    List<model.ItemModel> get itemModels => _itemModels;
    bool get isLoading => _isLoading;
    String? get error => _error;

    ItemLoadViewModel(this._itemService) {
        _fetchAllItems();
    }

    Future<void> _fetchAllItems() async {
        _isLoading = true;
        _error = null;
        notifyListeners();

        try {
            final rawList = await _itemService.searchItems();
            _itemModels = rawList.map((json) => model.ItemModel.fromJson(json)).toList();
            
        } catch (e) {
            _error = e.toString();
        } finally {
            _isLoading = false;
            notifyListeners();
        }
    }

}