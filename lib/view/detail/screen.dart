import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:abnormal_autonomous_web/viewmodel/_viewmodel.dart' as vm;
import 'package:abnormal_autonomous_web/view/detail/sessions/_sessions.dart' as sessions;

class DetailScreen extends StatelessWidget {
    const DetailScreen({super.key});

    @override
    Widget build(BuildContext context) {
        final view_model = Provider.of<vm.ItemDetailViewModel>(context);
        
        return Scaffold(
            appBar: sessions.CustomAppBar(),

            body: MultiSplitView(
                axis: Axis.horizontal,
                controller: MultiSplitViewController(areas: [
                    Area(weight: 0.4),
                    Area(weight: 0.6),
                ]),

                children: [
                    Container(
                        child: Column(
                            children: [

                                sessions.TitleSession(id: view_model.id),

                                    Expanded(
                                        child: MultiSplitView(
                                            axis: Axis.vertical,
                                            controller: MultiSplitViewController(areas: [
                                                Area(weight: 0.4),
                                                Area(weight: 0.6),
                                            ]),

                                            children: [
                                                sessions.VideoSession(video_path: view_model.video_path),
                                                sessions.MapSession(),
                                            ],
                                        ),
                                    )

                                ]
                            )
                    ),
                    sessions.InformationSession(),

                ],
            )
        );
    }
}
