import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/model/_model.dart' as model;

class UserViewModel extends ChangeNotifier {
    model.UserModel _userModel = model.UserModel(id: '', pw: '');

    model.UserModel get userModel => _userModel;

    void setUserModel({required String id, required String pw, String? name}) {
        _userModel = _userModel.copyWith(id: id, pw: pw, name: name);
        notifyListeners();
    }

    void clear() {
        _userModel = model.UserModel(id: '', pw: '');
        notifyListeners();
    }
}