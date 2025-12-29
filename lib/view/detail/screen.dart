import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:abnormal_autonomous_web/viewmodel/_viewmodel.dart' as vm;
import 'package:abnormal_autonomous_web/view/detail/sessions/_sessions.dart' as sessions;
import 'package:abnormal_autonomous_web/view/detail/components.dart' as components;
import 'package:abnormal_autonomous_web/view/detail/styles/screen_styles.dart' as styles;

class DetailScreen extends StatelessWidget {
    const DetailScreen({super.key});

    @override
    Widget build(BuildContext context) {
        final view_model = Provider.of<vm.ItemDetailViewModel>(context);
        
        return Scaffold(
            backgroundColor: styles.DetailScreenStyle.backgroundColor,

            appBar: sessions.CustomAppBar(
                download_button_pressed: () {
                    sessions.DownloadDialogSession(context, view_model.id);
                },
                labeling_button_pressed: () {
                    print("Pressed 라벨링 내보내기");
                }
            ),

            body: MultiSplitView(
                axis: Axis.horizontal,
                controller: MultiSplitViewController(areas: [
                    Area(weight: styles.DetailScreenStyle.visualizations_session_width),
                    Area(weight: styles.DetailScreenStyle.informations_session_width),
                ]),

                dividerBuilder: (axis, index, resizable, dragging, highlighted, themeData) {
                    return components.DividerComponent();
                },
                
                children: [
                    sessions.VisualizationsSession(),
                    sessions.InformationsSession(),
                ],
            )
        );
    }
}
