import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:abnormal_autonomous_web/viewmodel/_viewmodel.dart' as vm;
import 'package:abnormal_autonomous_web/view/detail/sessions/informations/sessions/abnormal_driving_cause/components.dart' as components;
import 'package:abnormal_autonomous_web/view/detail/sessions/informations/sessions/abnormal_driving_cause/styles/session_styles.dart' as styles;
import 'package:abnormal_autonomous_web/view/common/widgets.dart' as common_widgets;

class AbnormalDrivingCauseSession extends StatelessWidget {
    const AbnormalDrivingCauseSession({super.key});

    @override
    Widget build(BuildContext context) {
        final view_model = Provider.of<vm.ItemDetailCauseViewModel>(context);

        if (view_model.is_loading != null && view_model.is_loading == true) {
            return common_widgets.LoadingWidget();
        }

        if (view_model.error != null) {
            return Center(child: Text(view_model.error!, style: TextStyle(color: Colors.red),));
        }

        return Container(
            color: styles.AbnormalDrivingCauseSessionStyle.backgroundColor,

            child: Padding(
                padding: styles.AbnormalDrivingCauseSessionStyle.padding,

                child: Column(
                    children: [
                        components.RowComponent(
                            name: 'Cause:',
                            value: '',
                        ),

                        components.RowComponent(
                            name: 'Scenario',
                            value: '',
                            border: false,
                        ),

                        components.BoxComponent(
                            children: [
                                components.RowComponent(
                                    name: 'Description:',
                                    value: view_model.description ?? 'no data',
                                ),
                                
                                components.RowComponent(
                                    name: 'Scenario Id:',
                                    value: '',
                                ),
                            ],
                        ),

                        components.RowComponent(
                            name: 'Discerend Abnormal Region:',
                            value: '',
                        ),
                    ],
                )
                
            )
        );
    }
}