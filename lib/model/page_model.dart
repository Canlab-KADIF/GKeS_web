class PageModel {
    final int total_pages;
    final int current_page;
    final int page_size;
    final int total_items;

    PageModel({
        this.total_pages = 0,
        this.current_page = 0,
        this.page_size = 0,
        this.total_items = 0,
    });

    factory PageModel.fromJson(Map<String, dynamic> json) {
        return PageModel(
            total_pages: json['total_pages'] as int,
            current_page: json['current_page'] as int,
            page_size: json['page_size'] as int,
            total_items: json['total_items'] as int,
        );
    }
}