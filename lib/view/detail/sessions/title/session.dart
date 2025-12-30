import 'package:flutter/material.dart';

class TitleSession extends StatelessWidget {
    final String? id;

    const TitleSession({super.key, this.id});

    @override
    Widget build(BuildContext context) {
        return Container(
            color: Colors.green,
            width: double.infinity,
            height: 40,
            
            child: Text(id ?? 'no data'),
        );
    }
}