import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/service/_service.dart' as service;
import 'package:abnormal_autonomous_web/viewmodel/_viewmodel.dart' as vm;

class LoginViewModel extends ChangeNotifier {
    final vm.UserViewModel _userViewModel;
    final service.IAuthService _authService;
    
    LoginViewModel(this._userViewModel, this._authService);

    String _id = '';
    String _pw = '';
    bool? _success = null;
    bool _isLoading = false;

    String get id => _id;
    String get pw => _pw;
    bool? get success => _success;
    bool get isLoading => _isLoading;

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
            _userViewModel.setUserModel(id: _id, pw: _pw, name: name);
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