import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/service/_service.dart' as service;
import 'package:abnormal_autonomous_web/model/_model.dart' as model;

class ItemLoadViewModel extends ChangeNotifier {
    final service.IItemService _itemService;

    List<model.ItemModel> _itemModels = [];
    model.PageModel _pageModel = model.PageModel();
    bool _isLoading = false;
    String? _error;
    Map<String, List<int>> _filters = {};
    int _page = 1;
        
    List<model.ItemModel> get itemModels => _itemModels;
    model.PageModel get pageModel => _pageModel;
    bool get isLoading => _isLoading;
    String? get error => _error;
    
    ItemLoadViewModel(this._itemService) {
        fetchFilterData(null, null);
    }

    Future<void> fetchFilterData(Map<String, List<int>>? filters, int? page) async {
        _isLoading = true;
        _error = null;
        notifyListeners();

        _filters = filters ?? _filters;
        _page = page ?? _page;

        try {
            final rawList = await _itemService.searchItems(filters: _filters, page: _page);
            final datas = rawList['datas'] as List<dynamic>;
            final pages = rawList['pages'] as Map<String, dynamic>;
            _itemModels = datas.map((json) => model.ItemModel.fromJson(json)).toList();
            _pageModel = model.PageModel.fromJson(pages);
        } catch (e) {
            print(e);
            _error = e.toString();
        } finally {
            _isLoading = false;
            notifyListeners();
        }
    }

}