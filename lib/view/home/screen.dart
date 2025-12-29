import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/view/home/item_list/screen.dart';

class HomeScreen extends StatelessWidget {
    const HomeScreen({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: ItemListScreen(),
        );
    }
}