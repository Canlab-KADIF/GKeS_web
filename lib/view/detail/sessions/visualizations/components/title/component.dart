import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/view/detail/sessions/visualizations/components/title/widgets.dart' as widgets;
import 'package:abnormal_autonomous_web/view/detail/sessions/visualizations/components/title/styles/component_styles.dart' as styles;
import 'package:abnormal_autonomous_web/viewmodel/_viewmodel.dart' as vm;
import 'package:provider/provider.dart';

class TitleComponent extends StatelessWidget {
    const TitleComponent({super.key});

    @override
    Widget build(BuildContext context) {
        final view_model = Provider.of<vm.ItemDetailViewModel>(context);

        return Padding(
            padding: styles.TitleComponentStyle.padding,

            child: Container(
                height: styles.TitleComponentStyle.height,
                alignment: styles.TitleComponentStyle.alignment,   

                child: widgets.TitleWidget(id: view_model.id),
            )
        );
    }
}