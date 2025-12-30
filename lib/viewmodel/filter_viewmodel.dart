import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/service/_service.dart' as service;
import 'package:abnormal_autonomous_web/model/_model.dart' as model;
import 'package:abnormal_autonomous_web/viewmodel/uidata/_uidata.dart' as uidata;

class FilterViewModel extends ChangeNotifier {
    final service.IFilterService _filterService;

    List<model.FilterModel> _filterModels = [];
    List<uidata.FilterUiData> _filterUiDatas = [];
    int _selectedFiltersKeyNumber = 0;
    bool _isLoading = false;
    String? _error;

    List<uidata.FilterUiData> get filterUiDatas => _filterUiDatas;
    int get selectedFiltersKeyNumber => _selectedFiltersKeyNumber;
    bool get isLoading => _isLoading;
    String? get error => _error;

    FilterViewModel(this._filterService) {
        _fetchAllFilters();
    }

    Future<void> _fetchAllFilters() async {
        _isLoading = true;
        _error = null;
        notifyListeners();

        try {
            final rawList = await _filterService.fetchAllFilters();
            _filterModels = rawList.map((json) => model.FilterModel.fromJson(json)).toList();
            _getFilterDatas();
        } catch (e) {
            _error = e.toString();
        } finally {
            _isLoading = false;
            notifyListeners();
        }
    }
    
    void _getFilterDatas() {
        _filterUiDatas.clear();

        for (var filter_model in _filterModels) {
            final buttons = filter_model.enums.entries.map((entry) {
                return uidata.FilterButtonUiData(
                    text: entry.value.toString(),
                    key: int.parse(entry.key),
                );
            }).toList();

            _filterUiDatas.add(uidata.FilterUiData(
                category: filter_model.db_column,
                buttons: buttons,
            ));
        }
    }

    void toggleButtonSelection(String category, int key) {
        for (var filter_ui_data in _filterUiDatas) {
            if (filter_ui_data.category == category) {
                for (var button_ui_data in filter_ui_data.buttons) {
                    if (button_ui_data.key == key) {
                        button_ui_data.isSelected = !button_ui_data.isSelected;
                        if (button_ui_data.isSelected) {
                            print("[filter_viewmodel.dart] ${button_ui_data.text} is selected");
                        }
                        else {
                            print("[filter_viewmodel.dart] ${button_ui_data.text} is not selected");
                        }
                    }
                }
            }
        }
        _updateSelectedFiltersKeyNumber();
        notifyListeners();
    }
    
    void clearAllSelections() {
        for (var filter_ui_data in _filterUiDatas) {
            for (var button_ui_data in filter_ui_data.buttons) {
                button_ui_data.isSelected = false;
            }
        }
        _updateSelectedFiltersKeyNumber();
        notifyListeners();
    }
    
    void _updateSelectedFiltersKeyNumber() {
        _selectedFiltersKeyNumber = 0;
        for (var filter_ui_data in _filterUiDatas) {
            for (var button_ui_data in filter_ui_data.buttons) {
                if (button_ui_data.isSelected) {
                    _selectedFiltersKeyNumber++;
                }
            }
        }
    }
}