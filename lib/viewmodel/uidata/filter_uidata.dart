import 'package:abnormal_autonomous_web/view/common/functions.dart' as common_functions;
import 'package:abnormal_autonomous_web/viewmodel/uidata/filter_uidata.dart' as uidata;

class FilterUiData {
    final String category_ui;
    final String category_original;
    final List<FilterButtonUiData> buttons;

    FilterUiData({
        required this.category_ui,
        required this.category_original,
        required this.buttons,  // text, key, isSelected
    });

    factory FilterUiData.fromModel(String category, List<uidata.FilterButtonUiData> buttons) {
        return FilterUiData(
            category_ui: common_functions.snakeToTitleCase(category),
            category_original: category,
            buttons: buttons
        );
    }
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