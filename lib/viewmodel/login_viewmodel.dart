import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/service/_service.dart' as service;
import 'package:abnormal_autonomous_web/model/_model.dart' as model;

class LoginViewModel extends ChangeNotifier {
    final service.AuthService _authService = service.AuthService();

    String _id = '';
    String _pw = '';
    String? _error;
    bool _isLoading = false;
    model.UserModel _user = model.UserModel(id: '', pw: '');

    String get id => _id;
    String get pw => _pw;
    String? get error => _error;
    bool get isLoading => _isLoading;
    model.UserModel get user => _user;

    void setID(String id) {
        _id = id;
        notifyListeners();
    }

    void setPW(String pw) {
        _pw = pw;
        notifyListeners();
    }

    Future<bool> login() async {
        _isLoading = true;
        notifyListeners();

        final name = await _authService.login(_id, _pw);

        _isLoading = false;

        if (name != null) {
            _user = model.UserModel(id: _id, pw: _pw, name: name);
            _error = null;
            notifyListeners();
            return true;
        } else {
            _error = '로그인 실패';
            notifyListeners();
            return false;
        }
    }

}