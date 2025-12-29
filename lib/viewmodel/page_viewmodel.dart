import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/viewmodel/_viewmodel.dart' as vm;
import 'package:abnormal_autonomous_web/model/_model.dart' as model;

class PageViewModel extends ChangeNotifier {
	final vm.ItemLoadViewModel _itemLoadViewModel;

	model.PageModel _pageModel = model.PageModel();

    int get totalItems => _pageModel.total_items;
    int get currentPage => _pageModel.current_page;
    int get totalPages => _pageModel.total_pages;
    int get pageSize => _pageModel.page_size;

	PageViewModel(this._itemLoadViewModel) {
		_itemLoadViewModel.addListener(_onDataChanged);
	}

    @override
    void dispose() {
        _itemLoadViewModel.removeListener(_onDataChanged);
        super.dispose();
    }

    void _onDataChanged() {
        _pageModel = _itemLoadViewModel.pageModel;
        notifyListeners();
    }

    void setCurrentPage(int page) {
        _itemLoadViewModel.fetchFilterData(page: page);
        notifyListeners();
    }
}