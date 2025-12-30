import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/model/_model.dart' as model;
import 'package:abnormal_autonomous_web/viewmodel/uidata/_uidata.dart' as uidata;
import 'package:abnormal_autonomous_web/viewmodel/_viewmodel.dart' as vm;

class FilterViewModel extends ChangeNotifier {
    final vm.FilterLoadViewModel _filterLoadViewModel;
    final vm.ItemLoadViewModel _itemLoadViewModel;
    
    late VoidCallback _onFilterLoadComplete;

    List<model.FilterModel> _filterModels = [];
    List<uidata.FilterUiData> _filterUiDatas = [];
    int _selectedFiltersKeyNumber = 0;

    List<uidata.FilterUiData> get filterUiDatas => _filterUiDatas;
    int get selectedFiltersKeyNumber => _selectedFiltersKeyNumber;
    bool get isLoading => _filterLoadViewModel.isLoading;
    String? get error => _filterLoadViewModel.error;

    FilterViewModel(this._filterLoadViewModel, this._itemLoadViewModel) {
        _onFilterLoadComplete = () {
            if (!_filterLoadViewModel.isLoading && _filterLoadViewModel.error == null) {
                _fetchAllFilters();
            }
        };
        _filterLoadViewModel.addListener(_onFilterLoadComplete);
    }

    @override
    void dispose() {
        _filterLoadViewModel.removeListener(_onFilterLoadComplete);
        super.dispose();
    }

    Future<void> _fetchAllFilters() async {
        _filterModels = _filterLoadViewModel.filterModels;
        _getFilterDatas();
        notifyListeners();
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
        _update();
        notifyListeners();
    }
    
    void clearAllSelections() {
        for (var filter_ui_data in _filterUiDatas) {
            for (var button_ui_data in filter_ui_data.buttons) {
                if (button_ui_data.isSelected) {
                    button_ui_data.isSelected = false;
                    print("[filter_viewmodel.dart] ${button_ui_data.text} is cleared");
                }
            }
        }
        _update();
        notifyListeners();
    }

    void _update() {
        _fetchFilteredItems();
        _updateSelectedFiltersKeyNumber();
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

    void _fetchFilteredItems() {
        Map<String, List<int>> filters = {};
        for (var filter_ui_data in _filterUiDatas) {
            for (var button_ui_data in filter_ui_data.buttons) {
                if (button_ui_data.isSelected) {
                    if (filters[filter_ui_data.category] == null) {
                        filters[filter_ui_data.category] = [button_ui_data.key];
                    }
                    else {
                        filters[filter_ui_data.category]!.add(button_ui_data.key);
                    }
                }
            }
        }
        _itemLoadViewModel.fetchFilterData(filters);
    }
}