import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/view/home/sessions/_sessions.dart' as sessions;

class HomeScreen extends StatelessWidget {
    const HomeScreen({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Column(
                children: [
                    sessions.CustomAppBar(),
                    Row(
                        children: [
                            sessions.FilterMenu(),
                            Expanded(child: sessions.ItemList())
                        ]
                    )
                ]
            )
        );
    }
}