abstract class IDownloadService {
    Future<Map<String, dynamic>> getDownloadList(String id);
}

abstract class IPackageDownloadService {
    Future<Map<String, dynamic>> packageDownload(String id);
}