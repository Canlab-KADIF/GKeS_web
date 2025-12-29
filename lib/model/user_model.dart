import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
    String _id;
    String _pw;
    String? _name;
    
    UserModel({
        required String id,
        required String pw,
        String? name,
    }): _id = id,
        _pw = pw,
        _name = name;

    // Getter
    String get id => _id;
    String get pw => _pw;
    String? get name => _name;

    // Setter
    void setUser({required String id, required String pw, String? name}) {
        _id = id;
        _pw = pw;
        _name = name;
        notifyListeners();
    }

    void clear() {
        _id = '';
        _pw = '';
        _name = null;
        notifyListeners();
    }

}