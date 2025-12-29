import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/service/_service.dart' as service;
import 'package:abnormal_autonomous_web/model/_model.dart' as model;

class LoginViewModel extends ChangeNotifier {
    final model.UserModel _userModel;
    final service.IAuthService _authService;
    
    LoginViewModel(this._userModel, this._authService);

    String _id = '';
    String _pw = '';
    bool? _success = null;
    bool _isLoading = false;

    String get id => _id;
    String get pw => _pw;
    bool? get success => _success;
    bool get isLoading => _isLoading;

    void updateUserModel(model.UserModel userModel) {
        if (_userModel != userModel) {
            print("⚠️ User Model is Updated, checked in LoginViewModel");
        }
        // (선택사항)
        // Provider에서 ProxyProvider로 업데이트 될 때 호출됨
    }

    void updateAuthService(service.IAuthService authService) {
        if (_authService != authService) {
            print("⚠️ Auth Service is Updated, checked in LoginViewModel");
        }
        // (선택사항)
        // Provider에서 ProxyProvider로 업데이트 될 때 호출됨
    }

    void setID(String id) {
        _id = id;
        // notifyListeners();
    }

    void setPW(String pw) {
        _pw = pw;
        // notifyListeners();
    }

    Future<bool> login() async {
        _isLoading = true;
        notifyListeners();

        final name = await _authService.login(_id, _pw);

        _isLoading = false;

        if (name != null) {
            _userModel.setUser(id: _id, pw: _pw, name: name);
            _success = true;
            notifyListeners();
            return true;
        } else {
            _success = false;
            notifyListeners();
            return false;
        }
    }

}