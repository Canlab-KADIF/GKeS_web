import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/service/_service.dart' as service;
import 'package:abnormal_autonomous_web/model/_model.dart' as model;

class FilterLoadViewModel extends ChangeNotifier {
    final service.IFilterService _filterService;

    List<model.FilterModel> _filterModels = [];
    bool _isLoading = false;
    String? _error;

    FilterLoadViewModel(this._filterService) {
        _fetchFilterData();
    }

    List<model.FilterModel> get filterModels => _filterModels;
    bool get isLoading => _isLoading;
    String? get error => _error;

    Future<void> _fetchFilterData() async {
        _isLoading = true;
        _error = null;
        notifyListeners();

        try {
            final rawList = await _filterService.fetchAllFilters();
            _filterModels = rawList.map((json) => model.FilterModel.fromJson(json)).toList();
        } catch (e) {
            _error = e.toString();
        } finally {
            _isLoading = false;
            notifyListeners();
        }
    }
}