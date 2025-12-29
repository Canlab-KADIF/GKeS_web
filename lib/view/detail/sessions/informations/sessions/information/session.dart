import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:abnormal_autonomous_web/viewmodel/_viewmodel.dart' as vm;
import 'package:abnormal_autonomous_web/view/detail/sessions/informations/sessions/information/components.dart' as components;
import 'package:abnormal_autonomous_web/view/detail/sessions/informations/sessions/information/styles/session_styles.dart' as styles;

class InformationSession extends StatelessWidget {
    const InformationSession({super.key});

    @override
    Widget build(BuildContext context) {
        final view_model = Provider.of<vm.ItemDetailInfoViewModel>(context);
        final infoUiDatas_normal = view_model.infoUiDatas_normal;
        final infoUiDatas_scene_context = view_model.infoUiDatas_scene_context;
        final infoUiDatas_environment = view_model.infoUiDatas_environment;

        return Container(
            color: styles.InformationSessionStyle.backgroundColor,
            
            child: Padding(
                padding: styles.InformationSessionStyle.padding,

                child: SingleChildScrollView(

                    child: Column(
                        children: [

                            for (var infoUiData in infoUiDatas_normal ?? [])
                                components.NormalRowComponent(
                                    name: infoUiData['name'] + ':',
                                    values: infoUiData['values'] as List<String>,
                                ),

                            components.NormalRowComponent(
                                name: 'Scene Context',
                                values: [],
                                border: false,
                            ),

                            components.BoxComponent(
                                children: [
                                    for (var infoUiData in infoUiDatas_scene_context ?? [])
                                        components.BoxRowComponent(
                                            name: infoUiData['name'] + ':',
                                            values: infoUiData['values'] as List<String>,
                                        ),
                                ],
                            ),

                            components.NormalRowComponent(
                                name: 'Environmental Conditions',
                                values: [],
                                border: false,
                            ),

                            components.BoxComponent(
                                children: [
                                    for (var infoUiData in infoUiDatas_environment ?? [])
                                        components.BoxRowComponent(
                                            name: infoUiData['name'] + ':',
                                            values: infoUiData['values'] as List<String>,
                                        ),
                                ],
                            ),
                            
                        ],
                    ),
                ),
            )
        );
    }
}
