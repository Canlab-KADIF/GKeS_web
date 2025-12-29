import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/view/detail/sessions/informations/sessions/_sessions.dart' as sessions;
import 'package:abnormal_autonomous_web/view/detail/sessions/informations/components.dart' as components;

class InformationsSession extends StatelessWidget {
    const InformationsSession({super.key});

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: const EdgeInsets.only(left: 32, right: 32, top: 20, bottom: 20),

            child: DefaultTabController(
                length: 4,

                child: Column(
                    children: [
                        components.TabBarComponent(),
                        
                        components.TarBarViewComponent(
                            children: [
                                sessions.InformationSession(),
                                sessions.LogHeaderSession(),
                                sessions.AbnormalDrivingCauseSession(),
                                sessions.UserHistorySession(),
                            ],
                        )
                    ]
                )
            )
        );
    }
}