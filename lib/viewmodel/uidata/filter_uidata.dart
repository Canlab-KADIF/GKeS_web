class FilterUiData {
    final String category;
    final List<FilterButtonUiData> buttons;

    FilterUiData({
        required this.category, // db_column
        required this.buttons,  // text, key, isSelected
    });
}

class FilterButtonUiData {
    final String text;
    final int key;
    bool isSelected;

    FilterButtonUiData({
        required this.text,
        required this.key,
        this.isSelected = false,
    });
}