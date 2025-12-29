import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/viewmodel/_viewmodel.dart' as vm;
import 'package:abnormal_autonomous_web/model/_model.dart' as model;
import 'package:abnormal_autonomous_web/viewmodel/uidata/_uidata.dart' as uidata;

class ItemListViewModel extends ChangeNotifier {
	final vm.ItemLoadViewModel _itemLoadViewModel;
	final vm.FilterLoadViewModel _filterLoadViewModel;

	List<model.ItemModel> _itemModels = [];
	List<uidata.ItemUiData> _itemUiDatas = [];
	List<model.FilterModel> _filterModels = [];

	List<uidata.ItemUiData> get itemUiDatas => _itemUiDatas;
	bool get isLoading => _itemLoadViewModel.isLoading || _filterLoadViewModel.isLoading;
	String? get error => _itemLoadViewModel.error ?? _filterLoadViewModel.error;

	ItemListViewModel(this._itemLoadViewModel, this._filterLoadViewModel) {
		_itemLoadViewModel.addListener(_onDataChanged);
		_filterLoadViewModel.addListener(_onDataChanged);
	}

	@override
	void dispose() {
		_itemLoadViewModel.removeListener(_onDataChanged);
		_filterLoadViewModel.removeListener(_onDataChanged);
		super.dispose();
	}

	void _onDataChanged() {
		if (!isLoading && error == null) {
			_fetchCombinedData();
		}
	}

	Future<void> _fetchCombinedData() async {
		_itemModels = _itemLoadViewModel.itemModels;
		_filterModels = _filterLoadViewModel.filterModels;

		_itemUiDatas = _itemModels.map(
			(itemModel) => uidata.ItemUiData.fromModel(itemModel, _filterModels),
		).toList();
		notifyListeners();
	}

    model.ItemModel returnItemModel(int index) {
        return _itemModels[index];
    }
}
