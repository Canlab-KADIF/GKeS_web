import 'package:flutter/material.dart';

class ItemDetailVideoViewModel extends ChangeNotifier {
    String? _video_path;

    ItemDetailVideoViewModel();

    String? get video_path => _video_path;

    void setVideoPath(String video_path) {
        _video_path = video_path;
        notifyListeners();
    }
}