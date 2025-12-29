import 'package:flutter/material.dart';

class ItemDetailTitleViewModel extends ChangeNotifier {
    String? _id;

    ItemDetailTitleViewModel();

    String? get id => _id;

    void setId(String id) {
        _id = id;
        notifyListeners();
    }
}