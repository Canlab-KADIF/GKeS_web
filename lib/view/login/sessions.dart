import 'package:flutter/material.dart';
import 'package:abnormal_autonomous_web/view/login/styles/session_styles.dart' as styles;
import 'package:abnormal_autonomous_web/view/login/widgets.dart' as widgets;
import 'package:abnormal_autonomous_web/viewmodel/_viewmodel.dart' as vm;

class LoginBackground extends StatelessWidget {
    const LoginBackground({super.key});
    
    @override
    Widget build(BuildContext context) {
        return Stack(
            children: [
                widgets.BackgroundImage(),
                widgets.DarkOverlay(),
            ],
        );
    }
}

class LoginBox extends StatelessWidget {
    final vm.LoginViewModel view_model;
    final Function() onLoginButtonPressed;
    const LoginBox({super.key, required this.view_model, required this.onLoginButtonPressed});

    @override
    Widget build(BuildContext context) {
        return Center(
            child: Container(
                width: styles.LoginBoxStyles.width,
                height: styles.LoginBoxStyles.height,
                padding: styles.LoginBoxStyles.padding,
                decoration: styles.LoginBoxStyles.decoration,
                child: Column(
                    children: [
                        widgets.ServiceLogo(),
                        widgets.LoginInput(label: '아이디', onChanged: view_model.setID),
                        widgets.LoginInput(label: '비밀번호', onChanged: view_model.setPW),
                        widgets.LoginButton(
                            onPressed: onLoginButtonPressed,
                            isLoading: view_model.isLoading,
                        ),
                    ],
                ),
            )
        );
    }
}