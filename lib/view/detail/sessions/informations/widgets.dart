import 'package:flutter/material.dart';

class InformationsTabButtonWidget extends StatelessWidget {
    final String title;

    const InformationsTabButtonWidget({super.key, required this.title});

    @override
    Widget build(BuildContext context) {
        return Container(
            child: Text(title),
        );
    }
}