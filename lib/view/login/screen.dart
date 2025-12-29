import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:abnormal_autonomous_web/view/login/sessions.dart' as sessions;
import 'package:abnormal_autonomous_web/viewmodel/_viewmodel.dart' as vm;

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final view_model = Provider.of<vm.LoginViewModel>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            sessions.LoginBackground(),
            sessions.LoginBox(
                view_model: view_model,
                onLoginButtonPressed: () async {
                    final success = await view_model.login();
                    if (success) {
                        Navigator.pushNamed(context, '/home');
                    }
                }
            ),
          ],
        ),
      ),
    );
  }
}
