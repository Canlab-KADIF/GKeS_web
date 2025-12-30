import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
    const CustomAppBar({super.key});

    @override
    Widget build(BuildContext context) {
        return AppBar(
            centerTitle: true,
            title: Text("Detail View"),
            actions: [
                ElevatedButton(
                    onPressed: () {
                        print("Pressed 1");
                    },
                    child: Text("Button 1"),
                ),
                ElevatedButton(
                    onPressed: () {
                        print("Pressed 2");
                    },
                    child: Text("Button 2"),
                )
            ]
        );
    }

    @override
    Size get preferredSize => Size.fromHeight(kToolbarHeight);
}