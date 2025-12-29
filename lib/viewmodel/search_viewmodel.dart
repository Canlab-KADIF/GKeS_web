import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/viewmodel/_viewmodel.dart' as vm;

class SearchViewModel extends ChangeNotifier {
    final vm.ItemLoadViewModel _itemLoadViewModel;

    SearchViewModel(this._itemLoadViewModel);

    String _searchQuery = '';
    String get searchQuery => _searchQuery;

    void setSearchQuery(String query) {
        _searchQuery = query;
    }

    Future<void> search() async {
        await _itemLoadViewModel.fetchFilterData(searchQuery: _searchQuery);
        notifyListeners();
    }
}