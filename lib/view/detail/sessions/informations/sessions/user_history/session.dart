import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/view/detail/sessions/informations/sessions/user_history/styles/session_styles.dart' as styles;

class UserHistorySession extends StatelessWidget {
    const UserHistorySession({super.key});

    @override
    Widget build(BuildContext context) {
        return Container(
            color: styles.UserHistorySessionStyle.backgroundColor,

            // child: Padding(
            //     padding: styles.UserHistorySessionStyle.padding,

            //     child: Text(
            //         style: const TextStyle(color: Colors.white),

            //         "User History Component"
            //     ),
            // ),
        );
    }
}