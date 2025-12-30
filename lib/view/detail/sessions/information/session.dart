import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/view/detail/sessions/information/_sessions.dart' as sessions;

class InformationSession extends StatelessWidget {
    const InformationSession({super.key});

    @override
    Widget build(BuildContext context) {
        return DefaultTabController(
            length: 5,
            child: Column(
                children: [
                    TabBar(
                        tabs: [
                            Tab(text: 'Info'),
                            Tab(text: 'Log Header'),
                            Tab(text: 'Meta'),
                            Tab(text: 'Abnormal Driving Cause'),
                            Tab(text: 'User History'),
                        ],
                    ),
                    Expanded(
                        child: TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                                sessions.InfoSession(),
                                sessions.LogHeaderSession(),
                                sessions.MetaSession(),
                                sessions.AbnormalDrivingCauseSession(),
                                sessions.UserHistorySession(),
                            ],
                        ),
                    )
                ],
                        
            )
        );
    }
}