import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/service/i_download_service.dart';
import 'package:abnormal_autonomous_web/model/_model.dart' as model;

class DownloadViewModel extends ChangeNotifier {
    final IDownloadService _downloadService;
    final IPackageDownloadService _packageDownloadService;
    model.DownloadModel? _downloadModel;
    List<Map<String, String>> _downloadPaths = [];

    bool _isLoading = false;
    String? _error;


    DownloadViewModel(this._downloadService, this._packageDownloadService);

    bool get isLoading => _isLoading;
    String? get error => _error;
    List<Map<String, String>> get downloadPaths => _downloadPaths;

    Future<void> getDownloadList(String id) async {
        _isLoading = true;
        notifyListeners();

        try {
            final response = await _downloadService.getDownloadList(id);
            _downloadModel = model.DownloadModel.fromJson(response);
            setDownloadPaths();
        } catch (e) {
            _error = e.toString();
        } finally {
            _isLoading = false;
            notifyListeners();
        }
    }

    Future<void> packageDownload(String id) async {
        _isLoading = true;
        notifyListeners();

        try {
            final response = await _packageDownloadService.packageDownload(id);
            final downloadUrl = response['url'];
            if (downloadUrl != null) {
                final anchor = html.AnchorElement(href: downloadUrl);
                anchor.target = '_blank';
                anchor.download = 'download.zip';
                anchor.click();
            }
        } catch (e) {
            _error = e.toString();
        } finally {
            _isLoading = false;
            notifyListeners();
        }
    }

    void setDownloadPaths() {
        _downloadPaths = _downloadModel?.list.map((path) => {
                'path': path,
                'name': path.split('/').last,
            }).toList() ?? [];
    }
}