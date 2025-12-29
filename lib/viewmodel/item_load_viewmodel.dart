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
    String? _searchQuery;
        
    List<model.ItemModel> get itemModels => _itemModels;
    model.PageModel get pageModel => _pageModel;
    bool get isLoading => _isLoading;
    String? get error => _error;

    ItemLoadViewModel(this._itemService) {
        fetchFilterData();
    }

    Future<void> fetchFilterData({Map<String, List<int>>? filters, int? page, String? searchQuery}) async {
        _isLoading = true;
        _error = null;
        notifyListeners();

        _filters = filters ?? _filters;
        _page = page ?? _page;
        _searchQuery = searchQuery ?? _searchQuery;

        try {
            final rawList = await _itemService.searchItems(filters: _filters, page: _page, searchQuery: _searchQuery);
            final datas = rawList['datas'] as List<dynamic>;
            final pages = rawList['pages'] as Map<String, dynamic>;
            _itemModels = datas.map((json) => model.ItemModel.fromJson(json)).toList();
            _pageModel = model.PageModel.fromJson(pages);
        } catch (e) {
            _error = e.toString();
        } finally {
            _isLoading = false;
            notifyListeners();
        }
    }

}