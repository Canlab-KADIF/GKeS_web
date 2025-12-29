import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/service/_service.dart' as service;
import 'package:abnormal_autonomous_web/model/_model.dart' as model;

class ItemListViewModel extends ChangeNotifier {
    final service.IItemService _itemService;

    List<model.ItemModel> _allItems = [];
    List<model.ItemModel> _filteredItems = [];
    List<String> _selectedTags = [];
    bool _isLoading = false;
    String? _error;

    List<model.ItemModel> get items => _filteredItems;
    List<String> get selectedTags => _selectedTags;
    bool get isLoading => _isLoading;
    String? get error => _error;

    ItemListViewModel(this._itemService) {
        fetchAllItems();
    }

    Future<void> fetchAllItems() async {
        _isLoading = true;
        _error = null;
        notifyListeners();

        try {
            final items = await _itemService.fetchAllItems();
            _allItems = items.map((item) => model.ItemModel.fromJson(item)).toList();
            _applyFilters();
        } catch (e) {
            _error = e.toString();
        } finally {
            _isLoading = false;
            notifyListeners();
        }
    }

    Future<void> searchItems(String keyword) async {
        _isLoading = true;
        _error = null;
        notifyListeners();

        try {
            final items = await _itemService.searchItems(keyword);
            _allItems = items.map((item) => model.ItemModel.fromJson(item)).toList();
            _applyFilters();
        } catch (e) {
            _error = e.toString();
        } finally {
            _isLoading = false;
            notifyListeners();
        }
    }
    
    void _applyFilters() {
        if (_selectedTags.isEmpty) {
            _filteredItems = _allItems;
        } else {
            _filteredItems = _allItems.where((item) => item.tags.any((tag) => _selectedTags.contains(tag))).toList();
        }
    }

    void addTag(String tag) {
        if (!_selectedTags.contains(tag)) {
            _selectedTags.add(tag);
            _applyFilters();
            notifyListeners();
        }
    }

    void removeTag(String tag) {
        _selectedTags.remove(tag);
        _applyFilters();
        notifyListeners();
    }

    void clearTags() {
        _selectedTags.clear();
        _applyFilters();
        notifyListeners();
    }
}